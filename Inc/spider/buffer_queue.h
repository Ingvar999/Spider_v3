/**
  ******************************************************************************
  * File Name          : assert.h
  * Description        : This file contains common constants/definitions
  ******************************************************************************
  **/

/* Define to prevent recursive inclusion -------------------------------------*/
#pragma once
#include "cmsis_os.h"
#include "defines.h"

typedef struct {
	xQueueHandle write_buffers_queue;
	xQueueHandle read_buffers_queue;
} buffer_queue_t;

void bufq_init(buffer_queue_t *handle, void* storage, int buf_size, int buf_count);

void* bufq_get_write_buffer(buffer_queue_t *handle, bool_t is_isr);
void* bufq_get_read_buffer(buffer_queue_t *handle, bool_t is_isr);
void bufq_free_buffer(buffer_queue_t *handle, bool_t is_isr);
