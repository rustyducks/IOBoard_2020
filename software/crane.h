#ifndef CRANE_H
#define CRANE_H

#include <ch.h>
#include <hal.h>
#include "DynamixelSerial.h"


#define DELTA_DYN 5


struct CraneConfig {
    ioline_t line_pump;
    ioline_t line_ev;
    ioline_t line_ev_pressure;
    uint32_t ev_pressure_state;
    uint8_t elev_dyn_id;
    uint8_t azim_dyn_id;
};




class Crane {
public:
    Crane();
    void init(struct CraneConfig* crane_config, DynamixelSerial* dyn);

    void set_elevation(int elev);
    bool goElevationTimeout(int elev, uint32_t timeout, bool exit=false);
    void set_azimut(int azim);
    bool goAzimutTimeout(int elev, uint32_t timeout, bool exit=false);
    void start_pump();
    void stop_pump();
    void open_ev();
    void close_ev();
    void route_sensor();
    void release_sensor();

    int readAzimut();
    int readElevation();

private:
    struct CraneConfig* config;
    DynamixelSerial* dynamixels;

};

#endif