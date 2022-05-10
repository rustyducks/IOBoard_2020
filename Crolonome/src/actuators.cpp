#include "actuators.h"
#include <Servo.h>
#include "PinLayout.h"

using Proc = protoduck::Procedure::Proc;

constexpr int DROPPER_IDLE = 1530;
constexpr int DROPPER_DROP = 1000;
constexpr int DROPPER_POS[2] = {DROPPER_IDLE, DROPPER_DROP};

constexpr int TROMPE_IDLE = 610;
constexpr int TROMPE_TAKE = 1560;
constexpr int TROMPE_DROP = 2500;
constexpr int TROMPE_POS[3] = {TROMPE_IDLE, TROMPE_TAKE, TROMPE_DROP};

constexpr int LANGUE_IDLE = 1500;
constexpr int LANGUE_PUSH = 2400;
constexpr int LANGUE_POS[2] = {LANGUE_IDLE, LANGUE_PUSH};


Servo dropper;
Servo trompe;
Servo langue;


void actuators_init() {
    pinMode(LED, OUTPUT);
    pinMode(EMAG, OUTPUT);
    digitalWrite(EMAG, LOW);

    dropper.attach(DROPPER);
    trompe.attach(TROMPE);
    langue.attach(LANGUE);

    dropper.writeMicroseconds(DROPPER_IDLE);
    trompe.writeMicroseconds(TROMPE_IDLE);
    langue.writeMicroseconds(LANGUE_IDLE);
}

void actuators_handle(Message msg) {
    if (msg.msg_type() == Message::MsgType::COMMAND && msg.has_procedure()) {
        Proc procedure = msg.procedure().get_proc();
        int32_t param = msg.procedure().get_param();
        
        switch (procedure)
        {
        case Proc::DROPPER:
            if(param >= 0 && param < 2) {
                dropper.writeMicroseconds(DROPPER_POS[param]);
            }
            break;
        case Proc::TROMPE:
            if(param >= 0 && param < 3) {
                trompe.writeMicroseconds(TROMPE_POS[param]);
            }
            break;
        case Proc::LANGUE:
            if(param >= 0 && param < 2) {
                langue.writeMicroseconds(LANGUE_POS[param]);
            }
            break;
        
        default:
            break;
        }

    }

}

