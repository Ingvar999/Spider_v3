/**
  ******************************************************************************
  * File Name          : config.c
  * Description        : 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/

#include "config.h"
#include "debug_utils.h"

typedef struct {
	uint32_t magic;
	config_t config;
	uint32_t checksum;
} flash_config_t;

config_t global_config;
static const config_t default_config = {
	3, // speed
	0, // postion vertical
	0, // position horizontal
	true, // workload alignment enable
	true, // gyro control enable
};

static void set_default_config()
{
	memcpy(&global_config, &default_config, sizeof(config_t));
}

static uint32_t calc_checksum(const uint32_t *data, uint32_t size)
{
	uint32_t res = 0;
	size /= sizeof(uint32_t);
	
	while(size)
	{
		res += (*data) * (size--);
		++data;
	}
	return res;
}	

void init_config(void)
{
	if (restore_config() != CFG_SUCCESS)
	{
		LOG_WARN("Unable to load config, use default");
		set_default_config();
	}
}

config_status_t restore_config(void)
{
	config_status_t status = CFG_SUCCESS;
	const flash_config_t *cfg = (void*)CONFIG_FLASH_ADDR;
	
	if ((cfg->magic == CONFIG_FLASH_MAGIC) &&
			(calc_checksum((uint32_t *)&cfg->config, sizeof(config_t)) == cfg->checksum))
	{
		memcpy(&global_config, &cfg->config, sizeof(config_t));
	}
	else
	{
		status = CFG_NOT_INITIALIZED;
	}
	return status;
}

config_status_t persist_config(void)
{
	config_status_t status = CFG_SUCCESS;
	const flash_config_t *cfg = (void*)CONFIG_FLASH_ADDR;
	
	uint32_t checksum = calc_checksum((uint32_t*)&global_config, sizeof(config_t));
	if (checksum != cfg->checksum)
	{
		HAL_FLASH_Unlock();
		uint32_t sector;
		FLASH_EraseInitTypeDef erase_typedef;
	
		erase_typedef.TypeErase = FLASH_TYPEERASE_SECTORS;
		erase_typedef.Sector = CONFIG_FLASH_SECTOR;
		erase_typedef.NbSectors = 1;
		erase_typedef.VoltageRange = FLASH_VOLTAGE_RANGE_3;
		if (HAL_FLASHEx_Erase(&erase_typedef, &sector) == HAL_OK)
		{
			if (HAL_FLASH_Program(FLASH_TYPEPROGRAM_WORD, (uint32_t)&cfg->magic, CONFIG_FLASH_MAGIC) == HAL_OK)
			{
			  int size = sizeof(config_t) / sizeof(uint32_t);
				uint32_t dst = (uint32_t)&cfg->config;
				uint32_t *src = (uint32_t*)&global_config;
				
				while (size--)
				{
					if (HAL_FLASH_Program(FLASH_TYPEPROGRAM_WORD, dst, *src) != HAL_OK)
					{
						status = CFG_WRITE_ERROR;
						break;
					}
					dst += sizeof(uint32_t);
					++src;
				}
				if (status == CFG_SUCCESS)
				{
					if (HAL_FLASH_Program(FLASH_TYPEPROGRAM_WORD, (uint32_t)&cfg->checksum, checksum) == HAL_OK)
					{
						if ((cfg->magic != CONFIG_FLASH_MAGIC) || (cfg->checksum != checksum))
						{
							status = CFG_READ_ERROR;
						}
					}
					else
					{
						status = CFG_WRITE_ERROR;
					}
				}
			}
			else
			{
				status = CFG_WRITE_ERROR;
			}
		}
		else
		{
			status = CFG_ERASE_ERROR;
		}
		
		HAL_FLASH_Lock();
	}
		
	return status;
}

config_status_t reset_config(void)
{
	set_default_config();
	return persist_config();
}
