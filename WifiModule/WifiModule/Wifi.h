/*
 * Wifi.h
 *
 * Created: 3/15/2015 1:03:33 AM
 *  Author: Brandon
 */ 


#ifndef WIFI_H_
#define WIFI_H_

//Initialization Commands 

//commands 
#define SCAN "scan"

//variables
#define SYSTEM_PRINT_LEVEL "system.print_level"
#define SYSTEM_CMD_HEADER "system.cmd.header_enabled"
#define SYSTEM_CMD_PROMPT "system.cmd.prompt_enabled"
#define SYSTEM_CMD_ECHO "system.cmd.echo"

//values
#define ONE "1" 
#define ZERO "0" 
#define ON "on"
#define OFF "off"

void WifiInit(); 
void setMachineMode(); 
void setHumanMode(); 

#endif /* WIFI_H_ */