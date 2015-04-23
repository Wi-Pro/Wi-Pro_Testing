/*
 * blinkATmega324PA.c
 *
 * Created: 4/23/2015 3:30:40 AM
 *  Author: Adam Vogel
 */ 


#define F_CPU 1000000UL
#include <avr/io.h>
#include <util/delay.h>

void initialization(void);
void LED_on(void);
void LED_off(void);

int main(void)
{
	//initialization();
	DDRD |= (1<<PD6);//make PD6 an output
	while(1)
	{
		//LED_on();
		PORTD |= (1<<PD6);
		_delay_ms(1000);//delay for 1 second
		//LED_off();
		PORTD &= ~(1<<PD6);
		_delay_ms(1000);
	}
}

void initialization(void){
	DDRD |= (1<<PD6);//make PD6 an output
}
void LED_on(void){
	PORTD |= (1<<PD6);
}
void LED_off(void){
	PORTD &= ~(1<<PD6);
}