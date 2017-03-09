#include "pwm_dec.h"
#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "sleep.h"
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

int motor(void){
	int decoder;
	u8 flag;
    init_platform();

    print("Hello ,welcome here\n\r");

    pwm_init(128,100);
    pwm_enable();
  //  pwm_disable();
    dec_enable();

    pwm_direction(0);

    while(1)
    {
    	decoder = dec_count();
   // 	pwm_direction(0);
    	if((decoder >2024000) && (flag == 0))
    	{
    		pwm_disable();
    		pwm_direction(1);
    		flag = 1;
    		usleep(200*1000);// wait for motor until it can be reverse.
    		pwm_enable();
    	}
    	else if((decoder < -2024000) && (flag == 1))
    	{
    		pwm_disable();
    		pwm_direction(0);
    		flag = 0;
    		usleep(200*1000);// wait for motor until it can be reverse.
    		pwm_enable();
    	}
    	else ;

    	printf("the value is %d \n",decoder);
    	sleep(1);
  //  	pwm_disable();
    }
    return 0;
}
