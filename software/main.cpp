
extern "C" {
#include <ch.h>
#include <hal.h>
#include "globalVar.h"
#include "stdutil.h"
#include "ttyConsole.h"
#include "hardware_config.h"
#include "tm1637.h"
}
#include "DynamixelSerial.h"
#include "actuators.h"

TM1637Display display(LINE_DISPLAY_CLK, LINE_DISPLAY_DIO);
DynamixelSerial dynamixels;

static THD_WORKING_AREA(waBlinker, 256);

static void blinker (void *arg)
{
  (void)arg;
  chRegSetThreadName("blinker");

  systime_t start = chVTGetSystemTime();

  while (true)
  {
    palToggleLine(LINE_LED_GREEN);
    // int tms = TIME_I2MS(chVTTimeElapsedSinceX(start));
    // display.setFloating(tms/1000.0);

    add_action(ACTION_TAKE_BUOY, 10, 0, HOLDER_LEFT);
    //add_action(ACTION_SAY_HI, 10, 0, HOLDER_LEFT);
    chThdSleepMilliseconds(5000);
  }  
}

int main(void) {
  /*
   * System initializations.
   * - HAL initialization, this also initializes the configured device drivers
   *   and performs the board-specific initializations.
   * - Kernel initialization, the main() function becomes a thread and the
   *   RTOS is active.
   */
  halInit();
  chSysInit();
  initHeap();

  init_servos();
  init_I2C();
  adcInit();

  display.startDisplay();
  dynamixels.init(&SD1);
  init_actuators(&dynamixels);

  chThdCreateStatic(waBlinker, sizeof(waBlinker), NORMALPRIO, &blinker, NULL);

  consoleInit(); // initialisation de la liaison série du shell
  consoleLaunch();  // lancement du thread qui gère le shell sur la liaison série


  // main thread does nothing
  chThdSleep(TIME_INFINITE);
}


