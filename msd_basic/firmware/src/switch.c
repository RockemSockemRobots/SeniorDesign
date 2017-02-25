#include "switch.h"

void initOnBoardSwitch(){
    TRISGbits.TRISG12 = 1;
    CNPUGbits.CNPUG12 = 1; //enable pull up on switch
    
    CNCONGbits.ON = 1; //enable change notifications for Port G
    CNENGbits.CNIEG12 = 1; //Enables CN for RG12
    IEC3bits.CNGIE = 1; //Enable Interrupts
    IFS3bits.CNGIF = 0; //Set flag to lowered
    /*Interrupt Priority and Subpriority for this interrupt vector is set within system_init.c*/
}