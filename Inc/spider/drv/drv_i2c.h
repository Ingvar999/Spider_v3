/**
  ******************************************************************************
  * File Name          : drv_i2c.h
  * Description        : 
  ******************************************************************************
  **/

#pragma once
#include <stdint.h>
#include "stm32f4xx_hal.h"
#include "defines.h"

void I2C_ClearBusyFlagErratum(I2C_HandleTypeDef *hi2c, uint32_t timeout);
