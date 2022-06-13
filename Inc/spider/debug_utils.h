/**
  ******************************************************************************
  * File Name          : debug_tils.h
  * Description        : 
  ******************************************************************************
  **/

#pragma once
#include "stm32f4xx_hal.h"
#include "main.h"
#include "log.h"
#include "assert.h"

#define LED_ON(led)							HAL_GPIO_WritePin(LED_##led##_GPIO_Port, LED_##led##_Pin, GPIO_PIN_RESET)
#define LED_OFF(led)						HAL_GPIO_WritePin(LED_##led##_GPIO_Port, LED_##led##_Pin, GPIO_PIN_SET)
#define LED_CHANGE(led)					HAL_GPIO_TogglePin(LED_##led##_GPIO_Port, LED_##led##_Pin)
