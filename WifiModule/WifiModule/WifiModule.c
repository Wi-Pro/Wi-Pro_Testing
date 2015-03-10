/*
 * WifiModule.c
 *
 * Created: 3/7/2015 5:09:19 PM
 *  Author: Brandon
 */ 


#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include "PrintDriver.h"
#include "WifiDriver.h"

int main(void)
{
	//cli(); 
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
	//uart_send("This is a really super long ridiculously useless test string\0");
	unsigned char data;
	unsigned char counter = 0; 
    while(counter <= 9)
    {
		uart_send(counter | 0x30);
		printf("Polling..\n");
		//data = uart_receiveChar();
		while (!(UCSR1A & (1<<RXC1)));
		data = UDR1; 
		printf("%c\n", data);
		counter++; 
	}
	printf("Done!\n");
}