#ifndef PINLAYOUT_H
#define PINLAYOUT_H

#include <HardwareSerial.h>
#include <Arduino.h>

// display on I2C connector, so we can use the ADC on display pins.
constexpr uint32_t DISPLAY_CLK = PB6;
constexpr uint32_t DISPLAY_DIO = PB7;

constexpr uint32_t SERVO1 = PB0;
constexpr uint32_t SERVO2 = PB1;
constexpr uint32_t SERVO3 = PA8;
constexpr uint32_t SERVO4 = PA11;

constexpr uint32_t TIRETTE = PA7;
constexpr uint32_t COLOR = PA6;

constexpr uint32_t EMAG = PB5; // or PB4, PA10, 12, 5

constexpr uint32_t R_MEAS = PA1;    // ADC1_IN6

// #define UART_TX PA2
// #define UART_RX PA3

#define DYNAMIXELS_HALF_DUP_SERIAL Serial1


#endif /* PINLAYOUT_H */
