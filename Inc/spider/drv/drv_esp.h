/**
  ******************************************************************************
  * File Name          : debug_tils.h
  * Description        : 
  ******************************************************************************
  **/

#pragma once
#include <stdint.h>

void drv_esp_init(void);
void drv_esp_handle_input(const char *input);
void drv_esp_send(const char *data, int data_len);
