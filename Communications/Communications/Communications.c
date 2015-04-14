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
	uart_init();
	uart0_init(); 
	SPI_Init(); 
	wifiInit(); 
	sei(); 
	//setMachineMode(); 
	//ethernetInit();
	//networkConnect("Wi-Pro", "brightshoe902");
	//getRequestEthernet("GET http://www.wi-pro.us/uploads/hex/1000000000/flagfile.txt HTTP/1.1 \nHost: www.wi-pro.us \n\n");
	//getRequestEthernet("http://www.wi-pro.us/uploads/hex/1000000000/flagfile.txt ");  
	//sendRequestEthernet("", 0);
	//networkScan(); 
	//sendAvailableNetworks(); 
	//pollingInit(); 
	getFlagStatus(); 
	//getHexFile(); 
	RAMPrint(HEX_FILE_ADDRESS, 200);
	//getFlagStatus(); 
	//clearFlags();
	//getFlagStatus(); 
	//ReceiveData(5, 0);
	//printf("Reading from RAM...\n");

	printf("Done!\n");
    while(1)
    {
        //TODO:: Please write your application code 
    }
}