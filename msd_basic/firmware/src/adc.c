#include "adc.h"

void configureADCs(){
    IFS1bits.ADCIF = 0;
    IPC11bits.ADCIP = 7;
    IPC11bits.ADCIS = 0;
    IEC1bits.ADCIE = 1;
    
//    jumpTable[0] = &ADC0Handler; // Set up jump table
//    jumpTable[2] = &ADC1Handler;
//    jumpTable[4] = &ADC2Handler;
    
    ADCANCON = 0;
    TRISBbits.TRISB15 = 1;
    CNPUBbits.CNPUB15 = 0;
    ANSELBbits.ANSB15 = 1;
    /* Copying values per datasheet spec */
    ADC0CFG = DEVADC0;
    ADC1CFG = DEVADC1;
    ADC2CFG = DEVADC2;
    ADC3CFG = DEVADC3;
    ADC4CFG = DEVADC4;
    ADC7CFG = DEVADC7;
    
    /* Configure ADCCON1 */
    ADCCON1 = 0;
    CFGCONbits.IOANCPEN = 0;
    ADCCON1bits.SELRES = 3; //12-bit resolution
    ADCCON1bits.STRGSRC = 0;
    ADCCON1bits.STRGLVL = 0;
    
    /* Configure ADCCON2 */
    ADCCON2 = 0;
    //ADCCON2bits.EOSIEN = 1; //Interrupt when scan finished -> what does this do exactly?
    //ADCCON2bits.SAMC = 5; //ADC7 sampling time = 5 * TAD7 -> 500ns
    //ADCCON2bits.ADCDIV = 1; //2*T_Q = T_AD7 -> 100ns
    
    /* Initialize warm up time register */
    ADCANCON = 0;
    ADCANCONbits.WKUPCLKCNT = 5; // Wakeup exponent = 32 * TADx
    
    /* Clock setting */
    ADCCON3 = 0;
    ADCCON3bits.ADCSEL = 1; // T_CLK = 1/PBCLK3 (1/100M) -> 10ns
    ADCCON3bits.CONCLKDIV = (5-1); // T_Q = 5*T_CLK -> 50ns
    ADCCON3bits.VREFSEL = 0; // Select AVDD and AVSS as reference source
    
    
    /* Select ADC sample time and conversion clock */
//    ADC0TIMEbits.ADCDIV = 1; // ADC0 clock frequency is half of control clock = TAD0
//    ADC0TIMEbits.SAMC = 5; // ADC0 sampling time = 5 * TAD0
//    ADC0TIMEbits.SELRES = 3; // ADC0 resolution is 12 bits
//    ADC1TIMEbits.ADCDIV = 1; // ADC1 clock frequency is half of control clock = TAD1 -> 100ns
//    ADC1TIMEbits.SAMC = 555; // ADC1 sampling time = 555 * TAD1 -> 55.5us
//    ADC1TIMEbits.SELRES = 3; // ADC1 resolution is 12 bits
    ADC2TIMEbits.ADCDIV = 1; // ADC2 clock frequency is half of control clock = TAD2 -> 100ns
    ADC2TIMEbits.SAMC = 555; // ADC2 sampling time = 555 * TAD2 -> 55.5us
    ADC2TIMEbits.SELRES = 3; // ADC2 resolution is 12 bits
    ADC3TIMEbits.ADCDIV = 1; // ADC3 clock frequency is half of control clock = TAD3 -> 100ns
    ADC3TIMEbits.SAMC = 555; // ADC3 sampling time = 555 * TAD3 -> 55.5us
    ADC3TIMEbits.SELRES = 3; // ADC3 resolution is 12 bits
    ADC4TIMEbits.ADCDIV = 1; // ADC4 clock frequency is half of control clock = TAD4 -> 100ns
    ADC4TIMEbits.SAMC = 555; // ADC4 sampling time = 555 * TAD4 -> 55.5us
    ADC4TIMEbits.SELRES = 3; // ADC4 resolution is 12 bits
    
    /* Select analog input for ADC modules, no presync trigger, not sync sampling */
    //ADCTRGMODEbits.SH0ALT = 0; // ADC0 = AN0 NOT AVAILABLE! on this dev board
    //ADCTRGMODEbits.SH1ALT = 1; // ADC1 = AN46   
    ADCTRGMODEbits.SH2ALT = 0; // ADC2 = AN2
    ADCTRGMODEbits.SH3ALT = 0; // ADC3 = AN3
    ADCTRGMODEbits.SH4ALT = 0; // ADC4 = AN4
    //ADCTRGMODEbits.STRGEN1 = 1; //presync triggers
    ADCTRGMODEbits.STRGEN2 = 1;
    ADCTRGMODEbits.STRGEN3 = 1;
    //ADCTRGMODEbits.STRGEN4 = 1;
    
    /* Select ADC input mode */
    //ADCIMCON1bits.SIGN1 = 0; // unsigned data format
    //ADCIMCON1bits.DIFF1 = 0; // Single ended mode
    ADCIMCON1bits.SIGN2 = 0; // unsigned data format
    ADCIMCON1bits.DIFF2 = 0; // Single ended mode
    ADCIMCON1bits.SIGN3 = 0; // unsigned data format
    ADCIMCON1bits.DIFF3 = 0; // Single ended mode
    ADCIMCON1bits.SIGN4 = 0; // unsigned data format
    ADCIMCON1bits.DIFF4 = 0; // Single ended mode
    //ADCIMCON1bits.SIGN10 = 0; // unsigned data format
    //ADCIMCON1bits.DIFF10 = 0; // Single ended mode
    
    /* Configure ADCGIRQENx */
    ADCGIRQEN1 = 0;
    ADCGIRQEN2 = 0;
//    ADCGIRQEN1bits.AGIEN0 = 1; // Enable data ready interrupt for AN0
    //ADCGIRQEN1bits.AGIEN1 = 1; // Enable data ready interrupt for AN1
    ADCGIRQEN1bits.AGIEN2 = 1; // Enable data ready interrupt for AN2
    ADCGIRQEN1bits.AGIEN3 = 1; // Enable data ready interrupt for AN3
    //ADCGIRQEN1bits.AGIEN4 = 1; // Enable data ready interrupt for AN4
    
    /* Configure ADBASE */ //need to look into this
    //ADCBASE = (int)(&jumpTable[0]); // Initialize ADCBASE with starting address of jump table
    //ADCCON1bits.IRQVS = 0; // No left shift of address
    
    /* Configure ADCCSSx */
    ADCCSS1 = 0;
    ADCCSS2 = 0;
    
    /* Configure ADCCMPCONx */
    ADCCMPCON1 = 0; // No digital comparators are used. Setting the ADCCMPCONx
    ADCCMPCON2 = 0; // register to '0' ensures that the comparator is disabled.
    ADCCMPCON3 = 0; // Other registers are ?don't care?.
    ADCCMPCON4 = 0;
    ADCCMPCON5 = 0;
    ADCCMPCON6 = 0;
    
    /* Configure ADCFLTRx */
    ADCFLTR1 = 0; // No oversampling filters are used.
    ADCFLTR2 = 0;
    ADCFLTR3 = 0;
    ADCFLTR4 = 0;
    ADCFLTR5 = 0;
    ADCFLTR6 = 0;
    
    /* Set up the trigger sources */
//    ADCTRGSNSbits.LVL0 = 0; // Edge trigger
//    ADCTRGSNSbits.LVL1 = 0; // Edge trigger
    ADCTRGSNSbits.LVL2 = 0; // Edge trigger
    ADCTRGSNSbits.LVL3 = 0;
    ADCTRGSNSbits.LVL4 = 0;
    //ADCTRGSNSbits.LVL10 = 0;
    //ADCTRG1bits.TRGSRC0 = 0b00111; // Set AN0 to trigger from Timer5.
//    ADCTRG1bits.TRGSRC1 = 0b00111; // Set AN1 to trigger from Timer5.
    ADCTRG1bits.TRGSRC2 = 0b00111; // Set AN2 to trigger from Timer5.
    ADCTRG1bits.TRGSRC3 = 0b00111; // Set AN3 to trigger from Timer5.
    ADCTRG2bits.TRGSRC4 = 1; // Set AN4 to trigger from software
    //ADCTRG3bits.TRGSRC10 = 1; // Set AN10 to trigger in software.
    
    /* Early interrupt */
    ADCEIEN1 = 0; // No early interrupt
    ADCEIEN2 = 0;
    //ADCCON2bits.ADCEIOVR = 1; // Override early interrupt //do we need this line? -> what is this doing exactly?
    
//    /*Config ADC FIFO*/
//    ADCFSTAT = 0; // Clear all bits
//    ADCFSTATbits.ADC2EN = 1; // Select ADC2
//    ADCFSTATbits.ADC3EN = 1;
//    ADCFSTATbits.FIEN = 1;
//    ADCFSTATbits.FEN = 1; // Enable FIFO
    
    /* Turn the ADC on */
    ADCCON1bits.ON = 1;
    /* Wait for voltage reference to be stable */
    while(!ADCCON2bits.BGVRRDY); // Wait until the reference voltage is ready
    while(ADCCON2bits.REFFLT); // Wait if there is a fault with the reference voltage
    /* Enable clock to analog circuit */
//    ADCANCONbits.ANEN0 = 1; // Enable the clock to analog bias and digital control
//    ADCANCONbits.ANEN1 = 1; // Enable the clock to analog bias and digital control
    ADCANCONbits.ANEN2 = 1; // Enable the clock to analog bias and digital control
    ADCANCONbits.ANEN3 = 1; // Enable the clock to analog bias and digital control
    ADCANCONbits.ANEN4 = 1; // Enable the clock to analog bias and digital control
    //ADCANCONbits.ANEN7 = 1; // Enable the clock to analog bias and digital control
    /* Wait for ADC to be ready */
//    while(!ADCANCONbits.WKRDY0); // Wait until ADC0 is ready
//    while(!ADCANCONbits.WKRDY1); // Wait until ADC1 is ready
    while(!ADCANCONbits.WKRDY2); // Wait until ADC2 is ready
    while(!ADCANCONbits.WKRDY3); // Wait until ADC3 is ready
    while(!ADCANCONbits.WKRDY4); // Wait until ADC4 is ready
    //while(!ADCANCONbits.WKRDY7); // Wait until ADC7 is ready
    /* Enable the ADC module */
//    ADCCON3bits.DIGEN0 = 1; // Enable ADC0
//    ADCCON3bits.DIGEN1 = 1; // Enable ADC1
    ADCCON3bits.DIGEN2 = 1; // Enable ADC2
    ADCCON3bits.DIGEN3 = 1; // Enable ADC3
    ADCCON3bits.DIGEN4 = 1; // Enable ADC4
    //ADCCON3bits.DIGEN7 = 1; // Enable ADC7
}