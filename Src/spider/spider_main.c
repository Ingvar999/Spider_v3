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
#include "spider_main.h"
#include "debug_utils.h"
#include "cmsis_os.h"
#include "drv_servo.h"
#include "drv_uart.h"
#include "defines.h"
#include "protocol_handler.h"
#include "command_manager.h"
#include "position_manager.h"

#define HEART_BEAT_DELAY					(100)
#define LED_SWITCH_TIMEOUT				(3000)

#define HOST_RX_BUF_SIZE					(30)
#define ESP_RX_BUF_SIZE						RX_BUF_SIZE
#define OUTPUT_BUFFER_SIZE				(100)

/* Private variables ---------------------------------------------------------*/
static osThreadId HeartBeatTaskHandle, InputHandlerTaskHandle, CommandManagerTaskHandle;
static char cli_string[HOST_RX_BUF_SIZE];
static char esp_string[ESP_RX_BUF_SIZE];
static volatile bool_t cli_in_process = FALSE, esp_in_process = FALSE;
static char output_string[OUTPUT_BUFFER_SIZE];

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
			ASSERT(ASSERT_CODE_01);
		}
	}
	else {
		LOG_ERR("Cli input lost!\n");
	}
}

void esp_event_handler(const char *data, uint32_t len)
{
	if (!esp_in_process && ESP_RX_BUF_SIZE >= len){
		memcpy(esp_string, data, len);
		esp_in_process = TRUE;
		if (osThreadResume(InputHandlerTaskHandle) != osOK){
			ASSERT(ASSERT_CODE_02);
		}
	}
	else {
		LOG_ERR("Esp input lost!\n");
	}
}

void post_init_handler(void)
{
	osThreadDef(InputHandlerTask, StartInputHandlerTask, osPriorityNormal, 0, configMINIMAL_STACK_SIZE);
  InputHandlerTaskHandle = osThreadCreate(osThread(InputHandlerTask), NULL);
	osThreadDef(HeartBeatTask, StartHeartBeatTask, osPriorityBelowNormal, 0, configMINIMAL_STACK_SIZE);
  HeartBeatTaskHandle = osThreadCreate(osThread(HeartBeatTask), NULL);
	osThreadDef(CommandManagerTask, StartCommandManagerTask, osPriorityNormal, 0, configMINIMAL_STACK_SIZE);
  CommandManagerTaskHandle = osThreadCreate(osThread(CommandManagerTask), NULL);
	
	drv_uart_set_transfer_mode(UART_ID_HOST, TRANSFER_SYNC_MODE);
	
	drv_servo_init();
	drv_uart_start_input_handling(UART_ID_HOST, '\n', cli_event_handler);
	drv_uart_start_input_handling(UART_ID_ESP, '\n', esp_event_handler);
	LOG_INFO("Init Done!\n");
	
	drv_uart_set_transfer_mode(UART_ID_HOST, TRANSFER_ASYNC_MODE);
}

static void StartInputHandlerTask(void const * argument)
{
	while (1)
	{
		if (cli_in_process)
		{
			/*int val = atoi(cli_string);
			if (val >= 0 && val <= 180)
			{
				drv_servo_set(0, val);
			}*/
			drv_uart_transfer(UART_ID_HOST, (uint8_t *)output_string, protocol_handle(cli_string, output_string, OUTPUT_BUFFER_SIZE));
			cli_in_process = FALSE;
		}
		
		if (esp_in_process)
		{
			esp_in_process = FALSE;
		}
		
		if (!cli_in_process && !esp_in_process)
			if (osThreadSuspend(osThreadGetId()) != osOK){
				ASSERT(ASSERT_CODE_03);
			}
	}
}

static void StartHeartBeatTask(void const * argument)
{
	static uint32_t last_wake_time;
	static int led_counter = 0;
	
	while (1)
	{
		last_wake_time = osKernelSysTick();
		
		if (led_counter-- == 0) 
		{
			LED_CHANGE(GREEN);
			led_counter = LED_SWITCH_TIMEOUT / HEART_BEAT_DELAY;
		}
		
		if (0)//(pos_mgr_update_legs_position(HEART_BEAT_DELAY))
		{
			if (osThreadResume(InputHandlerTaskHandle) != osOK)
			{
				ASSERT(ASSERT_CODE_04);
			}
		}
		
		osDelayUntil(&last_wake_time, HEART_BEAT_DELAY);
	}
}

static void StartCommandManagerTask(void const * argument)
{
	while (1)
	{
		//cmd_mgr_process();
		if (osThreadSuspend(osThreadGetId()) != osOK)
		{
			ASSERT(ASSERT_CODE_05);
		}
	}
}
