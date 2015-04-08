/*
 * ClientController.c
 *
 * Created: 4/6/2015 1:37:42 AM
 *  Author: Brandon
 * Description: This Function will be used to handle application-specific commands over Ethernet and Wi-Fi to and from the server 
 */ 

#define F_CPU 8000000UL

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdio.h>
#include <string.h>
#include "ClientController.h"
#include "Ethernet/Ethernet.h"
#include "Print/PrintDriver.h"
#include "RAM/RAMDriver.h"
#include "Wifi/Wifi.h"
#include "RAM/MemoryMap.h"

char buffer[700];

void sendAvailableNetworks()
{
	networkScan();
	uint16_t tranLength = getTransmissionLength(); 
	printf("Tran Length: %d", tranLength);
	RAMPrint(WIFI_RAW_ADDRESS, tranLength); 
	//_delay_ms(1000);
	//Build file path 
	char filepath[100]; 
	strcpy(filepath, GET); 
	strcat(filepath, SSID_UPDATE);
	strcat(filepath, WIPRO_ID); 
	strcat(filepath, SSID_ID); 
	
	//Convert List of Networks to Query String
	uint16_t qLength = networkQueryString(filepath); 
	printf("Query Length: %d\n", qLength);
	RAMPrint(WIFI_QSTRING_ADDRESS, qLength);
	RAMRead(WIFI_QSTRING_ADDRESS, qLength, buffer);
	SendData(buffer, qLength, 0);
	printf("Sent!");
	
}
