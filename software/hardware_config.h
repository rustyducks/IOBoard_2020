/*
 * hardware_config.h
 *
 *  Created on: 3 Dec 2019
 *      Author: fabien
 */

#if !defined(HARWARE_CONFIG_H_)
#define HARWARE_CONFIG_H_

void init_I2C(void);

void init_servos(void);
void enable_servos(void);
void set_servo(int servo_nb, int us);

#endif // HARWARE_CONFIG_H_
