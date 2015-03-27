/*
 * WifiModule.c
 *
 * Created: 3/7/2015 5:09:19 PM
 *  Author: Brandon
 */ 

#define F_CPU 8000000UL

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include "PrintDriver.h"
#include "WifiDriver.h"
#include "Wifi.h"


int main(void)
{
	//cli(); 
	uart_init();
	uart0_init(); 
	//printf("%s\n", string);
	sei(); 
	//unsigned char* command = "scan";
	//uart_send(command, 6);
	//printf("Sending!\n");
	wifiInit(); 
	setMachineMode();
	//sendCommand(GET, "wlan", NOVAL); 
	//uart_send("scan\r\n\0", 7);
	//char* data = getReceiveBuffer();
	//networkScan();
	//setTestPrint(); 
	//networkScan(); 
	//because fuck encryption
	networkConnect("Wi-Pro", "brightshoe902");
	_delay_ms(3100);
	serverConnect("www.wi-pro.us", "80"); 
	//setHumanMode();
	unsigned const char* data = getReceiveBuffer(); 
	//printf("Found Receive!\n");
	//printf("Received Data: %s\n", data);
	//int length = strlen(data);
	//printf("Message: ");
	printf("Done!\n");
}


