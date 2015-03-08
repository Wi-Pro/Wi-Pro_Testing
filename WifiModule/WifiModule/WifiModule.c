/*
 * WifiModule.c
 *
 * Created: 3/7/2015 5:09:19 PM
 *  Author: Brandon
 */ 


#include <avr/io.h>
#include "PrintDriver.h"

int main(void)
{
	//uart0_init();
	//printf("This is a test\n\n");
	//unsigned int testNum = 30;
	//printf("%d", testNum);
	uart1_init();
	uart0_init(); 
	PORTD = 0xFF; 
	unsigned char testString[] = "Test";
	uart_send("help");
    while(1)
    {
		//uart_send("help");
		//printf("TestBITCH");
	}
}