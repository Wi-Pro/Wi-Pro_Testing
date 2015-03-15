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

void WifiInit()
{
	
}

void setMachineMode()
{
	disableReceiveINT(); 
	sendCommand(SET, SYSTEM_PRINT_LEVEL, ZERO); 
	sendCommand(GET, SYSTEM_CMD_PROMPT, NOVAL);
	sendCommand(GET, "wlan", NOVAL);
	//sendCommand(GET, "system.cmd.prompt_enabled 1", NOVAL);
	//sendCommand(SET, "system.print_level", ZERO);
	//while(!waitForReceive());
	//sendCommand(SET, SYSTEM_CMD_HEADER, ONE);
	//while(waitForReceive());
	//sendCommand(SET, "system.cmd.prompt_enabled", ZERO);
	//while(waitForReceive());
	//sendCommand(SET, SYSTEM_CMD_ECHO, OFF);
	//while(waitForReceive());
}

void setHumanMode()
{
	sendCommand(SET, SYSTEM_CMD_ECHO, ON);
	sendCommand(SET, SYSTEM_CMD_PROMPT, ONE);
	sendCommand(SET, SYSTEM_CMD_HEADER, ZERO);
	sendCommand(SET, SYSTEM_PRINT_LEVEL, ONE);
}