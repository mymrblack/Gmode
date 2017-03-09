#include "pwm_dec.h"

void dec_enable()
{
	cal_en = 1;
}


void dec_disable()
{
	cal_en = 0;
}

int dec_count()
{
	return sig_count;
}

void pwm_init(u8 rate,u32 divide)
{
	pwm_val = rate;
	divide_num = divide;
}

void pwm_enable()
{
	pwm_en = 1;
}

void pwm_disable()
{
	pwm_en = 0;
}

void pwm_direction(u8 direction)
{
	pwm_d = direction;
}
