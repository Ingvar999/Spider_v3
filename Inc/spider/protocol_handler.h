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

typedef enum 
{
	EXT_STATUS_OK = 0,
	EXT_BAD_REQUEST,
	EXT_UNSUPPORTED_REQUEST_TYPE,
	EXT_UNSUPPORTED_PROPERTY,
	EXT_UNSUPPORTED_ACTION,
	EXT_INVALID_PARAMETERS,
	EXT_RESP_BUFFER_OVERFLOW,
	EXT_INVALID_POSITION,
	EXT_QUEUE_IS_FULL,
	EXT_POWER_IS_OFF,
	EXT_GENERIC_ERROR,
} external_status_t;

void protocol_handle(const char *input);
void protocol_send_response(char response_id, external_status_t status, int additional_info_len);
