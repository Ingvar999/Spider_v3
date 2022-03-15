/**
  ******************************************************************************
  * File Name          : drv_servo.c
  * Description        : 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "drv_uart.h"
#include "stm32f4xx_hal.h"

extern UART_HandleTypeDef UART_PORT_HOST;
extern UART_HandleTypeDef UART_PORT_ESP;

typedef struct {
	UART_HandleTypeDef *handle;
	input_handler_t input_handler;
	volatile bool_t is_tx_busy;
	uint32_t rx_pos;
	char terminator;
} uart_port_config_t;

static uart_port_config_t uart_config[UART_ID_LAST] = {
	{&UART_PORT_HOST, NULL, FALSE, 0, 0},
	{&UART_PORT_ESP, NULL, FALSE, 0, 0},
};
static uint8_t ch;
static uint8_t rx_buf[UART_ID_LAST][RX_BUF_SIZE];

static uart_port_id_t get_uart_port_id(UART_HandleTypeDef *huart){
	uart_port_id_t uart_port = UART_ID_HOST;
	
	for (; uart_port < UART_ID_LAST; uart_port++){
		if (huart == uart_config[uart_port].handle){
			return uart_port;
		}
	}
	return uart_port;
}

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart){
	uart_port_id_t uart_port = get_uart_port_id(huart);
	
	if (uart_port < UART_ID_LAST){
		if (ch == uart_config[uart_port].terminator){
			rx_buf[uart_port][uart_config[uart_port].rx_pos] = 0;
			uart_config[uart_port].input_handler((char *)rx_buf[uart_port], uart_config[uart_port].rx_pos + 1);
			uart_config[uart_port].rx_pos = 0;
		}	
		else{
			if (uart_config[uart_port].rx_pos < (RX_BUF_SIZE - 1)){
				rx_buf[uart_port][uart_config[uart_port].rx_pos++] = ch;
			}
			else{
				// buffer overflow
			}
		}	
		HAL_UART_Receive_IT(huart, &ch, 1);
	}
}

void HAL_UART_TxCpltCallback(UART_HandleTypeDef *huart){
	uart_port_id_t uart_port = get_uart_port_id(huart);
	
	if (uart_port < UART_ID_LAST){
		uart_config[uart_port].is_tx_busy = FALSE;
	}
}

void drv_uart_start_input_handling(uart_port_id_t uart_id, uint8_t terminator, input_handler_t handler){
	uart_config[uart_id].terminator = terminator;
	uart_config[uart_id].input_handler = handler;
	HAL_UART_Receive_IT(uart_config[uart_id].handle, &ch, 1);
}

bool_t drv_uart_is_tx_busy(uart_port_id_t uart_id){
	return uart_config[uart_id].is_tx_busy;
}
void drv_uart_transfer(uart_port_id_t uart_id, uint8_t *buf, uint32_t len){
	while (uart_config[uart_id].is_tx_busy) __asm("nop");
	uart_config[uart_id].is_tx_busy = TRUE;
	HAL_UART_Transmit_IT(uart_config[uart_id].handle, buf, len);
}
