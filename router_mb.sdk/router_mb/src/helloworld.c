/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

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
#include "xil_printf.h"
#include "xbram.h"

XBram bramInstance;
XBram_Config *bramConfig;

void printIP(u32 ip) {
    int p1 = ip >> 24, p2 = (ip >> 16) & 0xFF, p3 = (ip >> 8) & 0xFF, p4 = ip & 0xFF;
    xil_printf("%d.%d.%d.%d", p1, p2, p3, p4);
}

u32 all_routes[16][4];
void printCurrentRoutingTable() {
    u32 offset = 0;
    int j = 0;
    for (int flag = 1;flag;j++) {
        u32 route[4];
        flag = 0;
        for (u32 i = 0;i < 4;i++) {
            route[i] = XBram_In32(bramConfig->MemBaseAddress + offset + i * 4);
            if (route[i]) {
                flag = 1;
            }
        }
        offset += 16;
        memcpy(all_routes[j], route, sizeof(route));
    }
    j--;
    xil_printf("Hardware table:\r\n");
    for (int i = 0;i < j;i++) {
        xil_printf("\t%d: ", i);
        printIP(all_routes[i][2]);
        xil_printf(" netmask ");
        printIP(all_routes[i][1]);
        xil_printf(" via ");
        printIP(all_routes[i][0]);
        xil_printf(" dev port%ld\r\n", all_routes[i][3]);
    }
}

int main()
{
    init_platform();

    xil_printf("begin\r\n");

    bramConfig = XBram_LookupConfig(XPAR_BRAM_0_DEVICE_ID);
    if (!bramConfig) {
        xil_printf("No config found\n");
    }

    XBram_CfgInitialize(&bramInstance, bramConfig, bramConfig->CtrlBaseAddress);

    printCurrentRoutingTable();

    while(1);

    cleanup_platform();
    return 0;
}
