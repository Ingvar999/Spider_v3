/**
  ******************************************************************************
  * File Name          : spider_main.c
  * Description        : Main app specific body
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <stdlib.h>
#include "spider_main.h"
#include "debug_utils.h"
#include "cmsis_os.h"
#include "drv_servo.h"
#include "drv_uart.h"
#include "defines.h"
#include "protocol_handler.h"
#include "command_manager.h"
#include "position_manager.h"
#include "buffer_queue.h"
#include "drv_esp.h"
#include "drv_gyro.h"

#define HEART_BEAT_DELAY					(50)
#define LED_SWITCH_TIMEOUT				(3000)
#define GYRO_UPDATE_TIMEOUT				(200)

#define HOST_RX_BUF_SIZE					(28)
#define ESP_RX_BUF_SIZE						RX_BUF_SIZE
#define ESP_INPUT_QUEUE_SIZE			(3)

/* Private variables ---------------------------------------------------------*/
static osThreadId HeartBeatTaskHandle, InputHandlerTaskHandle, CommandManagerTaskHandle;
static char cli_string[HOST_RX_BUF_SIZE];
static char esp_input_buf[ESP_INPUT_QUEUE_SIZE][ESP_RX_BUF_SIZE];
static buffer_queue_t esp_input_queue;
static volatile bool_t cli_in_process = FALSE;
static bool_t is_esp_config_mode = FALSE;

/* Private function prototypes -----------------------------------------------*/
static void StartInputHandlerTask(void const * argument);
static void StartHeartBeatTask(void const * argument);
static void StartCommandManagerTask(void const * argument);

void cli_event_handler(const char *data, uint32_t len)
{
	if (!cli_in_process && HOST_RX_BUF_SIZE >= len){
		memcpy(cli_string, data, len);
		cli_in_process = TRUE;
		if (osThreadResume(InputHandlerTaskHandle) != osOK){
			LED_ON(RED);
		}
	}
	else {
		// HOST packet lost
		LED_ON(RED);
	}
}

void esp_event_handler(const char *data, uint32_t len)
{
	void *buffer;
	
	if ((ESP_RX_BUF_SIZE >= len) && ((buffer = bufq_get_write_buffer(&esp_input_queue, TRUE)) != NULL)){
		memcpy(buffer, data, len);
		if (osThreadResume(InputHandlerTaskHandle) != osOK){
			LED_ON(RED);
		}
	}
	else {
		// ESP packet lost
		LED_ON(RED);
	}
}

void post_init_handler(void)
{
	TIMING_MES_VAR;
	START_MESURE();
	drv_uart_set_transfer_mode(UART_ID_HOST, TRANSFER_SYNC_MODE);
	
	bufq_init(&esp_input_queue, esp_input_buf, ESP_RX_BUF_SIZE, ESP_INPUT_QUEUE_SIZE);
	drv_uart_start_input_handling(UART_ID_HOST, '\n', cli_event_handler);
	drv_uart_start_input_handling(UART_ID_ESP, '\n', esp_event_handler);
	drv_esp_init();
	
	drv_servo_init();
	cmd_mgr_init();
	pos_mgr_set_init_state();
	
	osThreadDef(InputHandlerTask, StartInputHandlerTask, osPriorityNormal, 0, configMINIMAL_STACK_SIZE);
  InputHandlerTaskHandle = osThreadCreate(osThread(InputHandlerTask), NULL);
	osThreadDef(HeartBeatTask, StartHeartBeatTask, osPriorityBelowNormal, 0, configMINIMAL_STACK_SIZE);
  HeartBeatTaskHandle = osThreadCreate(osThread(HeartBeatTask), NULL);
	osThreadDef(CommandManagerTask, StartCommandManagerTask, osPriorityNormal, 0, configMINIMAL_STACK_SIZE);
  CommandManagerTaskHandle = osThreadCreate(osThread(CommandManagerTask), NULL);
	
	drv_gyro_init();
	
	LOG_INFO("Init Done!\n");
	END_MESURE("Init");
	drv_uart_set_transfer_mode(UART_ID_HOST, TRANSFER_ASYNC_MODE);
}

static void StartInputHandlerTask(void const * argument)
{
	while (1)
	{
		if (cli_in_process)
		{
			if (cli_string[0] == 'e')
			{
				/*
				int val = atoi(cli_string + 1);
				if (val >= 0 && val <= 180)
				{
					drv_servo_set(0, val);
				}*/
				if (str_starts_with(cli_string + 1, "esp"))
				{
					is_esp_config_mode = !is_esp_config_mode;
					LOG_INFO("ESP config mode: %d\n", is_esp_config_mode);
				}
			}
			else if (is_esp_config_mode)
			{
				uint32_t len = strlen(cli_string);
				cli_string[len++] = '\r';
				cli_string[len++] = '\n';
				drv_uart_transfer(UART_ID_ESP, (uint8_t*)cli_string, len);
			}
			else
			{
				protocol_handle(cli_string);
			}
			cli_in_process = FALSE;
		}
		
		char *esp_string;
		if ((esp_string = bufq_get_read_buffer(&esp_input_queue, FALSE)) != NULL)
		{
			if (is_esp_config_mode)
			{
				uint32_t len = strlen(esp_string);
				esp_string[len - 1] = '\n'; // replace /r with /n
				drv_uart_transfer(UART_ID_HOST, (uint8_t*)esp_string, len);
			}
			else
			{
				drv_esp_handle_input(esp_string);
			}
			bufq_free_buffer(&esp_input_queue, FALSE);
		}
		
		if (!cli_in_process && (bufq_get_read_buffer(&esp_input_queue, FALSE) == NULL))
			if (osThreadSuspend(osThreadGetId()) != osOK){
				ASSERT(ASSERT_CODE_03);
			}
	}
}

static void StartHeartBeatTask(void const * argument)
{
	static uint32_t last_wake_time;
	static int led_counter = LED_SWITCH_TIMEOUT / HEART_BEAT_DELAY;
	static int gyro_counter = GYRO_UPDATE_TIMEOUT / HEART_BEAT_DELAY;
	
	while (1)
	{
		last_wake_time = osKernelSysTick();
		
		if (led_counter-- == 0) 
		{
			LED_CHANGE(GREEN);
			led_counter = LED_SWITCH_TIMEOUT / HEART_BEAT_DELAY;
		}
		
		if (gyro_counter-- == 0) 
		{
			drv_gyro_update(GYRO_UPDATE_TIMEOUT);
			gyro_counter = GYRO_UPDATE_TIMEOUT / HEART_BEAT_DELAY;
		}
		
		if (pos_mgr_update_legs_position(HEART_BEAT_DELAY))
		{
			if (osThreadResume(CommandManagerTaskHandle) != osOK)
			{
				ASSERT(ASSERT_CODE_04);
			}
		}
		else
		{
			LOG_DBG("Legs busy\n");
		}
		
		osDelayUntil(&last_wake_time, HEART_BEAT_DELAY);
	}
}

static void StartCommandManagerTask(void const * argument)
{
	while (1)
	{
		cmd_mgr_process();
		if (osThreadSuspend(osThreadGetId()) != osOK)
		{
			ASSERT(ASSERT_CODE_05);
		}
	}
}
