/*
 * lidar_delay.c
 *
 *  Created on: 2017年3月4日
 *      Author: Lin
 */
#include "lidar_delay.h"


void delay_init(delay_Data *data_info){
    delay_config(data_info -> cycle, data_info -> tstart_width, TSTART_CONFIG_REG);
    delay_config(data_info -> ch1_delay, data_info -> ch1_width, DELAY_OUT1_REG);
    delay_config(data_info -> ch2_delay, data_info -> ch2_width, DELAY_OUT2_REG);
    delay_config(data_info -> ch3_delay, data_info -> ch3_width, DELAY_OUT3_REG);
    delay_config(data_info -> ch4_delay, data_info -> ch4_width, DELAY_OUT4_REG);
    lidar_mWriteReg(DELAY_BASEADDR, DELAY_CTRL_REG, 1);
    lidar_mWriteReg(DELAY_BASEADDR, DELAY_CTRL_REG, 0);
}


void delay_config(int delay, int width, int reg_num){
    int config_data = 0;

    config_data = (delay << 16) | width;

    lidar_mWriteReg(DELAY_BASEADDR, reg_num, config_data);
}

//工作断点：把延时模块的硬件写完了，但没把Tstart和out_1输出，其中ch1通道的触发
//是用硬件模拟的，随着触发次数的增多，ch1的延时会有所不同。软件端需要配置delay的初始化。
