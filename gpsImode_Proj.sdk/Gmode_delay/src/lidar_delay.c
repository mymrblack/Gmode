/*
 * lidar_delay.c
 *
 *  Created on: 2017��3��4��
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

//�����ϵ㣺����ʱģ���Ӳ��д���ˣ���û��Tstart��out_1���������ch1ͨ���Ĵ���
//����Ӳ��ģ��ģ����Ŵ������������࣬ch1����ʱ��������ͬ���������Ҫ����delay�ĳ�ʼ����
