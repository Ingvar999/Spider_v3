/**
  ******************************************************************************
  * File Name          : drv_gyro.c
  * Description        : 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "math.h"
#include "drv_gyro.h"
#include "defines.h"
#include "debug_utils.h"
#include "stm32f4xx_hal.h"

extern I2C_HandleTypeDef hi2c1;

#define I2C_HANDLER								(&hi2c1)
#define I2C_TIMEOUT								(5)
#define INIT_SAMPLE_DELAY					(50)
#define MPU6050_SMPLRT_DIV				(0x19)
#define MPU6050_ACCEL_XOUT_H      (0x3B)
#define MPU6050_PWR_MGMT_1        (0x6B)
#define MPU6050_PWR_MGMT_2        (0x6C)
#define MPU6050_WHO_AM_I          (0x75)
#define MPU6050_I2C_ADDRESS       (0xD0) //(0x68)

#define FS_SEL 										(131.0)
#define FS_SEL_ACCEL							(1) //(16384.0)

typedef union
{
  struct
  {
    uint8_t x_accel_h;
    uint8_t x_accel_l;
    uint8_t y_accel_h;
    uint8_t y_accel_l;
    uint8_t z_accel_h;
    uint8_t z_accel_l;
    uint8_t t_h;
    uint8_t t_l;
    uint8_t x_gyro_h;
    uint8_t x_gyro_l;
    uint8_t y_gyro_h;
    uint8_t y_gyro_l;
    uint8_t z_gyro_h;
    uint8_t z_gyro_l;
  } reg;
  struct
  {
    int16_t x_accel;
    int16_t y_accel;
    int16_t z_accel;
    int16_t temperature;
    int16_t x_gyro;
    int16_t y_gyro;
    int16_t z_gyro;
  } value;
} mpu_regs_t;

static double    last_x_angle;
static double    last_y_angle;

static double    last_gyro_x_angle;
static double    last_gyro_y_angle;
static double    last_gyro_z_angle;

static double    base_x_gyro;
static double    base_y_gyro;
static double    base_z_gyro;

static bool is_initialized = false;

static inline void set_last_read_angle_data(double x, double y, double x_gyro, double y_gyro, double z_gyro);
static drv_gyro_status_t read_gyro_accel_vals(uint8_t* accel_t_gyro_ptr);
static void calibrate_sensors(void);
static drv_gyro_status_t MPU6050_read(int addr, uint8_t *buffer, int size);
static drv_gyro_status_t MPU6050_write(int addr, uint8_t *pData, int size);
static drv_gyro_status_t MPU6050_write_reg(int addr, uint8_t data);

drv_gyro_status_t drv_gyro_init(int tries)
{
	drv_gyro_status_t status;
  uint8_t c;
	
	status = MPU6050_read(MPU6050_WHO_AM_I, &c, 1);
	while ((status != GYRO_STATUS_SUCCESS) || (c != 0x72))
	{
		if (--tries == 0)
		{
			status = GYRO_NOT_AVAILABLE;
			LOG_ERR("GYRO not available");
			break;
		}
		HAL_Delay(10);
		status = MPU6050_read(MPU6050_WHO_AM_I, &c, 1);
	}
	
	if (status == GYRO_STATUS_SUCCESS)
	{
		status = MPU6050_write_reg(MPU6050_PWR_MGMT_1, 0);
		if (status == GYRO_STATUS_SUCCESS)
		{
			status = MPU6050_write_reg(MPU6050_SMPLRT_DIV, 0x7);
			if (status == GYRO_STATUS_SUCCESS)
			{
				calibrate_sensors();
				set_last_read_angle_data(0, 0, 0, 0, 0);
				is_initialized = true;
			}
		}
	}

	return status;
}

drv_gyro_status_t drv_gyro_update(uint32_t time_passed)
{
	drv_gyro_status_t status;
	
	if (is_initialized)
	{
		mpu_regs_t accel_t_gyro;
		status = read_gyro_accel_vals((uint8_t*)&accel_t_gyro);

		if (status == GYRO_STATUS_SUCCESS)
		{
			double gyro_x = (accel_t_gyro.value.x_gyro - base_x_gyro) / FS_SEL;
			double gyro_y = (accel_t_gyro.value.y_gyro - base_y_gyro) / FS_SEL;
			double gyro_z = (accel_t_gyro.value.z_gyro - base_z_gyro) / FS_SEL;

			double accel_x = accel_t_gyro.value.x_accel;// / FS_SEL_ACCEL;
			double accel_y = accel_t_gyro.value.y_accel;// / FS_SEL_ACCEL;
			double accel_z = accel_t_gyro.value.z_accel;// / FS_SEL_ACCEL;

			double accel_angle_y = atan(-1 * accel_x / sqrt(pow(accel_y, 2) + pow(accel_z, 2))) * ToGrad;
			double accel_angle_x = atan(accel_y / sqrt(pow(accel_x, 2) + pow(accel_z, 2))) * ToGrad;

			double dt = time_passed / 1000.0;
			double gyro_angle_x = gyro_x * dt + last_x_angle;
			double gyro_angle_y = gyro_y * dt + last_y_angle;

			double unfiltered_gyro_angle_x = gyro_x * dt + last_gyro_x_angle;
			double unfiltered_gyro_angle_y = gyro_y * dt + last_gyro_y_angle;
			double unfiltered_gyro_angle_z = gyro_z * dt + last_gyro_z_angle;

			double alpha = 1 / (1 + dt);
			double angle_x = alpha * gyro_angle_x + (1.0 - alpha) * accel_angle_x;
			double angle_y = alpha * gyro_angle_y + (1.0 - alpha) * accel_angle_y;

			set_last_read_angle_data(angle_x, angle_y, unfiltered_gyro_angle_x, unfiltered_gyro_angle_y, unfiltered_gyro_angle_z);
		}
	}
	else
	{
		status = GYRO_NOT_INITIALIZED;
	}
	// END_MESURE("Gyro"); // 5ms
	return status;
}

drv_gyro_status_t drv_gyro_get_position(double *horizontal, double *vertical)
{
	drv_gyro_status_t status = GYRO_STATUS_SUCCESS;
	
	if (is_initialized)
	{
		double temp_h;
		double x = tan(ToRad * last_x_angle);
		double y = tan(ToRad * last_y_angle);
		
		temp_h = ToGrad * atan(x / y);
		temp_h += y < 0 ? 90 : -90;
		
		temp_h += GYRO_LAYOUT_CORRECTION;
    if (temp_h < -180)
		{
			temp_h += 360;
    }
    else if (temp_h > 180)
		{
			temp_h -= 360;
    }
		
		*horizontal = temp_h;
		*vertical = ToGrad * atan(sqrt(x * x + y * y));
	}
	else
	{
		status = GYRO_NOT_INITIALIZED;
	}
	return status;
}

static inline void set_last_read_angle_data(double x, double y, double x_gyro, double y_gyro, double z_gyro) {
  last_x_angle = x;
  last_y_angle = y;
  last_gyro_x_angle = x_gyro;
  last_gyro_y_angle = y_gyro;
  last_gyro_z_angle = z_gyro;
}

static drv_gyro_status_t read_gyro_accel_vals(uint8_t* accel_t_gyro_ptr) {
  mpu_regs_t* accel_t_gyro = (mpu_regs_t *)accel_t_gyro_ptr;
  drv_gyro_status_t status = MPU6050_read(MPU6050_ACCEL_XOUT_H, (uint8_t *)accel_t_gyro, sizeof(*accel_t_gyro));
  
	if (status == GYRO_STATUS_SUCCESS)
	{
		uint8_t swap;
#define SWAP(x,y) swap = x; x = y; y = swap
		SWAP((*accel_t_gyro).reg.x_accel_h, (*accel_t_gyro).reg.x_accel_l);
		SWAP((*accel_t_gyro).reg.y_accel_h, (*accel_t_gyro).reg.y_accel_l);
		SWAP((*accel_t_gyro).reg.z_accel_h, (*accel_t_gyro).reg.z_accel_l);
		SWAP((*accel_t_gyro).reg.t_h, (*accel_t_gyro).reg.t_l);
		SWAP((*accel_t_gyro).reg.x_gyro_h, (*accel_t_gyro).reg.x_gyro_l);
		SWAP((*accel_t_gyro).reg.y_gyro_h, (*accel_t_gyro).reg.y_gyro_l);
		SWAP((*accel_t_gyro).reg.z_gyro_h, (*accel_t_gyro).reg.z_gyro_l);
	}

  return status;
}

static void calibrate_sensors() {
  const int num_readings = 5;

  double x_gyro = 0;
  double y_gyro = 0;
  double z_gyro = 0;

  mpu_regs_t    accel_t_gyro;
  read_gyro_accel_vals((uint8_t *)&accel_t_gyro);

  for (int i = 0; i < num_readings; i++) {
		HAL_Delay(INIT_SAMPLE_DELAY);
    read_gyro_accel_vals((uint8_t *)&accel_t_gyro);
    x_gyro += accel_t_gyro.value.x_gyro;
    y_gyro += accel_t_gyro.value.y_gyro;
    z_gyro += accel_t_gyro.value.z_gyro;
  }
	
  base_x_gyro = x_gyro / num_readings;
  base_y_gyro = y_gyro / num_readings;
  base_z_gyro = z_gyro / num_readings;

}

static drv_gyro_status_t MPU6050_read(int addr, uint8_t *buffer, int size)
{
	drv_gyro_status_t status = GYRO_STATUS_SUCCESS;
	
	HAL_StatusTypeDef hal_status = HAL_I2C_Mem_Read(I2C_HANDLER, MPU6050_I2C_ADDRESS, addr, 1, buffer, size, I2C_TIMEOUT);
	
	if (hal_status != HAL_OK)
	{
		LOG_ERR("Read Gyro values failed: status - %d", hal_status);
		status = (hal_status == HAL_TIMEOUT) ? GYRO_TIMEOUT : GYRO_GENERIC_ERROR;
	}
	
	return status;
}

static drv_gyro_status_t MPU6050_write(int addr, uint8_t *pData, int size)
{
	drv_gyro_status_t status = GYRO_STATUS_SUCCESS;
	
	HAL_StatusTypeDef hal_status = HAL_I2C_Mem_Write(I2C_HANDLER, MPU6050_I2C_ADDRESS, addr, 1, pData, size, I2C_TIMEOUT);
	if (hal_status == HAL_TIMEOUT)
	{
		status = GYRO_TIMEOUT;
	}
	else if (hal_status != HAL_OK)
	{
		status = GYRO_GENERIC_ERROR;
	}
	
	return status;
}

static drv_gyro_status_t MPU6050_write_reg(int addr, uint8_t data)
{
  return MPU6050_write(addr, &data, 1);
}
