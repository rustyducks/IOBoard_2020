#ifndef PINLAYOUT_H
#define PINLAYOUT_H

#include <HardwareSerial.h>
#include <Arduino.h>


// color and tirette on I2C connector, so we can free ADC.
constexpr uint32_t TIRETTE = PB6;
constexpr uint32_t COLOR = PB7;

constexpr uint32_t R_MEAS = PA7;  // ADC1_IN12, prise tirette

constexpr uint32_t LED = PA6;

// #define UART_TX PA2
// #define UART_RX PA3

constexpr uint32_t DISPLAY_CLK = PA0;
constexpr uint32_t DISPLAY_DIO = PA1;

constexpr uint32_t SERVO1 = PB0;
constexpr uint32_t SERVO2 = PB1;
constexpr uint32_t SERVO3 = PA8;
constexpr uint32_t SERVO4 = PA11;

constexpr uint32_t DROPPER = SERVO2;
constexpr uint32_t TROMPE = SERVO3;
constexpr uint32_t LANGUE = SERVO4;

constexpr uint32_t EMAG = PA10;

// #define DYNAMIXELS_HALF_DUP_SERIAL Serial1


#endif /* PINLAYOUT_H */
