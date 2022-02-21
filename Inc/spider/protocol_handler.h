/**
  ******************************************************************************
  * File Name          : protocol_handler.h
  * Description        : This file contains the common defines of the target application
  ******************************************************************************
  **/

#pragma once

#include <stdint.h>

uint32_t protocol_handle(const char *input, char *output, uint32_t output_buf_size);
