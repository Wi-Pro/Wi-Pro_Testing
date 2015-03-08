/*
 * VoltageControlDriver.c
 *
 * Created: 3/1/2015 4:26:06 PM
 * Author: Brandon
 * Description: Allows control of the Vpp and Vcc voltage regulators for programming the targeted microcontroller. 
 * A typical use for this library would simply involve calling the setVcc() or setVpp() functions and passing the correct
 * voltage level, as defined in the header file 
 * Example: Set Vcc Regulator to 3.3V		setVcc(VCC_3_6V); 
 */ 
#include <avr/io.h>
#include <stdio.h>
#include "VoltageControlDriver.h"

//Sets output of Vpp Voltage Regulator to 0V
void VppClear()
{
	VCNTRL_PORT &= ~((1<<VPP_9V) | (1<<VPP_12V) | (1<VPP_13V));
}

void voltageControlInit()
{
	VCNTRL_DDR = 0xFF;
	VCNTRL_PORT = 0x00; 
}

void enableVppRegulator()
{
	//Ensure all voltage levels are disabled before enabling 
	VppClear(); 
	VCNTRL_PORT |= (1<<VPPENABLE); 
}

void disableVppRegulator()
{
	VCNTRL_PORT &= ~((1<<VPP_9V) | (1<<VPP_12V) | (1<VPP_13V) | (1<<VPPENABLE));
}

//Sets output of Vcc Voltage Regulator to 0V
void VccClear()
{
	VCNTRL_PORT &= ~((1<<VCC_3_6V) | (1<<VCC_5_3V) | (1<<VCC_6_8V));
}

void enableVccReglator() 
{
	VccClear(); 
	VCNTRL_PORT |= (1<<VCCENABLE);
}

void disbaleVccReglator()
{
	VCNTRL_PORT &= ~((1<<VCC_3_6V) | (1<<VCC_5_3V) | (1<<VCC_6_8V) | (1<<VCCENABLE));
}

uint8_t setVcc(uint8_t voltageLevel)
{
	//prevents accidental triggering of the wrong regulator 
	if(voltageLevel != (VCC_3_6V || VCC_5_3V || VCC_6_8V))
		return 0; 
	else
	{
		enableVccReglator();
		VCNTRL_PORT |= (1<<voltageLevel);
		return 1; 
	}
}

uint8_t setVpp(uint8_t voltageLevel)
{
	//prevents accidental triggering of the wrong regulator 
	if(voltageLevel != (VPP_9V || VPP_12V || VPP_13V))
		return 0; 
	else
	{
		enableVppRegulator(); 
		VCNTRL_PORT |= (1<<voltageLevel);
		return 1; 
	}
}

