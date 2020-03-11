#include "crane.h"
#include "stdutil.h"
#include "actuators.h"


MUTEX_DECL(m_dyn);
MUTEX_DECL(pressure);

Crane::Crane(): config(NULL), dynamixels(NULL)
{

}

void Crane::init(struct CraneConfig* crane_config, DynamixelSerial* dyn) {
    config = crane_config;
    dynamixels = dyn;
}

void Crane::set_elevation(int elev) {
    chMtxLock(&m_dyn);
    // move command between 0 and 1023. Shift it to -512;511
    dynamixels->move(config->elev_dyn_id, elev + 512);
    chMtxUnlock(&m_dyn);
}

/**
 *  timeout in milliseconds
 */
bool Crane::goElevationTimeout(int elev, uint32_t timeout, bool exit) {
    set_elevation(elev);
    systime_t start = chVTGetSystemTime();
    while(TIME_I2MS(chVTTimeElapsedSinceX(start)) < timeout) {
        chThdSleepMilliseconds(200);
        if(ABS(readElevation() - elev) < DELTA_DYN) {
            return true;
        }
    }
    if(exit) {
        chThdExit(ACTION_DYN_TIMEOUT);
    }
    return false;
}

void Crane::set_azimut(int azim) {
    chMtxLock(&m_dyn);
    // move command between 0 and 1023. Shift it to -512;511
    dynamixels->move(config->azim_dyn_id, azim + 512);
    chMtxUnlock(&m_dyn);
}

/**
 *  timeout in milliseconds
 */
bool Crane::goAzimutTimeout(int azim, uint32_t timeout, bool exit) {
    set_azimut(azim);
    systime_t start = chVTGetSystemTime();
    while(TIME_I2MS(chVTTimeElapsedSinceX(start)) < timeout) {
        chThdSleepMilliseconds(200);
        if(ABS(readAzimut() - azim) < DELTA_DYN) {
            return true;
        }
    }
    if(exit) {
        chThdExit(ACTION_DYN_TIMEOUT);
    }
    return false;
}

void Crane::start_pump() {
    palSetLine(config->line_pump);
}

void Crane::stop_pump() {
    palClearLine(config->line_pump);
}

void Crane::open_ev() {
    palSetLine(config->line_ev);
}

void Crane::close_ev() {
    palClearLine(config->line_ev);
}

void Crane::route_sensor() {
    chMtxLock(&pressure);
    palWriteLine(config->line_ev_pressure, config->ev_pressure_state);
}

void Crane::release_sensor() {
    palClearLine(config->line_ev_pressure);
    chMtxUnlock(&pressure);
}

int Crane::readAzimut() {
    chMtxLock(&m_dyn);
    // readPosition between 0 and 1023. Shift it to -512;511
    int azimut = dynamixels->readPosition(config->azim_dyn_id) - 512;
    chMtxUnlock(&m_dyn);
    return azimut;
}

int Crane::readElevation() {
    chMtxLock(&m_dyn);
    // readPosition between 0 and 1023. Shift it to -512;511
    int elevation = dynamixels->readPosition(config->elev_dyn_id) - 512;
    chMtxUnlock(&m_dyn);
    return elevation;
}
