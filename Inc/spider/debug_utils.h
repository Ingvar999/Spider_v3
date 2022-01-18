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

extern UART_HandleTypeDef huart3;
extern uint8_t txBuf[];
extern volatile uint32_t _tx_uart_busy;

#define pHOST_UART							(&huart3)
#define RX_BUF_SIZE							(30)
#define TX_BUF_SIZE							(50)

#define PRINTF(...) 						{ while (_tx_uart_busy) __asm("nop"); _tx_uart_busy = 1; HAL_UART_Transmit_IT(pHOST_UART, txBuf, sprintf((char *)txBuf, __VA_ARGS__));}
#define LED_ON(led)							HAL_GPIO_WritePin(LED_##led##_GPIO_Port, LED_##led##_Pin, GPIO_PIN_SET)
#define LED_OFF(led)						HAL_GPIO_WritePin(LED_##led##_GPIO_Port, LED_##led##_Pin, GPIO_PIN_RESET)
#define LED_CHANGE(led)					HAL_GPIO_TogglePin(LED_##led##_GPIO_Port, LED_##led##_Pin)
	
typedef void (*cli_handler_t)(const char *data, uint32_t len);

void start_cli_handling(uint8_t terminator, cli_handler_t handler);
