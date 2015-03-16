/*
 * Wifi.c
 *
 * Created: 3/15/2015 1:03:20 AM
 *  Author: Brandon
 *  Description: Uses the WifiDriver.c functions to create a useful application layer that will allow easy setup and interfacing
 *  with the WiFi module 
 */ 

#include <avr/io.h>
#include <stdio.h>
#include <string.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "PrintDriver.h"
#include "WifiDriver.h"
#include "Wifi.h"

//connStatus wifiModule; 

void WifiInit()
{
	
} 

void setMachineMode()
{
	//disableReceiveINT(); 
	sendCommand(SET, SYSTEM_PRINT_LEVEL, ZERO); 
	sendCommand(SET, SYSTEM_CMD_HEADER, ONE);
	sendCommand(SET, SYSTEM_CMD_PROMPT, ZERO);
	sendCommand(SET, SYSTEM_CMD_ECHO, OFF);
}

void setHumanMode()
{
	sendCommand(SET, SYSTEM_CMD_ECHO, ON);
	sendCommand(SET, SYSTEM_CMD_PROMPT, ONE);
	sendCommand(SET, SYSTEM_CMD_HEADER, ZERO);
	sendCommand(SET, SYSTEM_PRINT_LEVEL, ONE);
}

char* networkScan()
{
	//enableReceiveINT();
	sendCommand(NOPREFIX, SCAN, NOVAL);
	char* networks = getReceiveBuffer(); 
	return networks; 
}

int networkConnect(char* SSID, char* password)
{
	sendCommand(SET, WLAN_SSID, SSID);
	sendCommand(SET, WLAN_PWD, password);
	enableReceiveINT();
	sendCommand(NOPREFIX, HTTP_GET, "www.wi-pro.us");
	return 1; 
}

int serverConnect()
{
	return 1; 
}