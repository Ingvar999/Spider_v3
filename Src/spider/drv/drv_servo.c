/**
  ******************************************************************************
  * File Name          : drv_servo.c
  * Description        : 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <math.h>
#include "drv_servo.h"
#include "stm32f4xx_hal.h"
#include "cmsis_os.h"
#include "main.h"
#include "log.h"
#include "config.h"

extern I2C_HandleTypeDef hi2c1;

#define I2C_HANDLER						(&hi2c1)
#define PCA_BOARD_BASE_ADDR		(0x81)
#define PORTS_PER_BOARD				(16)
#define BASE_PULSE_MIN				(380)
#define BASE_PULSE_MID				(420)
#define BASE_PULSE_MAX				(460)
#define PULSE_RANGE						(1620)
#define PULSE_PER_DEGREE			(9)
#define PCA_I2C_TIMEOT				(2)

#define PCA9685_SET_BIT_MASK(BYTE, MASK)      ((BYTE) |= (uint8_t)(MASK))
#define PCA9685_CLEAR_BIT_MASK(BYTE, MASK)    ((BYTE) &= (uint8_t)(~(uint8_t)(MASK)))
#define PCA9685_READ_BIT_MASK(BYTE, MASK)     ((BYTE) & (uint8_t)(MASK))

/**
 * Registers addresses.
 */
typedef enum
{
	PCA9685_REGISTER_MODE1 = 0x00,
	PCA9685_REGISTER_MODE2 = 0x01,
	PCA9685_REGISTER_LED0_ON_L = 0x06,
	PCA9685_REGISTER_ALL_LED_ON_L = 0xfa,
	PCA9685_REGISTER_ALL_LED_ON_H = 0xfb,
	PCA9685_REGISTER_ALL_LED_OFF_L = 0xfc,
	PCA9685_REGISTER_ALL_LED_OFF_H = 0xfd,
	PCA9685_REGISTER_PRESCALER = 0xfe
} pca9685_register_t;

/**
 * Bit masks for the mode 1 register.
 */
typedef enum
{
	PCA9685_REGISTER_MODE1_SLEEP = (1u << 4u),
	PCA9685_REGISTER_MODE1_AI = (1u << 5u),
	PCA9685_REGISTER_MODE1_RESTART = (1u << 7u)
} pca9685_register_mode1_t;

static const uint16_t base_pulse[SERVO_ID_MAX] = {
	// Central servos
	BASE_PULSE_MAX,
	BASE_PULSE_MIN,
	BASE_PULSE_MIN,
	BASE_PULSE_MIN,
	BASE_PULSE_MID,
	BASE_PULSE_MID,
	// Reserved
	BASE_PULSE_MID,
	BASE_PULSE_MID,
	// Moving servos
	BASE_PULSE_MIN,
	BASE_PULSE_MIN,
	BASE_PULSE_MAX,
	BASE_PULSE_MIN,
	BASE_PULSE_MID,
	BASE_PULSE_MIN,
	// Reserved
	BASE_PULSE_MID,
	BASE_PULSE_MID,
	// Rotation servos
	BASE_PULSE_MAX,
	BASE_PULSE_MID,
	BASE_PULSE_MAX,
	BASE_PULSE_MIN,
	BASE_PULSE_MAX,
	BASE_PULSE_MAX
};

static bool is_initialized = false;
static acceleration_mode_t accel_mode = FADING_SPEED;
static uint16_t current_pwm[SERVO_ID_MAX];
static uint16_t target_pwm[SERVO_ID_MAX];

acceleration_mode_t drv_servo_get_accel_mode(void)
{
	return accel_mode;
}

void drv_servo_set_accel_mode(acceleration_mode_t mode)
{
	accel_mode = mode;
}

static drv_servo_status_t pca9685_write_u8(uint8_t dev_addr, uint8_t address, uint8_t value)
{
	uint8_t data[] = {address, value};
	return HAL_I2C_Master_Transmit(I2C_HANDLER, dev_addr, data, 2, PCA_I2C_TIMEOT) == HAL_OK ? DRV_SERVO_SUCCESS : DRV_SERVO_HW_ACCESS_ERROR;
}

static drv_servo_status_t pca9685_init(uint8_t address)
{
	drv_servo_status_t status;

	uint8_t mode = PCA9685_REGISTER_MODE1_AI | PCA9685_REGISTER_MODE1_RESTART;

	status = pca9685_write_u8(address, PCA9685_REGISTER_MODE1, mode);
	
	if (status != DRV_SERVO_SUCCESS)
	{
		LOG_ERR("Iinit Servo failed: addr - %X", address);
	}
	return status;
}

static drv_servo_status_t pca9685_pwm(uint8_t address, uint8_t num, uint16_t on, uint16_t off)
{
  uint8_t outputBuffer[5] = {0x06 + 4*num, on, (on >> 8), off, (off >> 8)};
	HAL_StatusTypeDef res = HAL_I2C_Master_Transmit(I2C_HANDLER, address, outputBuffer, 5, PCA_I2C_TIMEOT);
	if (res != HAL_OK)
	{
		LOG_ERR("Write Servo failed: addr - %X, status - %d", address, res);
	}
	return res == HAL_OK ? DRV_SERVO_SUCCESS : DRV_SERVO_HW_ACCESS_ERROR;
}

static drv_servo_status_t update_servo_pwm(servo_id_t port)
{
	if (is_initialized)
	{
		uint8_t pca_addr = PCA_BOARD_BASE_ADDR + (port / PORTS_PER_BOARD);
		uint8_t pca_port = port % PORTS_PER_BOARD;

		return pca9685_pwm(pca_addr, pca_port, 0, current_pwm[port]);
	}
	else
	{
		return DRV_SERVO_NOT_INITIALIZED;
	}
}

static uint16_t angle_to_pulse(servo_id_t port, uint16_t degrees)
{
	return base_pulse[port] + (degrees * PULSE_PER_DEGREE);
}

drv_servo_status_t drv_servo_init(void)
{
	drv_servo_status_t status;
	
	drv_servo_disable();
	status = pca9685_init(PCA_BOARD_BASE_ADDR);
	if (status == DRV_SERVO_SUCCESS)
	{
		status = pca9685_init(PCA_BOARD_BASE_ADDR + 1);
		if (status == DRV_SERVO_SUCCESS)
		{
			is_initialized = true;
		}
	}
	return status;
}

drv_servo_status_t drv_servo_enable(void)
{
	if (is_initialized)
	{
		HAL_GPIO_WritePin(SERVO_DISABLE_GPIO_Port, SERVO_DISABLE_Pin, GPIO_PIN_RESET);
		return DRV_SERVO_SUCCESS;
	}
	else
	{
		return DRV_SERVO_NOT_INITIALIZED;
	}
}

void drv_servo_disable(void)
{
	HAL_GPIO_WritePin(SERVO_DISABLE_GPIO_Port, SERVO_DISABLE_Pin, GPIO_PIN_SET);
}

drv_servo_status_t drv_servo_set(servo_id_t port, uint16_t value, bool force)
{
	drv_servo_status_t status = DRV_SERVO_SUCCESS;
	
	if ((value <= 180) && (port < SERVO_ID_MAX))
	{
		value = angle_to_pulse(port, value);
		target_pwm[port] = value;
		if (force)
		{
			current_pwm[port] = value;
			status = update_servo_pwm(port);
		}			
	}
	else
	{
		status = DRV_SERVO_INVALID_PARAM;
	}
	return status;
}

drv_servo_status_t drv_servo_update_servos_position(uint32_t time_passed, bool *is_idle)
{
	drv_servo_status_t status = DRV_SERVO_SUCCESS;
  int diff, abs_diff, sign, d;
  double delta = ((double)(global_config.speed * time_passed)) / 10;
	if (accel_mode == FADING_SPEED)
	{
		delta /= 8;
	}
	
	*is_idle = true;
	
	for (servo_id_t port = SERVO_ID_FIRST; (port < SERVO_ID_MAX) && (status == DRV_SERVO_SUCCESS); ++port)
	{
		diff = target_pwm[port] - current_pwm[port];
		if (diff)
		{
			sign = SIGN(diff);
			abs_diff = sign * diff;
			
			if (accel_mode == FADING_SPEED)
			{
				delta *= sqrt(abs_diff);
			}
			
			d = (delta < 2) ? 1 : (int)delta;

			if (d >= abs_diff)
			{
				current_pwm[port] = target_pwm[port];
			}
			else
			{
				current_pwm[port] += sign * d;
			}
			status = update_servo_pwm(port);

			if (target_pwm[port] != current_pwm[port])
			{
				*is_idle = false;
			}
		}
	}
  return status;
}
