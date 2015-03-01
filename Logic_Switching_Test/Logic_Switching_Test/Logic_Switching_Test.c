/*
 * Logic_Switching_Test.c
 *
 * Created: 3/1/2015 3:43:12 PM
 *  Author: Adam Vogel
 */ 


#include <avr/io.h>

int main(void)
{
	PORTA = 0xFF;
	PORTD |= (1<<3 | 1<<4 | 1<<5);
	
	PORTA = 0xFF;
	
	
    while(1)
    {
        //TODO:: Please write your application code 
    }
}