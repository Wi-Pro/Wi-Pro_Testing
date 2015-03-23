/*
 * LED.h
 *
 * Created: 3/23/2015 5:40:44 PM
 *  Author: Brandon
 */ 


#ifndef LED_H_
#define LED_H_

#define LED_DDR DDRG
#define LED_REG PORTG 
#define RED_LED 2
#define YELLOW_LED 1
#define GREEN_LED 0
#define ON 1
#define OFF 0 

void LEDInit();
void ToggleRed(int val);
void ToggleYellow(int val);
void ToggleGreen(int val);

#endif /* LED_H_ */