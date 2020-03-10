#include "tm1637.h"
#include <math.h>
#include "stdutil.h"



//
//      A
//     ---
//  F |   | B
//     -G-
//  E |   | C
//     ---
//      D
const uint8_t digitToSegment[] = {
 // XGFEDCBA
  0b00111111,    // 0
  0b00000110,    // 1
  0b01011011,    // 2
  0b01001111,    // 3
  0b01100110,    // 4
  0b01101101,    // 5
  0b01111101,    // 6
  0b00000111,    // 7
  0b01111111,    // 8
  0b01101111,    // 9
  0b01110111,    // A
  0b01111100,    // b
  0b00111001,    // C
  0b01011110,    // d
  0b01111001,    // E
  0b01110001     // F
};

#define NB_SEGMENTS_USED 4

#define TM1637_COMM_DATA    0x40    // TM1637_I2C_COMM1
#define TM1637_COMM_DISPLAY_CONTROL    0xC0 //TM1637_I2C_COMM2
#define TM1637_COMM_ADDR    0x80    //TM1637_I2C_COMM3

// the limit should be 250k for the clock frequency => 4us
// however WAIT_BIT is a half period, so 3 should work
#define WAIT_BIT chThdSleepMicroseconds(bit_delay)

static THD_WORKING_AREA(waTm1637Display, 348);

static void tm1637Display (void *arg)
{
  TM1637Display* display = (TM1637Display*)arg;
  chRegSetThreadName("tm1637Display");
  while(true) {
    display->updateDisplay();
    //chThdYield();
    chSysLock();
    chThdSuspendS(display->threadRef());
    chSysUnlock();
  }
}




TM1637Display::TM1637Display(ioline_t clk, ioline_t dio, uint32_t bitDelay) :
    line_clk(clk), line_dio(dio), bit_delay(bitDelay), update_thread(NULL)
{
    brightness = 0x8 | 0x3; //max
    
    for(int i=0; i<6; i++) {
        segments[i] = 0xFF; //all on
    }

}

void TM1637Display::setBrightness(uint8_t b, bool on) {
    brightness = b & 0x7;
    if(on) {
        brightness |= 0x8;
    }
}

void TM1637Display::setDigits(uint8_t digits[4], int len) {
    if(len != NB_SEGMENTS_USED) {
        return; // bad
    }
    for(int i=0; i< NB_SEGMENTS_USED; i++) {
        if(digits[i] <= 0xF) {
            segments[i] = digitToSegment[digits[i]];
        }
    }
    chThdResume(threadRef(), MSG_OK);
}

void TM1637Display::setDots(bool dots[], int len) {
    if(len != NB_SEGMENTS_USED) {
        return; // bad
    }
    for(int i=0; i< NB_SEGMENTS_USED; i++) {
        if(dots[i]) {
            segments[i] |= 0x80;
        } else {
            segments[i] &= ~0x80;
        }
    }
    chThdResume(threadRef(), MSG_OK);
}

void TM1637Display::setNumber(int nb) {
    uint8_t digits[NB_SEGMENTS_USED];
    for (int i = 0; i < NB_SEGMENTS_USED; i++)
    {
        int factor = powf(10, NB_SEGMENTS_USED-1 - i);
        int digit = nb / factor;
        digits[i] = digit;
        nb -= digit * factor;
    }
    
    setDigits(digits, NB_SEGMENTS_USED);
}

void TM1637Display::setFloating(float nb) {
    if(nb == 0) {
        setNumber(0);
    }
    else if(nb > 9999.f || nb < 0.001f) {
        return; //too large or too small, can't be displayed !
    }
    int nb_log = log10(nb);
    int pos_dot = MAX(0, nb_log);

    int number = nb * powf(10, (NB_SEGMENTS_USED - 1 - pos_dot));
    setNumber(number);
    segments[pos_dot] |= 0x80;
    chThdResume(threadRef(), MSG_OK);
}

void TM1637Display::start(void) {
    // start condition
    palSetLine(line_clk);
    WAIT_BIT;
    palClearLine(line_dio);
    WAIT_BIT;
}

void TM1637Display::stop(void) {
    // stop condition
    palClearLine(line_dio);
    WAIT_BIT;
    palSetLine(line_clk);
    WAIT_BIT;
    palSetLine(line_dio);
    WAIT_BIT;
}

void TM1637Display::setSegments(const uint8_t segs[], uint8_t length, uint8_t pos) {
    if(pos+length >= 6) {
        return;
    }
    for(int i=pos; i< pos+length; i++) {
        segments[i] = segs[i];
    }
}

void TM1637Display::updateDisplay() {
    start();
    writeByte(TM1637_COMM_DATA);
    stop();


    start();
    // set start address
    writeByte(TM1637_COMM_DISPLAY_CONTROL + (0 && 0x03));
    for(int i=0; i<NB_SEGMENTS_USED; i++) {
        writeByte(segments[i]);
    }
    stop();

    start();
	writeByte(TM1637_COMM_ADDR + (brightness & 0x0f));
	stop();

}

bool TM1637Display::writeByte(uint8_t data) {
    for(int i=0; i<8; i++) {
        palClearLine(line_clk);
        if(data & 1<<i) {
            palSetLine(line_dio);
        } else {
             palClearLine(line_dio);
        }
        WAIT_BIT;
        palSetLine(line_clk);
        WAIT_BIT;
    }
    
    palClearLine(line_clk); //8th CLK fall  DIO driven by the TM1637
    // DIO in input if needed
    WAIT_BIT;
    int ack = palReadLine(line_dio);
    palSetLine(line_clk);   //9th CLK
    WAIT_BIT;       //here or two lines before?
    palClearLine(line_clk); //DIO released now
    //ready to write new byte

    return ack; //should return 0 if ok;
}


void TM1637Display::startDisplay() {
    // lines are normaly high
    palSetLine(line_clk);
    palSetLine(line_dio);
    update_thread = chThdCreateStatic(waTm1637Display, sizeof(waTm1637Display), NORMALPRIO-1, &tm1637Display, this);
}
