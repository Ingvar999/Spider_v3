/**
  ******************************************************************************
  * File Name          : log.h
  * Description        : This file contains common constants/definitions
  ******************************************************************************
  **/

/* Define to prevent recursive inclusion -------------------------------------*/
#pragma once

#define DIRECT_LOG_ENABLE					(1)
#define BUFFER_LOG_ENABLE					(0)

#define LOG_LEVEL_NONE						(0)
#define LOG_LEVEL_ERR							(1)
#define LOG_LEVEL_WARN						(2)
#define LOG_LEVEL_INFO						(3)
#define LOG_LEVEL_DBG							(4)
#define LOG_LEVEL_LAST						(5)

#if DIRECT_LOG_ENABLE || BUFFER_LOG_ENABLE
#define _LOG_LEVEL_								LOG_LEVEL_DBG
#else
#define _LOG_LEVEL_								LOG_LEVEL_NONE	// Constant
#endif

#define LOG_MSG_BUF_SIZE					(50)
 
#if (_LOG_LEVEL_ > LOG_LEVEL_NONE)
#define PRINTF(...)								log_printf(LOG_LEVEL_NONE, __VA_ARGS__)
#else
#define PRINTF(...)
#endif

#if (_LOG_LEVEL_ >= LOG_LEVEL_ERR)
#define LOG_ERR(...)							log_printf(LOG_LEVEL_ERR, __VA_ARGS__)
#else
#define LOG_ERR(...)
#endif

#if (_LOG_LEVEL_ >= LOG_LEVEL_WARN)
#define LOG_WARN(...)							log_printf(LOG_LEVEL_WARN, __VA_ARGS__)
#else
#define LOG_WARN(...)
#endif

#if (_LOG_LEVEL_ >= LOG_LEVEL_INFO)
#define LOG_INFO(...)							log_printf(LOG_LEVEL_INFO, __VA_ARGS__)
#else
#define LOG_INFO(...)
#endif

#if (_LOG_LEVEL_ >= LOG_LEVEL_DBG)
#define LOG_DBG(...)							log_printf(LOG_LEVEL_DBG, __VA_ARGS__)
#else
#define LOG_DBG(...)
#endif
 
void log_printf(int level, const char *format, ...);
 
 
 