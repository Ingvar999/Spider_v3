/**
  ******************************************************************************
  * File Name          : drv_servo.c
  * Description        : 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "drv_servo.h"
#include "stm32f7xx_hal.h"
#include "cmsis_os.h"

extern I2C_HandleTypeDef hi2c1;

#define I2C_HANDLER						(&hi2c1)
#define PCA_BOARD_BASE_ADDR		(0x80)
#define PORTS_PER_BOARD				(16)
#define BASE_PULSE_MIN				(380)
#define BASE_PULSE_MID				(420)
#define BASE_PULSE_MAX				(460)
#define PULSE_RANGE						(1620)
#define PULSE_PER_DEGREE			(9)

static void pca9685_init(I2C_HandleTypeDef *hi2c, uint8_t address)
{
	#define PCA9685_MODE1 0x00
	uint8_t initStruct[2];
	uint8_t prescale = 3; // hardcoded
	HAL_I2C_Master_Transmit(hi2c, address, PCA9685_MODE1, 1, 1);
	uint8_t oldmode = 0; // hardcoded
	// HAL_I2C_Master_Receive(hi2c, address, &oldmode, 1, 1);
	uint8_t newmode = ((oldmode & 0x7F) | 0x10);
	initStruct[0] = PCA9685_MODE1;
	initStruct[1] = newmode;
	HAL_I2C_Master_Transmit(hi2c, address, initStruct, 2, 1);
	initStruct[1] = prescale;
	HAL_I2C_Master_Transmit(hi2c, address, initStruct, 2, 1);
  initStruct[1] = oldmode;
  HAL_I2C_Master_Transmit(hi2c, address, initStruct, 2, 1);
  osDelay(5);
  initStruct[1] = (oldmode | 0xA1);
  HAL_I2C_Master_Transmit(hi2c, address, initStruct, 2, 1);
}

static void pca9685_pwm(I2C_HandleTypeDef *hi2c, uint8_t address, uint8_t num, uint16_t on, uint16_t off)
{
  uint8_t outputBuffer[5] = {0x06 + 4*num, on, (on >> 8), off, (off >> 8)};
  HAL_I2C_Master_Transmit(&hi2c1, address, outputBuffer, 5, 1);
}

static uint16_t angle_to_pulse(uint16_t degrees)
{
	return BASE_PULSE_MID + (degrees * PULSE_PER_DEGREE);
}

void drv_servo_init(void)
{
	pca9685_init(I2C_HANDLER, PCA_BOARD_BASE_ADDR);
}

void drv_servo_set(uint8_t port, uint16_t value)
{
	if (value <= 180)
	{
		uint8_t pca_addr = PCA_BOARD_BASE_ADDR + (port / PORTS_PER_BOARD);
		port = port % PORTS_PER_BOARD;
		value = angle_to_pulse(value);
		
		pca9685_pwm(I2C_HANDLER, pca_addr, port, 0, value);
	}
}
