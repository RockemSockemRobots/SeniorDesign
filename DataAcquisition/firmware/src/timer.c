#include "timer.h"

void initTimer3(){ //5msec timer
    T3CONbits.TON = 0;
    TMR3 = 0x0000;
    PR3 = 62499;
    T3CONbits.TCKPS = 0b011; //divide 100Mhz -> 12.5MHz
    IFS0bits.T3IF = 0;
    IEC0bits.T3IE = 1; //enable interrupt
    /*Interrupt Priority and Subpriority for this interrupt vector is set within system_init.c*/
    
    TRISEbits.TRISE1 = 0; //for timer test
    ODCEbits.ODCE1 = 0;
    LATEbits.LATE1 = 0;
}

void initTimer4(){ //msec
    T4CONbits.TON = 0;
    TMR4 = 0x0000;
    PR4 = 49999;
    T4CONbits.TCKPS = 1; //100 MHz -> 50 MHz
    IFS0bits.T4IF = 0;
    IEC0bits.T4IE = 1; //enable interrupt
    /*Interrupt Priorities and Subpriorities for this interrupt vector are set within system_init.c*/
}

void initTimer5(){ //ADC trigger timer (sample timer): 55.55us
    T5CONbits.TON = 0;
    TMR5 = 0x0000;
    PR5 = 5554; //55.55us
    T5CONbits.TCKPS = 0; //100 MHz
    IFS0bits.T5IF = 0;
    IEC0bits.T5IE = 0;
}

void initTimer6(){
    T6CONbits.TON = 0;
    TMR6 = 0x0000;
    PR6 = 246; //2.47us
    T6CONbits.TCKPS = 0; //100 MHz
    IFS0bits.T6IF = 0;
    IEC0bits.T6IE = 0;
}

void initTimer7(){ //5msec timer
    T7CONbits.TON = 0;
    TMR7 = 0x0000;
    PR7 = 62499;
    T7CONbits.TCKPS = 0b011; //divide 100Mhz -> 12.5MHz
    IFS1bits.T7IF = 0;
    IEC1bits.T7IE = 0; //enable interrupt
    /*Interrupt Priority and Subpriority for this interrupt vector is set within system_init.c*/
}

void timer3ON(){
    T3CONbits.TON = 1;
}
void timer3OFF(){
    T3CONbits.TON = 0;
}
void timer4ON(){
    T4CONbits.TON = 1;
}
void timer4OFF(){
    T4CONbits.TON = 0;
}
void timer5ON(){
    T5CONbits.TON = 1;
}
void timer5OFF(){
    T5CONbits.TON = 0;
}
void timer6ON(){
    T6CONbits.TON = 1;
}
void timer6OFF(){
    T6CONbits.TON = 0;
}
void timer7ON(){
    T7CONbits.TON = 1;
}
void timer7OFF(){
    T7CONbits.TON = 0;
}

void delay5ms(){
    T7CONbits.TON = 1;
    while(IFS1bits.T7IF == 0){}
    T7CONbits.TON = 0;
    IFS1bits.T7IF = 0;
}

void delay2_47us(){
    T6CONbits.TON = 1;
    while(IFS0bits.T6IF == 0){}
    T6CONbits.TON = 0;
    IFS0bits.T6IF = 0;
}

void delay32_11us(){ //2.47us*13 = 32.11us
    int i = 0;
    for(i = 0; i < 13; i++){
        delay2_47us();
    }
}


void testTimer3(){
    LATESET = 0x0002;
    delay5ms();
    LATGINV = 0x0002;
    delay5ms();
}
