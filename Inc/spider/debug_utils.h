/**
  ******************************************************************************
  * File Name          : debug_tils.h
  * Description        : 
  ******************************************************************************
  **/

#pragma once
#include "stm32f7xx_hal.h"
#include <stdlib.h>
#include "main.h"
#include "drv_uart.h"

#define DBG_UTILS_TX_BUF_SIZE							(50)

extern uint8_t _dbg_utils_tx_buf[];

#define PRINTF(...) 						{ while (drv_uart_is_tx_busy(UART_ID_HOST)) __asm("nop"); drv_uart_transfer(UART_ID_HOST, _dbg_utils_tx_buf, sprintf((char *)_dbg_utils_tx_buf, __VA_ARGS__));}
#define LED_ON(led)							HAL_GPIO_WritePin(LED_##led##_GPIO_Port, LED_##led##_Pin, GPIO_PIN_SET)
#define LED_OFF(led)						HAL_GPIO_WritePin(LED_##led##_GPIO_Port, LED_##led##_Pin, GPIO_PIN_RESET)
#define LED_CHANGE(led)					HAL_GPIO_TogglePin(LED_##led##_GPIO_Port, LED_##led##_Pin)
