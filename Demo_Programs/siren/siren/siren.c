/*
 * siren.c
 *
 * Created: 4/14/2015 1:02:30 AM
 *  Author: Kevin
 */ 

#define F_CPU 1000000UL
//note to frequency table
#define D2 73
#define Ds2 78
#define E2 82
#define F2 87
#define Fs2 92
#define G2 98
#define Gs2 104
#define A2 110
#define As2 117
#define B2 123
#define C3 131
#define Cs3 139
#define D3 147
#define Ds3 156
#define E3 165
#define F3 175
#define Fs3 185
#define G3 196
#define Gs3 208
#define A3 220
#define As3 233
#define B3 247
#define C4 262
#define Cs4 277
#define D4 294
#define Ds4 311
#define E4 330
#define F4 349
#define Fs4 370
#define G4 392
#define Gs4 415
#define A4 440
#define As4 466
#define B4 494
#define C5 523
#define Cs5 554
#define D5 587
#define Ds5 622
#define E5 659
#define F5 698
#define Fs5 740
#define G5 784
#define Gs5 831
#define A5 880
#define As5 932
#define B5 988
#define C6 1046
#define Cs6 1109
#define D6 1175
#define Ds6 1245
#define E6 1319
#define F6 1397
#define Fs6 1480
#define G6 1568
#define Gs6 1661
#define A6 1760
#define As6 1865
#define B6 1976
#define C7 2093
#include <avr/io.h>
#include <util/delay.h>

void initialization(void);
void note(int frequency, int seconds);

/*
C4 = 261.63
C#4 = 277.18
D4 = 293.66
D#4 = 311.13
E4 =  329.63
F4 = 349.23
F#4 = 369.99
G4 = 392.00
G#4 = 415.30
A4 = 440.00
A#4 = 466.16
B4 = 493.88

Ode to Joy = {
E4,E4,F4,G4,G4,F4,E4,D4,C4,C4,D4,E4,E4,
D4,D4,E4,E4,F4,G4,G4,F4,E4,D4,C4,C4,D4,E4,D4,C4,
C4,D4,D4,E4,C4,D4,E4,F4,E4,C4,D4,E4,F4,E4,D4,C4,
D4,G3,E4,E4,F4,G4,G4,F4,E4,D4,C4,C4,D4,E4,D4,C4,C4};
*/

int main(void)
{
	initialization();
    while(1)
    {
		//E4,E4,F4,G4,G4,F4,E4,D4,C4,C4,D4,E4,E4
        note(E4, 1);
		note(E4, 1);
		note(F4, 1);
		note(G4, 1);
		note(G4, 1);
		note(F4, 1);
		note(E4, 1);
		note(D4, 1);
		note(C4, 1);
		note(C4, 1);
		note(D4, 1);
		note(E4, 1);
		note(E4, 1);
		//D4,D4,E4,E4,F4,G4,G4,F4,E4,D4,C4,C4,D4,E4,D4,C4
		note(D4, 1);
		note(D4, 1);
		note(E4, 1);
		note(E4, 1);
		note(F4, 1);
		note(G4, 1);
		note(G4, 1);
		note(F4, 1);
		note(E4, 1);
		note(D4, 1);
		note(C4, 1);
		note(C4, 1);
		note(D4, 1);
		note(E4, 1);
		note(D4, 1);
		note(C4, 1);
		//C4,D4,D4,E4,C4,D4,E4,F4,E4,C4,D4,E4,F4,E4,D4,C4
		note(C4, 1);
		note(D4, 1);
		note(D4, 1);
		note(E4, 1);
		note(C4, 1);
		note(D4, 1);
		note(E4, 1);
		note(F4, 1);
		note(E4, 1);
		note(C4, 1);
		note(D4, 1);
		note(E4, 1);
		note(F4, 1);
		note(E4, 1);
		note(D4, 1);
		note(C4, 1);
		//D4,G3,E4,E4,F4,G4,G4,F4,E4,D4,C4,C4,D4,E4,D4,C4,C4
		note(D4, 1);
		note(G3, 1);
		note(E4, 1);
		note(E4, 1);
		note(F4, 1);
		note(G4, 1);
		note(G4, 1);
		note(F4, 1);
		note(E4, 1);
		note(D4, 1);
		note(C4, 1);
		note(C4, 1);
		note(D4, 1);
		note(E4, 1);
		note(D4, 1);
		note(C4, 1);
		note(C4, 1);
    }
}

void initialization(void){
	DDRD |= (1<<PD6);//make PD6 an output
}

void note(int frequency, int seconds){
	int i, j;
	int cycles;
	DDRD |= (1<<PD5);//makes PD5 an output
	cycles = (seconds*100000)/frequency; //calculates required cycles
	for(j = 0; j < cycles; j++){
		PORTB |= (1 << PB0);
		for(i = j; i > 0; i--){
			_delay_us(1);
		}
		PORTB &= ~(PORTB << PB0);
		for(i = j; i > 0; i--){
			_delay_us(1);
		}
	}
}
