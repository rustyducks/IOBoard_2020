#ifndef ACTUATORS_H
#define ACTUATORS_H

#include <ch.h>
#include <hal.h>
#include "crane.h"
#include "DynamixelSerial.h"

enum ActionStatus {
    ACTION_OK,
    ACTION_NO_BUOY = 10,
    ACTION_DYN_TIMEOUT = 11,
    ACTION_TIMEOUT = 12,
};

enum Actions {
    ACTION_NO_ACTION,
    ACTION_TAKE_BUOY,
    ACTION_SAY_HI,
};

#define NB_ACTIONS 5

#define DYN_TIMEOUT 1000

#define TAKE_TIMEOUT 2000

// #define DELTA_DYN 5

#define ELEVATION_UP    100
#define ELEVATION_HOLDER_DROP 60
#define ELEVATION_HOLDER_TAKE 20
#define ELEVATION_BUOY  -50

#define BASE_PRESSURE_THRESHOLD 300

#define AZIMUT(x) (x)==HOLDER_LEFT?-100:100

enum Side {
    HOLDER_LEFT,
    HOLDER_RIGHT,
};

void init_actuators(DynamixelSerial* dyn);
msg_t add_action(Actions a, int id, int crane, Side side);
bool pressure_low();

#endif