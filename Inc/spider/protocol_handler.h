/**
  ******************************************************************************
  * File Name          : protocol_handler.h
  * Description        : This file contains the common defines of the target application
  ******************************************************************************
  **/

#pragma once

#include <stdint.h>

#define REQUEST_TYPE_INFO 			('i')
#define REQUEST_TYPE_ACTION			('d')
#define REQUEST_TYPE_SET 				('s')
#define REQUEST_TYPE_NONE 			('\0')

#define REQUEST_ID_INTERNAL			('@')
#define REQUEST_ID_DEFAULT			('0')
#define REQUEST_ID_ASYNC_EVENT	('1')	

typedef enum 
{
	EXT_STATUS_OK = 0,
	EXT_BAD_REQUEST = 1,
	EXT_UNSUPPORTED_REQUEST_TYPE = 2,
	EXT_UNSUPPORTED_PROPERTY = 3,
	EXT_UNSUPPORTED_ACTION = 4,
	EXT_INVALID_PARAMETERS = 5,
	EXT_RESP_BUFFER_OVERFLOW = 6,
	EXT_INVALID_POSITION = 7,
	EXT_QUEUE_IS_FULL = 8,
	EXT_SPIDER_IN_PSM = 9,
	EXT_COMMAND_ABORTED = 10,
	EXT_CRITICAL_VCC = 11,
	EXT_CRITICAL_WORKLOAD = 12,
	EXT_LOW_VCC = 13,
	EXT_GENERIC_ERROR = 99,
} external_status_t;

void protocol_handle(const char *input);
void protocol_send_response(char response_id, external_status_t status, int additional_info_len);
