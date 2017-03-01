#include "adc.h"

void configureADCs(){
    /* Configure ADCCON1 */
    ADCCON1 = 0; // No ADCCON1 features are enabled including: Stop-in-Idle, turbo,
                // CVD mode, Fractional mode and scan trigger source.
    
    /* Configure ADCCON2 */
    ADCCON2 = 0; // Since, we are using only the Class 1 inputs, no setting is
                // required for ADCDIV
    
    /* Initialize warm up time register */
    ADCANCON = 0;
    ADCANCONbits.WKUPCLKCNT = 5; // Wakeup exponent = 32 * TADx
    
    /* Clock setting */
    ADCCON3 = 0;
    ADCCON3bits.ADCSEL = 0; // Select input clock source
    ADCCON3bits.CONCLKDIV = 1; // Control clock frequency is half of input clock
    ADCCON3bits.VREFSEL = 0; // Select AVDD and AVSS as reference source
    
    /* Select ADC sample time and conversion clock */
    ADC0TIMEbits.ADCDIV = 1; // ADC0 clock frequency is half of control clock = TAD0
    ADC0TIMEbits.SAMC = 5; // ADC0 sampling time = 5 * TAD0
    ADC0TIMEbits.SELRES = 3; // ADC0 resolution is 12 bits
    ADC1TIMEbits.ADCDIV = 1; // ADC1 clock frequency is half of control clock = TAD1
    ADC1TIMEbits.SAMC = 5; // ADC1 sampling time = 5 * TAD1
    ADC1TIMEbits.SELRES = 3; // ADC1 resolution is 12 bits
    ADC2TIMEbits.ADCDIV = 1; // ADC2 clock frequency is half of control clock = TAD2
    ADC2TIMEbits.SAMC = 5; // ADC2 sampling time = 5 * TAD2
    ADC2TIMEbits.SELRES = 3; // ADC2 resolution is 12 bits
    
    /* Select analog input for ADC modules, no presync trigger, not sync sampling */
    //ADCTRGMODEbits.SH0ALT = 0; // ADC0 = AN0 NOT AVAILABLE! on this dev board
    ADCTRGMODEbits.SH1ALT = 1; // ADC1 = AN46
    ADCTRGMODEbits.SH2ALT = 0; // ADC2 = AN2
    ADCTRGMODEbits.SH3ALT = 0; // ADC3 = AN3
    ADCTRGMODEbits.SH4ALT = 0; // ADC4 = AN4
    
    
    /* Select ADC input mode */
    ADCIMCON1bits.SIGN1 = 0; // unsigned data format
    ADCIMCON1bits.DIFF1 = 0; // Single ended mode
    ADCIMCON1bits.SIGN2 = 0; // unsigned data format
    ADCIMCON1bits.DIFF2 = 0; // Single ended mode
    ADCIMCON1bits.SIGN3 = 0; // unsigned data format
    ADCIMCON1bits.DIFF3 = 0; // Single ended mode
    ADCIMCON1bits.SIGN4 = 0; // unsigned data format
    ADCIMCON1bits.DIFF4 = 0; // Single ended mode
    
    /* Configure ADCGIRQENx */
    ADCGIRQEN1 = 0;
    ADCGIRQEN2 = 0;
//    ADCGIRQEN1bits.AGIEN0 = 1; // Enable data ready interrupt for AN0
//    ADCGIRQEN1bits.AGIEN1 = 1; // Enable data ready interrupt for AN1
//    ADCGIRQEN1bits.AGIEN2 = 1; // Enable data ready interrupt for AN2
    
    /* Configure ADBASE */
    //ADCBASE = (int)(&jumpTable[0]); // Initialize ADCBASE with starting address of jump table
    //ADCCON1bits.IRQVS = 0; // No left shift of address
    
    /* Configure ADCCSSx */
    ADCCSS1 = 0; // No scanning is used
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
    ADCTRGSNSbits.LVL0 = 0; // Edge trigger
    ADCTRGSNSbits.LVL1 = 0; // Edge trigger
    ADCTRGSNSbits.LVL2 = 0; // Edge trigger
    ADCTRG1bits.TRGSRC0 = 1; // Set AN0 to trigger from software.
    ADCTRG1bits.TRGSRC1 = 1; // Set AN1 to trigger from software.
    ADCTRG1bits.TRGSRC2 = 1; // Set AN2 to trigger from software.
    
    /* Early interrupt */
    ADCEIEN1 = 0; // No early interrupt
    ADCEIEN2 = 0;
    ADCCON2bits.ADCEIOVR = 1; // Override early interrupt
    
    /* Turn the ADC on */
    ADCCON1bits.ON = 1;
    /* Wait for voltage reference to be stable */
    while(!ADCCON2bits.BGVRRDY); // Wait until the reference voltage is ready
    while(ADCCON2bits.REFFLT); // Wait if there is a fault with the reference voltage
    /* Enable clock to analog circuit */
    ADCANCONbits.ANEN0 = 1; // Enable the clock to analog bias and digital control
    ADCANCONbits.ANEN1 = 1; // Enable the clock to analog bias and digital control
    ADCANCONbits.ANEN2 = 1; // Enable the clock to analog bias and digital control
    /* Wait for ADC to be ready */
    while(!ADCANCONbits.WKRDY0); // Wait until ADC0 is ready
    while(!ADCANCONbits.WKRDY1); // Wait until ADC1 is ready
    while(!ADCANCONbits.WKRDY2); // Wait until ADC2 is ready
    /* Enable the ADC module */
    ADCCON3bits.DIGEN0 = 1; // Enable ADC0
    ADCCON3bits.DIGEN1 = 1; // Enable ADC1
    ADCCON3bits.DIGEN2 = 1; // Enable ADC2
    /* Trigger a conversion */
    ADCCON3bits.GSWTRG = 1;
}