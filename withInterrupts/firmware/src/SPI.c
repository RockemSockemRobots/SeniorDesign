#include "SPI.h"

void spiInit()
{
	//Can't figure out how to pin select the SCK
	TRISDbits.TRISD3 = 0; //Output    
	RPD3R = 0b0101; //SDO1

	unsigned int word;
	int rData = 0;
	word = 0x1111; //

	/*
	unsigned int word_hi;
	unsigned int word_lo;
	word_lo = word & 0x00FF;
	word_hi = (word >> 8) & 0x00FF;
	*/

	//IEC0CLR = 0x03800000;// disable all interrupts //I don't think we want this
	SPI1CON = 0; // Stops and resets the SPI1.
    SPI1CON2 = 0;
    //SPI1CON2bits.AUDEN = 0;
	rData = SPI1BUF; //clears the receive buffer

	/* If using interrupts
	IFS0CLR = 0x03800000;// clear any existing event
	IPC5CLR = 0x1f000000;// clear the priority
	IPC5SET = 0x0d000000;// Set IPL=3, Subpriority 
	IEC0SET = 0x03800000;// Enable RX, TX and Error interrupts 
	*/

	SPI1BRG = 4;// use FPB/10 clock frequency (20MHz clock)
	SPI1STATCLR = 0x40;// clear the Overflow
	SPI1CON = 0x10008620;// MSSEN=1, SPI ON, 16 bit transfer, SMP=1, Master mode

	SPI1BUF = word; //test word
	//while()
}