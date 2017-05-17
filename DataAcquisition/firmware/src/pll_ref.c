/*******************************************************************************
	Viasat Radar Based Vehicle Location and Navagation System
	University of Arizona ENGR498 Team 16060
	
	Data Acquisition Firmware
	
	Comment:
		Team created file
		c code to initialize, enable, and disable PLL_REF to radar module
		divides 24MHz crystal oscillator (POSC) down to 1MHz

********************************************************************************/

#include "pll_ref.h"

void init1MHzPLL_REF(){
    //PLL_LOCK
    TRISEbits.TRISE0 = 1; //input
    CNPUEbits.CNPUE0 = 0; //no pullup
    
    //RPF5 -> RF5 -> PLL_REF
    TRISFbits.TRISF5 = 0; //output
    RPF5R = 0b1111; //RF5 outputs REFCLKO1
    REFO1CON = 0;
    //REFO1CONbits.ROSEL = 0b0000; //uses system clk 200MHz
    //REFO1CONbits.RODIV = 100; //Fig. 8-1 divider is 2*N where N is RODIV
    REFO1CONbits.ROSEL = 0b0010; //uses Posc 24MHz
    REFO1CONbits.RODIV = 12; //Fig. 8-1 divider is 2*N where N is RODIV
    REFO1TRIMbits.ROTRIM = 0;
    /*200MHz -> div by 2*100 = 1MHz*/
    //REFO1CONbits.OE = 1;
    REFO1CONbits.ON = 1;
}

void enablePLL_REF(){
    REFO1CONbits.OE = 1;
    //REFO1CONbits.ON = 1;
}

void disablePLL_REF(){
    //REFO1CONbits.ON = 0;
    REFO1CONbits.OE = 0;
}