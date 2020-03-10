/*
 * hardware_config.c
 *
 *  Created on: 3 Dec 2019
 *      Author: fabien
 */

#include "hardware_config.h"
#include <ch.h>
#include <hal.h>
#include "globalVar.h"
#include "stdutil.h"

//400k : 0x00300F38
//100k : 0x00707CBB

I2CConfig i2ccfg = {
	// .timingr = STM32_TIMINGR_PRESC(3)
	// | STM32_TIMINGR_SCLL(0x13) | STM32_TIMINGR_SCLH(0xF)
	// | STM32_TIMINGR_SDADEL(0X2) | STM32_TIMINGR_SCLDEL(0X4),
	.timingr = 0x00707CBB,
	.cr1 = 0,
	.cr2 = 0
};



PWMConfig pwmcfg1 = {
	.frequency = 1000000,
	.period = 20000,
	.callback = NULL,
	.channels = {
			{								//ch1
					.mode = PWM_OUTPUT_ACTIVE_HIGH,
					.callback = NULL
			},
			{								//ch2n
					.mode = PWM_COMPLEMENTARY_OUTPUT_ACTIVE_HIGH,
					.callback = NULL
			},
			{								//ch3n
					.mode = PWM_COMPLEMENTARY_OUTPUT_ACTIVE_HIGH,
					.callback = NULL
			},
			{								//ch4
					.mode = PWM_OUTPUT_ACTIVE_HIGH,
					.callback = NULL
			}
	},
	.cr2 = 0,
	.bdtr = 0,
	.dier = 0
};


void init_I2C() {
	i2cStart(&I2CD1, &i2ccfg);
}


void init_servos() {
	pwmStart(&PWMD1, &pwmcfg1);
}

void enable_servos() {
	  for(int i=0; i<5; i++) {
		  set_servo(i, 1000);
	  }
}

void set_servo(int servo_nb, int us) {
	if (servo_nb < 0 || servo_nb > 3) {
		return;
	}
	us = CLAMP_TO(100, 3000, us);
	pwmEnableChannel(&PWMD1, servo_nb, us);
}




