/**
  ******************************************************************************
  * File Name          : drv_uart.h
  * Description        : 
  ******************************************************************************
  **/

#pragma once
#include <stdint.h>
#include "defines.h"

#define UART_PORT_HOST				huart3
#define UART_PORT_ESP					huart5

#define RX_BUF_SIZE						(70)

typedef enum {
	UART_ID_HOST,
	UART_ID_ESP,
	UART_ID_LAST
} uart_port_id_t;

typedef void (*input_handler_t)(const char *data, uint32_t len);

void drv_uart_start_input_handling(uart_port_id_t uart_id, uint8_t terminator, input_handler_t handler);
bool_t drv_uart_is_tx_busy(uart_port_id_t uart_id);
void drv_uart_transfer(uart_port_id_t uart_id, uint8_t *buf, uint32_t len);
