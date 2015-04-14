/*
 * blink.c
 *
 * Created: 4/14/2015 12:22:41 AM
 *  Author: Kevin
 */ 

#define F_CPU 1000000UL
#include <avr/io.h>
#include <util/delay.h>

void initialization(void);
void LED_on(void);
void LED_off(void);

int main(void)
{
	initialization();
    while(1)
    {
		LED_on();
        _delay_ms(1000);//delay for 1 second
		LED_off();
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