#ifndef __PWM_DEC__H__
#define __PWM_DEC__H__

#include "xil_types.h"

#define dec_pwm_addr 0x43C00000

#define ref_count *(volatile unsigned int *)(dec_pwm_addr + 0)
#define sig_count *(volatile unsigned int *)(dec_pwm_addr + 4)
#define cal_en *(volatile unsigned int *)(dec_pwm_addr + 8)
#define pwm_val *(volatile unsigned int *)(dec_pwm_addr + 12)
#define divide_num *(volatile unsigned int *)(dec_pwm_addr + 16)
#define pwm_en *(volatile unsigned int *)(dec_pwm_addr + 20)
#define pwm_d *(volatile unsigned int *)(dec_pwm_addr + 24)

void dec_enable();
void dec_disable();
int dec_count();
void pwm_init(u8 rate,u32 divide);
void pwm_enable();
void pwm_disable();
void pwm_direction(u8 direction);

#endif
