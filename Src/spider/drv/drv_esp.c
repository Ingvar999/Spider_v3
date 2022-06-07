/**
  ******************************************************************************
  * File Name          : drv_esp.c
  * Description        : 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "drv_esp.h"
#include "drv_uart.h"
#include "debug_utils.h"
#include "defines.h"
#include "protocol_handler.h"
#include "buffer_queue.h"

#define ESP_OK														"OK"
#define ESP_ERR														"ERROR"
#define INVALID_CONNECTION_ID							'$'

#define SEND_ESP_COMMAND(cmd)							drv_uart_transfer(UART_ID_ESP, (const uint8_t*)(cmd "\r"), sizeof(cmd) + 1)
#define SEND_ESP_TRANSFER_REQ(conn, len)	drv_uart_transfer(UART_ID_ESP, (const uint8_t*)esp_cmd_buf, sprintf(esp_cmd_buf, "AT+CIPSEND=%c,%d\r", conn, len))

#define ESP_CMD_BUF_SIZE									(28)
#define ESP_TX_DATA_BUF_QUEUE_SIZE				(2)
#define ESP_TX_DATA_BUF_SIZE							(128)

typedef enum 
{
	ESP_RESET = 0,
	ESP_INIT_1,
	ESP_INIT_2,
	ESP_INIT_3,
	ESP_INIT_4,
	ESP_INIT_5,
	ESP_READY,
	ESP_DISCONNECT,
	ESP_SEND_1,
	ESP_SEND_2,
	ESP_SEND_BUSY,
} esp_state_t;

static esp_state_t esp_state = ESP_RESET;
static char active_connection = INVALID_CONNECTION_ID;
static char esp_tx_data_buf[ESP_TX_DATA_BUF_QUEUE_SIZE][ESP_TX_DATA_BUF_SIZE];
static buffer_queue_t esp_tx_queue;
static char esp_cmd_buf[ESP_CMD_BUF_SIZE];

void drv_esp_init(void)
{
	SEND_ESP_COMMAND("AT");
	esp_state = ESP_INIT_1;
	bufq_init(&esp_tx_queue, esp_tx_data_buf, ESP_TX_DATA_BUF_SIZE, ESP_TX_DATA_BUF_QUEUE_SIZE);
}

static void handle_disconnect(char connection)
{
	if (active_connection == connection)
	{
		active_connection = INVALID_CONNECTION_ID;
		// handle global event
	}
	LOG_INFO("Disconnected %c", connection);
}

static void disconnect(char connection)
{
	LOG_INFO("Disconnect %c...", connection);
	drv_uart_transfer(UART_ID_ESP, (const uint8_t*)esp_cmd_buf, sprintf(esp_cmd_buf, "AT+CIPCLOSE=%c\r", connection));
	esp_state = ESP_DISCONNECT;
}

static void handle_event(const char* input)
{
	if (str_starts_with(input, "+IPD"))
	{
		char connection = input[5];
		if (connection == active_connection)
		{
			protocol_handle(strchr(input, ':') + 1);
		}
		else
		{
			// illegal message
		}
	}
	else if (str_starts_with(input + 2, "CONNECT")) 
	{
		char connection = input[0];
		if ((active_connection == INVALID_CONNECTION_ID) || (active_connection == connection))
		{
			active_connection = connection;
		}
		else
		{
			disconnect(connection);
		}
		LOG_INFO("New connection %c", input[0]);
  }
  else if (str_starts_with(input + 2, "CLOSED") || str_starts_with(input + 2, "CONNECT FAIL"))
	{
		handle_disconnect(input[0]);
  }
	else
	{
		LOG_WARN("ESP Unhandled event: %s", input);
	}
}

void drv_esp_send(const char *data, int data_len)
{
	if (data_len > (ESP_TX_DATA_BUF_SIZE - sizeof(int)))
	{
		LOG_ERR("Too huge data to send via esp");
	}
	else
	{
		uint8_t *esp_buf;
		if (active_connection == INVALID_CONNECTION_ID)
		{
			LOG_WARN("No active connection to send");
		}
		else if ((esp_buf = bufq_get_write_buffer(&esp_tx_queue, false)) == NULL)
		{
			LOG_ERR("ESP too busy for send request");
		}
		else
		{
			if (esp_state == ESP_READY)
			{
				SEND_ESP_TRANSFER_REQ(active_connection, data_len);
				esp_state = ESP_SEND_1;
			}
			else
			{
				LOG_DBG("Postpone esp send");
			}
			*((int*) esp_buf) = data_len;
			memcpy(esp_buf + sizeof(int), data, data_len);
		}
	}
}

void drv_esp_handle_input(const char *input)
{
	if (input[0] != '\r')
	{
		bool is_ok = str_starts_with(input, ESP_OK) ? true : false;
		bool is_err = str_starts_with(input, ESP_ERR) ? true : false;
		
		if (is_err)
		{
			LOG_ERR("ESP state %d, msg: %s", esp_state, input);
		}
		else
		{
			LOG_DBG("ESP: %s", input);
		}
		
		switch (esp_state)
		{
			case ESP_RESET:
				// igore all messages
			break;
			case ESP_INIT_1:
				// wait for AT->OK in case of soft reset and "ready" if PowerOn
				if (is_ok || str_starts_with(input, "ready"))
				{
					SEND_ESP_COMMAND("ATE0");
					esp_state = ESP_INIT_2;
				}
			break;
			case ESP_INIT_2:
				if (is_ok)
				{
					SEND_ESP_COMMAND("AT+CIPMUX=1");
					esp_state = ESP_INIT_3;
				}
			break;
			case ESP_INIT_3:
				if (is_ok)
				{
					SEND_ESP_COMMAND("AT+CIPSERVER=1,80");
					esp_state = ESP_INIT_4;
				}
			break;
			case ESP_INIT_4:
				if (is_ok)
				{
					SEND_ESP_COMMAND("AT+CIPSTO=300");
					esp_state = ESP_INIT_5;
				}
			break;
			case ESP_INIT_5:
				if (is_ok)
				{
					esp_state = ESP_READY;
				}
			break;
			case ESP_READY:
				handle_event(input);
			break;
			case ESP_DISCONNECT:
				if (str_starts_with(input + 2, "CLOSED"))
				{
					handle_disconnect(input[0]);
				}
				else if (is_ok)
				{
					esp_state = ESP_READY;
				}
				else
				{
					LOG_WARN("Expected esp connection to close, got: %s");
				}
			break;
			case ESP_SEND_1:
				if (is_ok)
				{
					uint8_t *esp_buf = bufq_get_read_buffer(&esp_tx_queue, false);
					drv_uart_transfer(UART_ID_ESP, esp_buf + sizeof(int), *((int*) esp_buf));
					esp_state = ESP_SEND_2;
				}
				else if (str_starts_with(input, "busy"))
				{
					esp_state = ESP_SEND_BUSY;
				}
			case ESP_SEND_2:
				if (str_starts_with(input, "Recv"))
				{
					bufq_free_buffer(&esp_tx_queue, false);
				}
				else if (str_starts_with(input, "SEND OK"))
				{
					esp_state = ESP_READY;
				}
				else if (str_starts_with(input, "busy"))
				{
					esp_state = ESP_SEND_BUSY;
				}
			break;
			case ESP_SEND_BUSY:
				LOG_ERR("Esp BUSY");
			break;
			default:
				ASSERT(ASSERT_CODE_0E);
		}
		
		uint8_t *esp_buf = bufq_get_read_buffer(&esp_tx_queue, false);
		if ((esp_buf != NULL) && (esp_state == ESP_READY))
		{
			SEND_ESP_TRANSFER_REQ(active_connection, *((int*) esp_buf));
			esp_state = ESP_SEND_1;
		}
	}
}
