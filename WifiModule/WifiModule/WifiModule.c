/*
 * WifiModule.c
 *
 * Created: 3/7/2015 5:09:19 PM
 *  Author: Brandon
 */ 


#include <avr/io.h>
#include <util/delay.h>
#include "PrintDriver.h"
#include "WifiDriver.h"

int main(void)
{

	uart_init();
	uart0_init(); 
	printf("Initializing Wi-Fi Driver...\n");
	//Set RTS as output
	//DDRD |= (1<<RTS);
	//Set CTS as input
	//DDRD &= ~(1<<CTS);
	//PORTD |= (1<<RTS);
	//Wait until Wi-Fi gives clear to send
	//while(!(PIND & (1<<CTS)));
	//_delay_ms(1000);
	uart_send("get wlan\r\n");
	
    while(1)
    {
	}
}