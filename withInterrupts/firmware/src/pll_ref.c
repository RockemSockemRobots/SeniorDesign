#include "pll_ref.h"

void init1MHzPLL_REF(){
    //RPF5 -> RF5
    TRISFbits.TRISF5 = 0;
    RPF5R = 0b1111; //RF5 outputs REFCLKO1
    REFO1CON = 0;
    REFO1CONbits.ROSEL = 0b0000; //uses system clk 200MHz
    REFO1CONbits.RODIV = 100; //Fig. 8-1 divider is 2*N where N is RODIV
    REFO1TRIMbits.ROTRIM = 0;
    /*200MHz -> div by 2*100 = 1MHz*/
    //REFO1CONbits.OE = 1;
    REFO1CONbits.ON = 1;
}

void enablePLL_REF(){
    REFO1CONbits.OE = 1;
    //REFO1CONbits.ON = 1;
}

void disablePPL_REF(){
    //REFO1CONbits.ON = 0;
    REFO1CONbits.OE = 0;
}