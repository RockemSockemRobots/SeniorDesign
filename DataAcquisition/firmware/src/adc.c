/*******************************************************************************
	Viasat Radar Based Vehicle Location and Navagation System
	University of Arizona ENGR498 Team 16060
	
	Data Acquisition Firmware
	
	Comment:
		Team created c-code to configure dedicated ADCs
		Based off code in PIC32MZEF Family Reference Manual ADC Section
		Currently has a bug where ADC doesn't capture data correctly sometimes
			(Might have something to do with ADC warm-up)
		
		File also has function to sample VTUNE

********************************************************************************/
#include "adc.h"

void configureADCs(){
    IFS1bits.ADCIF = 0; //clear general adc interrupt
    IPC11bits.ADCIP = 7; //set int priority level 7
    IPC11bits.ADCIS = 0; //subpriority level 0
    IEC1bits.ADCIE = 1; //enable interrupt
    
    ADCANCON = 0; //clear adc analog warm-up reg
	
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
    ADCCON1bits.AICPMPEN = 0;
    ADCCON1bits.SELRES = 3; //12-bit resolution
    ADCCON1bits.STRGSRC = 0;
    ADCCON1bits.STRGLVL = 0;
    
    /* Configure ADCCON2 */
    ADCCON2 = 0;
    
    /* Initialize warm up time register */
    ADCANCON = 0;
    ADCANCONbits.WKUPCLKCNT = 5; // Wakeup exponent = 32 * TADx
    
    /* Clock setting */
    ADCCON3 = 0;
    ADCCON3bits.ADCSEL = 1; // T_CLK = 1/PBCLK3 (1/100M) -> 10ns
    ADCCON3bits.CONCLKDIV = (5-1); // T_Q = 5*T_CLK -> 50ns
    ADCCON3bits.VREFSEL = 0; // Select AVDD and AVSS as reference source
    
    
    /* Select ADC sample time and conversion clock */
    ADC2TIMEbits.ADCDIV = 1; // ADC2 clock frequency is half of control clock = TAD2 -> 100ns
    ADC2TIMEbits.SAMC = 555; // ADC2 sampling time = 555 * TAD2 -> 55.5us
    ADC2TIMEbits.SELRES = 3; // ADC2 resolution is 12 bits
    ADC3TIMEbits.ADCDIV = 2; // ADC3 clock frequency is 1/4 of control clock = TAD3 -> 200ns 
    ADC3TIMEbits.SAMC = 277; // ADC3 sampling time = 277 * TAD3 -> 55.4us
    ADC3TIMEbits.SELRES = 3; // ADC3 resolution is 12 bits
    ADC4TIMEbits.ADCDIV = 1; // ADC4 clock frequency is 1/2 of control clock = TAD4 -> 100ns
    ADC4TIMEbits.SAMC = 5; // ADC4 sampling time = 555 * TAD4 -> 55.5us
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
    ADCIMCON1bits.SIGN2 = 0; // unsigned data format
    ADCIMCON1bits.DIFF2 = 0; // Single ended mode
    ADCIMCON1bits.SIGN3 = 0; // unsigned data format
    ADCIMCON1bits.DIFF3 = 0; // Single ended mode
    ADCIMCON1bits.SIGN4 = 0; // unsigned data format
    ADCIMCON1bits.DIFF4 = 0; // Single ended mode
    
    /* Configure ADCGIRQENx */
    ADCGIRQEN1 = 0;
    ADCGIRQEN2 = 0;
    ADCGIRQEN1bits.AGIEN2 = 1; // Enable data ready interrupt for AN2
    ADCGIRQEN1bits.AGIEN3 = 1; // Enable data ready interrupt for AN3
    //ADCGIRQEN1bits.AGIEN4 = 1; // Enable data ready interrupt for AN4
    
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
    ADCTRGSNSbits.LVL2 = 0; // Edge trigger
    ADCTRGSNSbits.LVL3 = 0;
    ADCTRGSNSbits.LVL4 = 0;
    ADCTRG1bits.TRGSRC2 = 0b00111; // Set AN2 to trigger from Timer5.
    ADCTRG1bits.TRGSRC3 = 0b00111; // Set AN3 to trigger from Timer5.
    ADCTRG2bits.TRGSRC4 = 1; // Set AN4 to trigger from software
    
    /* Early interrupt */
    ADCEIEN1 = 0; // No early interrupt
    ADCEIEN2 = 0;
    
    /*Config ADC FIFO*/
    ADCFSTAT = 0; // Clear all bits
    ADCFSTATbits.ADC2EN = 1; // Select ADC2
    ADCFSTATbits.ADC3EN = 1;
    //ADCFSTATbits.ADC4EN = 1;
    IFS1bits.ADCFIFOIF = 0;
    IPC11bits.ADCFIFOIP = 7;
    IPC11bits.ADCFIFOIS = 0;
    ADCFSTATbits.FIEN = 0;
    IEC1bits.ADCFIFOIE = 0;
    ADCFSTATbits.FEN = 0; // Enable FIFO (FIFO is disabled)
    
    /* Turn the ADC on */
    ADCCON1bits.ON = 1;
    
    /* Wait for voltage reference to be stable */
    while(!ADCCON2bits.BGVRRDY); // Wait until the reference voltage is ready
    while(ADCCON2bits.REFFLT); // Wait if there is a fault with the reference voltage
    
    /* Enable clock to analog circuit */
    ADCANCONbits.ANEN2 = 1; // Enable the clock to analog bias and digital control
    while(!ADCANCONbits.WKRDY2); // Wait until ADC2 is ready
    
    ADCANCONbits.ANEN3 = 1; // Enable the clock to analog bias and digital control
    while(!ADCANCONbits.WKRDY3); // Wait until ADC3 is ready
    
    ADCANCONbits.ANEN4 = 1; // Enable the clock to analog bias and digital control
    while(!ADCANCONbits.WKRDY4); // Wait until ADC4 is ready
    
    /* Enable the ADC module */
    ADCCON3bits.DIGEN2 = 1; // Enable ADC2
    ADCCON3bits.DIGEN3 = 1; // Enable ADC3
    ADCCON3bits.DIGEN4 = 1; // Enable ADC4
}

unsigned int sampleVTUNE(){
    unsigned int result;
    ADCCON3bits.GSWTRG = 1;
    while(ADCDSTAT1bits.ARDY4 == 0){}
    result = ADCDATA4;
    return result;
}