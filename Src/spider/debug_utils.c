/**
  ******************************************************************************
  * File Name          : spider_main.c
  * Description        : 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "debug_utils.h"

uint8_t txBuf[TX_BUF_SIZE] = {0};
volatile uint32_t _tx_uart_busy = 0;
static uint8_t rxBuf[RX_BUF_SIZE];
static uint8_t ch;
static int pos = 0;
static uint8_t g_terminator;
static cli_handler_t g_handler;

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart){
	if (huart == pHOST_UART){
		if (ch == g_terminator){
			rxBuf[pos] = 0;
			g_handler((char *)rxBuf, pos + 1);
			pos = 0;
		}	
		else{
			if (pos < (RX_BUF_SIZE - 1)){
				rxBuf[pos++] = ch;
			}
			else{
				// buffer overflow
			}
		}	
		HAL_UART_Receive_IT(huart, &ch, 1);
	}
}

void HAL_UART_TxCpltCallback(UART_HandleTypeDef *huart){
	if (huart == pHOST_UART){
		_tx_uart_busy = 0;
	}
}

void start_cli_handling(uint8_t terminator, cli_handler_t handler){
	g_terminator = terminator;
	g_handler = handler;
	HAL_UART_Receive_IT(pHOST_UART, &ch, 1);
}
