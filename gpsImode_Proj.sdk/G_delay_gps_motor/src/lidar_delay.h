/*
 * lidar_delay.h
 *
 *  Created on: 2017��3��4��
 *      Author: Lin
 */

#ifndef SRC_LIDAR_DELAY_H_
#define SRC_LIDAR_DELAY_H_
#include "lidar_sys.h"

typedef	struct{
	int cycle;
	int tstart_width;
	int ch1_delay;
	int ch2_delay;
	int ch3_delay;
	int ch4_delay;
	int ch1_width;
	int ch2_width;
	int ch3_width;
	int ch4_width;
} delay_Data;

#define DELAY_CTRL_REG  0
#define DELAY_OUT1_REG  4
#define DELAY_OUT2_REG  8
#define DELAY_OUT3_REG  12
#define DELAY_OUT4_REG  16
#define TSTART_CONFIG_REG      20

#define DELAY_BASEADDR  0x43C30000

void delay_init(delay_Data *data_info);
void delay_config(int delay, int width, int reg_num);

#endif /* SRC_LIDAR_DELAY_H_ */
