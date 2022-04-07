/**
  ******************************************************************************
  * File Name          : buffer_queue.c
  * Description        : 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "buffer_queue.h"
#include "debug_utils.h"

void bufq_init(buffer_queue_t *handle, void* storage, int buf_size, int buf_count)
{
	handle->read_buffers_queue = xQueueCreate(buf_count, sizeof(void *));
	ASSERT_IF(ASSERT_CODE_09, handle->read_buffers_queue == NULL);
	handle->write_buffers_queue = xQueueCreate(buf_count, sizeof(void *));
	ASSERT_IF(ASSERT_CODE_0A, handle->write_buffers_queue == NULL);
	
	while (buf_count)
	{
		ASSERT_IF(ASSERT_CODE_0B, xQueueSend(handle->write_buffers_queue, (void *)&storage, (TickType_t)0) != pdPASS);
		storage = (char *)storage + buf_size;
		--buf_count;
	}
}

void* bufq_get_write_buffer(buffer_queue_t *handle, bool_t is_isr)
{
	void *buffer = NULL;
	
	if (is_isr)
	{
		BaseType_t xHigherPriorityTaskWoken;
		// We have not woken a task at the start of the ISR.
		xHigherPriorityTaskWoken = pdFALSE;
		
		if (xQueueReceiveFromISR(handle->write_buffers_queue, (void *)&buffer, &xHigherPriorityTaskWoken) == pdTRUE)
		{
			if ((xQueueSendFromISR(handle->read_buffers_queue, (void *)&buffer, &xHigherPriorityTaskWoken) != pdPASS) || (xHigherPriorityTaskWoken != pdFALSE))
			{
				LED_CHANGE(RED);
			}
		}
	}
	else
	{
		if (xQueueReceive(handle->write_buffers_queue, (void *)&buffer, (TickType_t)0) == pdTRUE)
		{
			ASSERT_IF(ASSERT_CODE_0C, xQueueSend(handle->read_buffers_queue, (void *)&buffer, (TickType_t)0) != pdPASS);
		}
	}
	return buffer;
}

void* bufq_get_read_buffer(buffer_queue_t *handle, bool_t is_isr)
{
	void *buffer = NULL;
	
	if (is_isr)
	{		
		xQueuePeekFromISR(handle->read_buffers_queue, (void *)&buffer);
	}
	else
	{
		xQueuePeek(handle->read_buffers_queue, (void *)&buffer, (TickType_t)0);
	}
	return buffer;
}

void bufq_free_buffer(buffer_queue_t *handle, bool_t is_isr)
{
	void *buffer = NULL;
	
	if (is_isr)
	{
		BaseType_t xHigherPriorityTaskWoken;
		// We have not woken a task at the start of the ISR.
		xHigherPriorityTaskWoken = pdFALSE;
		
		if (xQueueReceiveFromISR(handle->read_buffers_queue, (void *)&buffer, &xHigherPriorityTaskWoken) == pdTRUE)
		{
			if ((xQueueSendFromISR(handle->write_buffers_queue, (void *)&buffer, &xHigherPriorityTaskWoken) != pdPASS) || (xHigherPriorityTaskWoken != pdFALSE))
			{
				LED_CHANGE(RED);
			}
		}
	}
	else
	{
		if (xQueueReceive(handle->read_buffers_queue, (void *)&buffer, (TickType_t)0) == pdTRUE)
		{
			ASSERT_IF(ASSERT_CODE_0D, xQueueSend(handle->write_buffers_queue, (void *)&buffer, (TickType_t)0) != pdPASS);
		}
	}
}
