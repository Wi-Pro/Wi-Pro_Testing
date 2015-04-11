/*
 * Wifi.c
 *
 * Created: 3/15/2015 1:03:20 AM
 *  Author: Brandon
 *  Description: Uses the WifiDriver.c functions to create a useful application layer that will allow easy setup and interfacing
 *  with the WiFi module 
 */ 

#define F_CPU 8000000UL

#include <avr/io.h>
#include <stdio.h>
#include <string.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "../Print/PrintDriver.h"
#include "WifiDriver.h"
#include "Wifi.h"
#include "../RAM/MemoryMap.h"
#include "../RAM/RAMDriver.h"

//connStatus wifiModule; 

void wifiInit()
{
	DDRD |= (1<<RTS) | (1<<CTS);
	//DDRD &= ~(1<<CTS);
	//Requesting not to send data
	PORTD |= (1<<RTS);
	PORTD |= (1<<CTS);
	//PUll the CTS line up 
	//PORTD |= (1<<CTS);
} 

void setMachineMode()
{
	disableReceiveINT(); 
	sendCommand(SET, SYSTEM_PRINT_LEVEL, ZERO); 
	sendCommand(SET, SYSTEM_CMD_HEADER, ONE);
	sendCommand(SET, SYSTEM_CMD_PROMPT, ZERO);
	sendCommand(SET, SYSTEM_CMD_ECHO, OFF);
	enableReceiveINT(); 
}

void setHumanMode()
{
	disableReceiveINT(); 
	sendCommand(SET, SYSTEM_CMD_ECHO, ON);
	sendCommand(SET, SYSTEM_CMD_PROMPT, ONE);
	sendCommand(SET, SYSTEM_CMD_HEADER, ZERO);
	sendCommand(SET, SYSTEM_PRINT_LEVEL, ONE);
}

char* networkScan()
{
	updateRAMAddress(WIFI_RAW_ADDRESS);
	enableReceiveINT(); 
	sendCommand(NOPREFIX, SCAN, NOVAL);
	//_delay_ms(3000);
	PORTD &= ~(1<<RTS);
	receiveStatus(); 
	//_delay_ms(6000);
	//for(int i = 0; i < 100; i++)
	//{
		//printf("%c", networks[i]);
	//}
	//printf("\n");
	return ""; 
}

int networkConnect(char* SSID, char* password)
{
	//printf("Begin Network Connection.\n");
	sendCommand(SET, WLAN_SSID, SSID);
	//printf("Set Password\n");
	sendCommand(SET, WLAN_PWD, password);
	sendCommand(NOPREFIX, HTTP_GET, "www.wi-pro.us"); 
	if(errorCheck())
		return 0; 
	else
		return 1; 
}

int serverConnect(char* serverDNS, unsigned char* port)
{
	strcat(serverDNS, " ");
	strcat(serverDNS, port); 
	sendCommand(NOPREFIX, TCP_CLIENT, serverDNS);
	if(errorCheck())
		return 0; 
	else
		return 1; 
}

uint16_t networkQueryString(char* filepath)
{
	printf("Network Query String!\n");
	char data; 
	uint16_t i = 0;
	uint16_t j = 0;  
	uint8_t lineNum = 0; 
	RAMWrite(filepath, WIFI_QSTRING_ADDRESS + j, strlen(filepath));
	j+=strlen(filepath); 
	
	do 
	{
		data = RAMReadByte(WIFI_RAW_ADDRESS + i);
		//throw out a specified number of lines before recording 
		//printf("RAW: %c, 0x%02x Add: 0x%04x\n", data, data, WIFI_RAW_ADDRESS + i);
		if(lineNum <= 2)
		{
			if(data == '\n')
				lineNum++;
			i++;  
		}
		
		else
		{
			switch(data)
			{
				case ' ':
					//printf("Found a space!\n");
					RAMWriteByte('%', WIFI_QSTRING_ADDRESS + j);
					RAMWriteByte('2', WIFI_QSTRING_ADDRESS + j+1);
					RAMWriteByte('0', WIFI_QSTRING_ADDRESS + j+2);
					i++;
					j+=3;
					break;
				case '#':
					//printf("Found a #!\n");
					//Skip this character
					i++;
				break;
				case '\n':
					//printf("Found a new line!\n");
					i++;
				break;
				case '\r':
					//printf("Found a carriage return!\n");
					i++;
				break;
				default:
					RAMWriteByte(data, WIFI_QSTRING_ADDRESS + j);
					//printf("Query: %c, 0x%02x Add: 0x%04x\n", RAMReadByte(WIFI_QSTRING_ADDRESS + j), RAMReadByte(WIFI_QSTRING_ADDRESS + j), WIFI_QSTRING_ADDRESS +j);
					i++;
					j++;
				break;
			}	
		}

	} while (data != 0x00 && i < WIFI_QSTRING_SIZE - 2);
	
	//Overwrite the terminating byte with two new lines for the http request 
	RAMWrite(" HTTP/1.1\nhost: www.wi-pro.us\n\n", WIFI_QSTRING_ADDRESS + j-1, 31);
	j+=31; 
	
	return j; 
}
