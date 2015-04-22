/*
 * Communications.c
 *
 * Created: 4/5/2015 10:59:28 PM
 *  Author: Brandon
 */ 

#define F_CPU 8000000UL 

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdio.h>
#include "Ethernet/Ethernet.h"
#include "Print/PrintDriver.h"
#include "RAM/RAMDriver.h"
#include "Wifi/Wifi.h"
#include "RAM/MemoryMap.h"
#include "ClientController.h"

int main(void)
{
	_delay_ms(1000);
	char buffer[100];
	char* message = "What the fuck is this shit";
	uart_init();
	uart0_init(); 
	SPI_Init();  
	sei(); 
	//uart_send("help\n",5);
	//RAMWrite(message, 0, strlen(message));
	//RAMPrint(0, strlen(message));
	//RAMRead(0, 30, buffer);
	
	//ethernetInit();
	//printf("ethernetInit Done");
	//pollingInit();
	wifiInit(); 
	setMachineMode(); 
	networkScan(); 
	//
//
	printf("Done!\n");
    while(1)
    {
        //TODO:: Please write your application code 
    }
}