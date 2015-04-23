/*
 * Sound.c
 *
 * Created: 4/23/2015 3:46:49 AM
 *  Author: Adam Vogel
 */ 

//#define F_CPU 1000000UL
#include <avr/io.h>
//#include <util/delay.h>

int main(void)
{
	DDRD = 0xFF;
	int frequency = 73;
	int time = 1;
	int j;
	int i;
	
	
    while(1)
    {
		for (frequency = 73; frequency<139; frequency+=5)
		{
			time = 25000/frequency;//each count is half note
			for(j = 0; j < 342; j++)
			{
				PORTD = 0;
				for(i = 0; i < time; i++)
				{
					asm("nop");
				}
				PORTD = 0xFF;
				for(i = 0; i < time; i++)
				{
					asm("nop");
				}
			}
		}
    }
}