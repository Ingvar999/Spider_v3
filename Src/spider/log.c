/**
  ******************************************************************************
  * File Name          : log.c
  * Description        : 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <stdarg.h>
#include <string.h>
#include <stdio.h>

#include "cmsis_os.h"
#include "log.h"
#include "drv_uart.h"

#if (_LOG_LEVEL_ > LOG_LEVEL_NONE)

#define LOG_PREFIX_LEN					(5)

static const char _log_level_prefix[LOG_LEVEL_LAST][LOG_PREFIX_LEN] = {
	"###  ",
	"ERR  ",
	"WARN ",
	"INFO ",
	"DBG  "
};

static uint8_t _log_msg_buf[LOG_MSG_BUF_SIZE];

void log_printf(int level, const char *format, ...)
{
	va_list args_list;
	int msg_len = LOG_PREFIX_LEN;
	
#if (DIRECT_LOG_ENABLE)
	while (drv_uart_is_tx_busy(UART_ID_HOST)) __asm("nop");
#endif
	
	memcpy(_log_msg_buf, _log_level_prefix[level], LOG_PREFIX_LEN);
	va_start(args_list, format);
	msg_len += vsnprintf((char *)_log_msg_buf + LOG_PREFIX_LEN, LOG_MSG_BUF_SIZE - LOG_PREFIX_LEN, format, args_list);
	va_end(args_list);

#if (DIRECT_LOG_ENABLE)
	drv_uart_transfer(UART_ID_HOST, _log_msg_buf, msg_len);
#endif
	
	if (msg_len >= LOG_MSG_BUF_SIZE)
	{
		LOG_ERR("Log Buffer overflow!!!\n");
	}
	
}

#endif
