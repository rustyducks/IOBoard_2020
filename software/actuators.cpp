#include "actuators.h"
#include "stdutil.h"


struct ActionParam
{
    Side side;
    Crane* crane;
};

struct action_thread {
    Actions action;     // the executed action
    int action_id;      // an id given by the master
    thread_t* thread;   // pointer to the worker thread
    ActionParam param;
};



static void start_next_action();
static bool actions_compatibles(struct action_thread a1, struct action_thread a2);


struct CraneConfig  crane_left_config = {
    .line_pump = LINE_PUMP1,
    .line_ev = LINE_EV1,
    .line_ev_pressure = LINE_EV_S,
    .ev_pressure_state = PAL_LOW,
	.elev_dyn_id = 1,
	.azim_dyn_id = 2
};



ADCConversionGroup adc1cfg = {
  .circular = false,
  .num_channels = 1,
  .end_cb = NULL,
  .error_cb = NULL,
  .cfgr = 0,
  .cfgr2 = 0,   //see for oversampling ?
  .tr1 = 0,
  .smpr = { (0x3U << ADC_SMPR1_SMP9_Pos), // 011: 24.5 ADC clock cycles
            0},                         //channels 18 to 10 unused
  .sqr = {(0x9U << ADC_SQR1_SQ1_Pos), 0, 0, 0}
};


Crane crane_left;

adcsample_t adc_pressure_threshold = BASE_PRESSURE_THRESHOLD;


static THD_WORKING_AREA(waTakeBuoy, 400);
static void take_buoy(void* arg) {
    chRegSetThreadName("take_buoy");
    struct ActionParam* ap = (struct ActionParam*) arg;

    //azimut to 0
    ap->crane->goAzimutTimeout(0, DYN_TIMEOUT, true);

    //start pump and get down
    ap->crane->start_pump();
    ap->crane->route_sensor();
    ap->crane->set_elevation(ELEVATION_BUOY);
    systime_t start = chVTGetSystemTime();
    //check pressure
    bool buoy_taken = false;
    while(TIME_I2MS(chVTTimeElapsedSinceX(start)) < TAKE_TIMEOUT) {
        if(pressure_low()) {
            buoy_taken = true;
            break;
        }
        chThdSleepMilliseconds(100);
    }
    ap->crane->release_sensor();
    
    //pressure still high, no buoy found!
    if(!buoy_taken) {
        chThdExit(ACTION_NO_BUOY);
    }

    //buoy taken, go up
    ap->crane->goElevationTimeout(ELEVATION_UP, DYN_TIMEOUT, true);

    //go left or right
    int az = AZIMUT(ap->side);
    ap->crane->goAzimutTimeout(az, DYN_TIMEOUT, true);

    //go down (holder drop)
    ap->crane->goElevationTimeout(ELEVATION_HOLDER_DROP, DYN_TIMEOUT, true);

    //release buoy
    ap->crane->open_ev();
    chThdSleepMilliseconds(500);

    //go up (the bellows will extend, so take margin)
    ap->crane->goElevationTimeout(ELEVATION_UP, DYN_TIMEOUT, true);
    ap->crane->close_ev();

    //go to azimut 0 again
    ap->crane->goAzimutTimeout(0, DYN_TIMEOUT, true);


   chThdExit(ACTION_OK);
}


static THD_WORKING_AREA(waSayHi, 400);
static void say_hi(void* arg) {
    chRegSetThreadName("say_hi");
    static int k=0;
    k++;
    struct ActionParam* ap = (struct ActionParam*) arg;

    for(int i=0; i<2;i++) {
        ap->crane->set_elevation(-50);
        chThdSleepMilliseconds(300);
        ap->crane->set_elevation(50);
        chThdSleepMilliseconds(300);
    }

    chThdExit(ACTION_OK);
   
}


action_thread actions[NB_ACTIONS];
action_thread queued_actions[NB_ACTIONS];
int queue_start = 0;

static THD_WORKING_AREA(waActionManager, 400);
static void action_manager(void* arg) {
    (void)arg;
    chRegSetThreadName("action_manager");
    while(true) {
        for(int i=0; i<NB_ACTIONS; i++) {
            // remove terminated actions and send status message
            if(actions[i].action != ACTION_NO_ACTION &&
               chThdTerminatedX(actions[i].thread)) {
                msg_t status = chThdWait(actions[i].thread);
                // TODO send status message
                

                actions[i].action = ACTION_NO_ACTION;
            }
        }
   
        if(queued_actions[queue_start].action != ACTION_NO_ACTION) {
            start_next_action();
        }
        
        chThdSleepMilliseconds(20);
    }
}


static void start_next_action() {
    // first search for a free slot in actions
    int action_idx = 0;
    for(int i=0; i<NB_ACTIONS; i++) {
        if(actions[i].action == ACTION_NO_ACTION) {
            action_idx = i;
            break;
        } else if(i == NB_ACTIONS-1) {
            // end of actions and still no free slot
            // return, will try next time
            return;
        }
    }

    // test compatibility with current actions
    for(int i=0; i<NB_ACTIONS; i++) {
        if(!actions_compatibles(actions[i], queued_actions[queue_start])) { // TODO check compatibility
            // action not compatible, will try next time
            return;
        }
    }

    // copy queued action info to action slot
    // do memcpy instead?
    actions[action_idx].action = queued_actions[queue_start].action;
    actions[action_idx].action_id = queued_actions[queue_start].action_id;
    actions[action_idx].param = queued_actions[queue_start].param;

    //create thread and spawn action, and store its thread pointer.
    switch (queued_actions[queue_start].action)
    {
    case ACTION_TAKE_BUOY:
        actions[action_idx].thread = chThdCreateStatic(waTakeBuoy, sizeof(waTakeBuoy), NORMALPRIO, &take_buoy, &(actions[action_idx].param));
        break;
    case ACTION_SAY_HI:
        actions[action_idx].thread = chThdCreateStatic(waSayHi, sizeof(waSayHi), NORMALPRIO, &say_hi, &(actions[action_idx].param));
    default:
        break;
    }

    queued_actions[queue_start].action = ACTION_NO_ACTION;  // reset slot
    queue_start = (queue_start + 1) % NB_ACTIONS;   // advance pointer
}


msg_t queue_action(Actions a, int id, ActionParam param) {
    for(int i=0; i<NB_ACTIONS; i++) {
        int idx = (queue_start + i) % NB_ACTIONS;
        if(queued_actions[idx].action == ACTION_NO_ACTION) {    // free slot!
            queued_actions[idx].action = a;
            queued_actions[idx].action_id = id;
            queued_actions[idx].param = param;
            return MSG_OK;
        }
    }
    // end of queue, no free slot !
    return -5;
}

static bool actions_compatibles(struct action_thread a1, struct action_thread a2) {
    //one of the side is no action, so no problem!
    if(a1.action == ACTION_NO_ACTION || a2.action == ACTION_NO_ACTION) {
        return true;
    }
    
    if(a1.param.crane == a2.param.crane) {
        // action act on the same crane
        return false;
    }


    // action act on different cranes
    switch (a1.action)
    {
    case ACTION_TAKE_BUOY:
        switch (a2.action)
        {
        case ACTION_TAKE_BUOY:
            return true;
        case ACTION_SAY_HI:
            return true;
        default:
            return false;
        }
    case ACTION_SAY_HI:
        switch (a2.action)
        {
        case ACTION_TAKE_BUOY:
            return true;
        case ACTION_SAY_HI:
            return true;
        default:
            return false;
        }
    
    default:
        return false;
        break;
    }

    if(a1.action == ACTION_TAKE_BUOY && a2.action == ACTION_TAKE_BUOY) {
        return true;    // take actions are ok
    }

    // unhandled case, say its not compatible by default
    return false;
}

bool pressure_low() {
    adcsample_t sample;
    if(adcConvert(&ADCD1, &adc1cfg, &sample, 1) == MSG_OK) {
        if(sample < adc_pressure_threshold) {
            return true;
        } else {
            return false;
        }
    }
    
    //ADC error, let consider pressure is not low...
    return false;
}

void init_actuators(DynamixelSerial* dyn) {

    for(int i=0; i<NB_ACTIONS; i++) {
        actions[i].action = ACTION_NO_ACTION;
        queued_actions[i].action = ACTION_NO_ACTION;
    }

    crane_left.init(&crane_left_config, dyn);
    adcStart(&ADCD1, NULL);
    chThdCreateStatic(waActionManager, sizeof(waActionManager), NORMALPRIO, &action_manager, NULL);
}


msg_t add_action(Actions a, int id, int crane, Side side) {
    ActionParam param;
    param.crane = &crane_left;
    param.side = side;
    if(crane) {
        param.crane = &crane_left;
    }
    // else {
    //     param.crane = &crane_left;
    // }

    return queue_action(a, id, param);
}
