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
#include "Ethernet/Ethernet.h"
#include "Print/PrintDriver.h"
#include "RAM/RAMDriver.h"
#include "Wifi/Wifi.h"
#include "RAM/MemoryMap.h"

void sendAvailableNetworks()
{
	networkScan(); 
	//_delay_ms(10000);
	//Convert List of Networks to Query String
	networkQueryString(); 
	
}
