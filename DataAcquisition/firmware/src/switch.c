#include "switch.h"

void initOnBoardSwitch(){
    TRISGbits.TRISG12 = 1;
    CNPUGbits.CNPUG12 = 1; //enable pull up on switch
    
    CNCONGbits.ON = 1; //enable change notifications for Port G
    CNENGbits.CNIEG12 = 1; //Enables CN for RG12
    IFS3bits.CNGIF = 0; //Set flag to lowered
    IEC3bits.CNGIE = 1; //Enable Interrupts
    /*Interrupt Priority and Subpriority for this interrupt vector is set within system_init.c*/
}

void initIRSwitch(){
    TRISAbits.TRISA4 = 1;
    CNPUAbits.CNPUA4 = 1;
    
    CNCONAbits.ON = 1;
    CNENAbits.CNIEA4 = 1; //Enables CN for RA4
    IFS3bits.CNAIF = 0; //Set flag to lowered
    IEC3bits.CNAIE = 1; //Enable Interrupts
    /*Interrupt Priority and Subpriority for this interrupt vector is set within system_init.c*/
}

void initOffBoardSwitch(){
    TRISCbits.TRISC13 = 1;
    CNPUCbits.CNPUC13 = 1;
    
    CNCONCbits.ON = 1;
    CNENCbits.CNIEC13 = 1; //Enables CN for RC13
    IFS3bits.CNCIF = 0; //Set flag to lowered
    IEC3bits.CNCIE = 1; //Enable Interrupts
    /*Interrupt Priority and Subpriority for this interrupt vector is set within system_init.c*/
}