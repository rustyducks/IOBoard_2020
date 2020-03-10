#ifndef TM1637_H
#define TM1637_H

//#include "stdbool.h"
//#include "stdint.h"
#include <ch.h>
#include <hal.h>

#define DEFAULT_BIT_DELAY  5

class TM1637Display {
public:
    TM1637Display(ioline_t clk, ioline_t dio, uint32_t bitDelay = DEFAULT_BIT_DELAY);
    void startDisplay();
    
    void setBrightness(uint8_t brightness, bool on = true);
    void setSegments(const uint8_t segs[], uint8_t length, uint8_t pos = 0);
    void setDigits(uint8_t digits[], int len);
    void setDots(bool dots[], int len);
    void setFloating(float nb);
    void setNumber(int nb);
    void updateDisplay();

    thread_reference_t* threadRef() { return &thread_ref;}

protected:
    void start();
    void stop();
    bool writeByte(uint8_t data);
    

private:
    ioline_t line_clk;
    ioline_t line_dio;
    uint32_t bit_delay;

    uint8_t brightness;

    uint8_t segments[6];

    thread_t* update_thread;
    thread_reference_t thread_ref;

};




#endif