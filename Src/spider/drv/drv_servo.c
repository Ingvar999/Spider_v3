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

static uint16_t current_pwm[SERVO_ID_MAX];
static uint16_t target_pwm[SERVO_ID_MAX];

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
	PCA9685_REGISTER_MODE1_RESTART = (1u << 7u)
} pca9685_register_mode1_t;

static bool_t pca9685_write_u8(uint8_t dev_addr, uint8_t address, uint8_t value)
{
	uint8_t data[] = {address, value};
	return HAL_I2C_Master_Transmit(I2C_HANDLER, dev_addr, data, 2, PCA_I2C_TIMEOT) == HAL_OK;
}

static void pca9685_init(uint8_t address)
{
	HAL_StatusTypeDef res;
	uint8_t initStruct[2];
	uint8_t prescale = 3; // hardcoded

	uint8_t oldmode = 0; // hardcoded
	//HAL_I2C_Master_Receive(hi2c, address, &oldmode, 1, I2C_TIMEOT);
	uint8_t newmode = ((oldmode & 0x7F) | 0x10);
	initStruct[0] = PCA9685_REGISTER_MODE1;
	initStruct[1] = newmode;
	res = HAL_I2C_Master_Transmit(I2C_HANDLER, address, initStruct, 2, PCA_I2C_TIMEOT);
	if (res == HAL_OK)
	{
		initStruct[1] = prescale;
		res = HAL_I2C_Master_Transmit(I2C_HANDLER, address, initStruct, 2, PCA_I2C_TIMEOT);
		if (res == HAL_OK)
		{
			initStruct[1] = oldmode;
			res = HAL_I2C_Master_Transmit(I2C_HANDLER, address, initStruct, 2, PCA_I2C_TIMEOT);
			if (res == HAL_OK)
			{
				osDelay(5);
				initStruct[1] = (oldmode | 0xA1);
				res = HAL_I2C_Master_Transmit(I2C_HANDLER, address, initStruct, 2, PCA_I2C_TIMEOT);
			}
		}
	}
	if (res != HAL_OK)
	{
		LOG_ERR("Iinit Servo failed: addr - %X, status - %d\n", address, res);
	}
}

static void pca9685_pwm(uint8_t address, uint8_t num, uint16_t on, uint16_t off)
{
  uint8_t outputBuffer[5] = {0x06 + 4*num, on, (on >> 8), off, (off >> 8)};
	HAL_StatusTypeDef res = HAL_I2C_Master_Transmit(I2C_HANDLER, address, outputBuffer, 5, PCA_I2C_TIMEOT);
	if (res != HAL_OK)
	{
		LOG_ERR("Write Servo failed: addr - %X, status - %d\n", address, res);
	}
}

static void update_servo_pwm(servo_id_t port)
{
	uint8_t pca_addr = PCA_BOARD_BASE_ADDR + (port / PORTS_PER_BOARD);
	uint8_t pca_port = port % PORTS_PER_BOARD;

	pca9685_pwm(pca_addr, pca_port, 0, current_pwm[port]);
}

static uint16_t angle_to_pulse(servo_id_t port, uint16_t degrees)
{
	return base_pulse[port] + (degrees * PULSE_PER_DEGREE);
}

void drv_servo_init(void)
{
	drv_servo_disable();
	pca9685_init(PCA_BOARD_BASE_ADDR);
	pca9685_init(PCA_BOARD_BASE_ADDR + 1);
}

void drv_servo_enable(void)
{
	HAL_GPIO_WritePin(SERVO_DISABLE_GPIO_Port, SERVO_DISABLE_Pin, GPIO_PIN_RESET);
}

void drv_servo_disable(void)
{
	HAL_GPIO_WritePin(SERVO_DISABLE_GPIO_Port, SERVO_DISABLE_Pin, GPIO_PIN_SET);
}

void drv_servo_set(servo_id_t port, uint16_t value, bool_t force)
{
	if ((value <= 180) && (port < SERVO_ID_MAX))
	{
		value = angle_to_pulse(port, value);
		target_pwm[port] = value;
		if (force)
		{
			current_pwm[port] = value;
			update_servo_pwm(port);
		}			
	}
}

bool_t drv_servo_update_servos_position(uint32_t time_passed)
{
  int diff, abs_diff, sign, d;
	bool_t target_reached = TRUE;
  double de, delta = ((double)(3 * time_passed) / 50);
	
	for (servo_id_t port = SERVO_ID_FIRST; port < SERVO_ID_MAX; ++port)
	{
		diff = target_pwm[port] - current_pwm[port];
		if (diff)
		{
			sign = SIGN(diff);
			abs_diff = sign * diff;
			de = sqrt(abs_diff) * delta;
			
			d = (de < 2) ? 1 : (int)de;

			if (d >= abs_diff)
			{
				current_pwm[port] = target_pwm[port];
			}
			else
			{
				current_pwm[port] += sign * d;
			}
			update_servo_pwm(port);

			if (target_pwm[port] != current_pwm[port])
			{
				target_reached = FALSE;
			}
		}
	}

  return target_reached;
}
