#ifndef __PWM_DEC__H__
#define __PWM_DEC__H__

#include "xil_types.h"

#define MOTOR_BASEADDR 0x43C40000

#define REF_COUNT_ADDR  0
#define SIG_COUNT_ADDR  4
#define CAL_EN_ADDR     8
#define PWM_VAL_ADDR    12
#define DIVIDE_NUM_ADDR 16
#define PWM_EN_ADDR     20
#define PWM_D_ADDR      24  

/*
#define ref_count *(volatile unsigned int *)(MOTOR_BASEADDR + 0)
#define sig_count *(volatile unsigned int *)(MOTOR_BASEADDR + 4)
#define cal_en *(volatile unsigned int *)(MOTOR_BASEADDR + 8)
#define pwm_val *(volatile unsigned int *)(MOTOR_BASEADDR + 12)
#define divide_num *(volatile unsigned int *)(MOTOR_BASEADDR + 16)
#define pwm_en *(volatile unsigned int *)(MOTOR_BASEADDR + 20)
#define pwm_d *(volatile unsigned int *)(MOTOR_BASEADDR + 24)
*/

void dec_enable();
void dec_disable();
int dec_count();
void pwm_init(u8 rate,u32 divide);
void pwm_enable();
void pwm_disable();
void pwm_direction(u8 direction);

#endif
