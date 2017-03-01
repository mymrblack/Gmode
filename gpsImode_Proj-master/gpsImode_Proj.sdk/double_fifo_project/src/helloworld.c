/*
 * Copyright (c) 2009-2012 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "sleep.h"
#include "xsdps.h"
#include "xil_printf.h"
#include "fifo.h"
#include "tdc.h"
#include "GPS.h"
#include "SD_card.h"

extern Lidar_Data lidarData[FIFO_SIZE];
//#define BIN 82.3045
void TEST_gps_and_fifo(Lidar_Data *data);
void TEST_gps_and_fifo_and_SD(Lidar_Data *data);

/*****************************************************************************/
/**
*
* Main function to call the SD example.
*
* @param	None
*
* @return	XST_SUCCESS if successful, otherwise XST_FAILURE.
*
* @note		None
*
******************************************************************************/

int main(){
    TDC_config();

//    FIFO_test(lidarData);
//    TEST_gps_and_fifo(lidarData);
    TEST_gps_and_fifo_and_SD(lidarData);
    return 0;

}

void TEST_gps_and_fifo(Lidar_Data *data){
    int i;
    int fifoNum;
    print("Hello World\n\r");
    xil_printf("GPS and FIFO System Example Test \r\n");
    xil_printf("Waiting for GPS initial.. \r\n");
	Gps_Init();
    xil_printf("GPS initialed.  \r\n");
    Gps_FuncTest();
    xil_printf("Now you can turn your trigger system.  \r\n");

     FIFO_rst();
     while(1){
         while(1){
             fifoNum = FIFO_checkFifoStatus();
             if(fifoNum != 0){
                 break;
             }
             usleep(1);
         }

         for(i = 0; i < FIFO_SIZE; i++){
             FIFO_getData(&data[i], fifoNum);
         }
         xil_printf("%d\r\n", fifoNum);
         FIFO_printData(data, FIFO_SIZE, 300);
     }

}

void TEST_gps_and_fifo_and_SD(Lidar_Data *data){
    int i;
    int fifoNum;
    TCHAR dirPath[_MAX_LFN] = "0";

    print("Hello World\n\r");
    xil_printf("GPS and FIFO and SD System Example Test \r\n");
    xil_printf("Waiting for GPS initial.. \r\n");
	Gps_Init();
    xil_printf("GPS initialed.  \r\n");
    Gps_FuncTest();

    xil_printf("Waiting for FFS initial.. \r\n");
    Ffs_Init(dirPath); //this take a long time, so it was set in initial.
    xil_printf("FFS initialed.  \r\n");
    xil_printf("dirPath is : %s\r\n", dirPath);

    FIFO_rst();
    xil_printf("Now you can turn your trigger system.  \r\n");

     while(1){
         fifoNum = WaitUntilFifoIsFull();
         for(i = 0; i < FIFO_SIZE; i++){
             FIFO_getData(&data[i], fifoNum);
         }
         Ffs_CreateFileAndSaveData(data, dirPath);
         xil_printf("%d\r\n", fifoNum);
         FIFO_printData(data, FIFO_SIZE, 300);
     }

}

