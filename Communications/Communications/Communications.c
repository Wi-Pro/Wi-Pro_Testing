/*
 * Communications.c
 *
 * Created: 4/5/2015 10:59:28 PM
 *  Author: Brandon
 */ 


#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdio.h>
#include "Ethernet/Ethernet.h"
#include "Print/PrintDriver.h"
#include "RAM/RAMDriver.h"
#include "Wifi/Wifi.h"
#include "RAM/MemoryMap.h"

int main(void)
{
	uart_init();
	uart0_init(); 
	SPI_Init(); 
	sei(); 
	//setMachineMode(); 
	//ethernetInit();
	//getRequestEthernet("GET http://www.wi-pro.us/uploads/hex/1000000000/flagfile.txt HTTP/1.1 \nHost: www.wi-pro.us \n\n");
	//getRequestEthernet("http://www.wi-pro.us/uploads/hex/1000000000/flagfile.txt ");  
	//sendRequestEthernet("", 0);
	networkScan(); 
	//ReceiveData(5, 0);
	printf("Reading from RAM...\n");
	RAMRead(WIFI_RAW_ADDRESS, 200);
	printf("Done!\n");
    while(1)
    {
        //TODO:: Please write your application code 
    }
}