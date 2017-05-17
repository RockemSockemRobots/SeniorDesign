/*******************************************************************************
	Viasat Radar Based Vehicle Location and Navagation System
	University of Arizona ENGR498 Team 16060
	
	Data Acquisition Firmware
	
	Comment:
		team created file
		holds radar functionality code based off of Dave Saunders's supplied example code

********************************************************************************/
#include "radar.h"

const unsigned int spi_reset = 0x70FF;
// Global PLL words for 1MHz ref, R=8, 6 calibration frequencies
// PLL words for 24.150, 24.155, and 24.160 GHz (Gives Fc = 24.150 GHz)
const unsigned int pll_word_1[3] = {0x0D38, 0x0AB8, 0x0838};  // Acount = 20, 10 , and 0, Rcount = 56
const unsigned int pll_word_2 = 0x1A1B;              // Amsb = 1, Bcount = 539
const unsigned int pll_enable = 0x0800;                 // PLL Enable bit
const unsigned int vco_word_1A = 0xC000;         // FT = 16384
const unsigned int vco_word_1X = 0x8000;          // FT = 0
const unsigned int vco_word_2 = 0x2000;             // Vtune Gain = 1.2, Vtune Offset = 0, CT = 0
const unsigned int vco_word_2X = 0x2C00;          // Vtune Gain = 20, Vtune Offset = 1.5, CT = 0
const unsigned int vco_word_2A = 0x203F;          // Vtune Gain = 1.2, Vtune Offset = 0, CT = 63
const unsigned int vco_word_2B = 0x2040;          // Vtune Gain = 1.2, Vtune Offset = 0, CT = 64
const unsigned int vco_word_2C = 0x2400;          // Vtune Gain = 1.2, Vtune Offset = 1.5, CT = 0
unsigned int txrx_cntrl = 0x3FFC;			// Control word for adjusting Tx Gain and Rx Gain
const unsigned int tx_enable = 0x0800;   	// Tx Enable bit
volatile unsigned int BCT;
volatile unsigned int BFT[3];

unsigned char initRADAR(){
    int i = 0;
    unsigned char FreqCalFlag;
    //BCT = 0x0040; //why not this?
    BCT = 0x004D; // Best coarse tune default value (this would be allocated in function statement and passed into function)
    
    
    send_spi_word(spi_reset);
    //delay5ms();
    //send_spi_word(spi_reset);
    
    
    // Delay to let transient settle, dominated by SC3001.2 and BPF network with 99% settling in ~ 500msec
    for(i = 0; i < 100; i++){
        delay5ms();
    }
    
    // Setup SC3001.2 to get temperature stabilized after power-up
	send_spi_word(pll_word_1[1] & ~pll_enable);					// PLL Disable, A = 10, R = 3
	send_spi_word(pll_word_2);									// Amsb = 1, B = 539
	send_spi_word(vco_word_1A);									// FT = 16384
	send_spi_word(vco_word_2 | BCT);							// Vtune_Gain=1.2V/V, Vtune_Offset=0, CT=BCT
	//send_spi_word(txrx_cntrl & ~tx_enable);						// Tx Off, Tx_gain=Max, Core enable, Rx1 on, Rx2 on, RX gain high
    send_spi_word(txrx_cntrl);
    
    //Dave had a 3sec debug delay sequence thing here
    //I could try delaying for 3sec, but for now I'll just do another 500ms
    for(i = 0; i < 100; i++){
        delay5ms();
    }
    
    FreqCalFlag = Frequency_Cal();
    FreqCalFlag = 0;
    //BCT = 78;
    //BFT[0] = 12000;
    //BFT[1] = 13392;
    //BFT[2] = 16000;
    
    // If frequency calibration was okay, turn on transmitter
    if(FreqCalFlag == 0)
    {
        send_spi_word(pll_word_1[1] & ~pll_enable);	// PLL Disable
        send_spi_word(txrx_cntrl);
        send_spi_word(vco_word_2C | BCT);			// Vtune_Gain=1.2V/V, Vtune_Offset=1.5, CT= BCT from CT Discovery
        send_spi_word(vco_word_1X | BFT[0]);     	// Set up vco frequency //passenger programmed with this frequency 24.15GHz
//        send_spi_word(vco_word_1X | BFT[1]);
//        send_spi_word(vco_word_1X | BFT[2]);      //driver programmed with this frequency 24.16GHz
        					// Adjust Tx_gain and RX gain per RxCal results
    }
    
    return FreqCalFlag; //return 0 good
}

unsigned char Frequency_Cal(void)
// Frequency calibration - Run Voltage Offset, Coarse Tune, and Fine Tune Calibration using globally defined PLL constants
{
	unsigned char i;
	unsigned char j;
    unsigned int Voffset00;			// Calibrated voltage offset for low tuning gain, low tuning offset
    unsigned int Voffset11;			// Calibrated voltage offset for high tuning gain, high tuning offset
	unsigned char FreqCalFlag = 0;

	// Frequency calibration section. try up to 3 times for in range values
	for(i=3;i!=0;i--)
	{
		// Setup SC3001.2 for Offset Voltage Measurement
		//send_spi_word(txrx_cntrl & ~tx_enable);		// Tx Off, Tx_gain=Min, Core enable, Rx1 on, Rx2 on, RX gain high
        send_spi_word(txrx_cntrl);
		send_spi_word(pll_word_2);					// Amsb = 1, B = 28
		send_spi_word(vco_word_1A);					// FT = 16384
		send_spi_word(vco_word_2 | BCT);			// Vtune_Gain=1.2V/V, Vtune_Offset=0, CT=BCT

		// Measure Voffsets
		delay2_47us();     					// Wait 1x 2.47us SC3001.2 DAC to settle
		Voffset00 = sampleVTUNE();
		send_spi_word(vco_word_2X | BCT);			// Vtune_Gain=20V/V, Vtune_Offset=1.5V, CT=BCT
		delay2_47us();     					// Wait 1x 2.47us SC3001.2 DAC to settle
		Voffset11 = sampleVTUNE();

		// Go find new BCT after turning on XO
		enablePLL_REF();//P2OUT |= 0x20; // Set P2.5 - Ext Osc ON
		delay32_11us();            			// Wait 1x 30us for internal reference to settle
		CT_Discovery(Voffset11);
		if ((BCT < 10) | (BCT > 120))
		{
			FreqCalFlag = 1;		// Check that BCT is in acceptable range
			BCT = 0x0050;			// Set back to default value //huh? 0x0050? not 0x0040? not 0x004D?
		}
		else
		{
			FreqCalFlag = 0;
			// FT Discovery
			for(j=0;j<=2;j++)                              // Loop through calibration frequencies to record BFT for each
			{
				FT_Discovery(j, Voffset00, Voffset11);
				if ((BFT[j] < 6554) | (BFT[j] > 30147))
				{
					FreqCalFlag = 1;	// Check that BCT and BFT is in acceptable range
					BFT[j] = 0x4000;	// Set back to default value
				}
				else
				{
					FreqCalFlag = 0;
				}
			}
		}
		if(FreqCalFlag == 0) break;	// If flag isn't set, BCT and BFT are good and the looping can end
	}
	disablePLL_REF();//P2OUT &= ~0x20; // Set P2.5 - Ext Osc OFF
    FreqCalFlag = 0;
	return FreqCalFlag;
}

void CT_Discovery(unsigned int Voffset11){
    unsigned int PLL_LOCK = 0;
    // Initialize variables
	unsigned char D = 0;					// Variable used to store "distance" from discontinuity
    unsigned char D0 = 0;				// Previous D
    unsigned char i;						// Loop index values 0 and 1 to indicate which of two linear segments to operate on
    unsigned char j;						// Loop index values for power of two
    unsigned char CTstep;				// Starting CT step is 8
    unsigned char CT;					// Coarse tune value (initially set to 63, this will be adjusted in the code)
    unsigned char CT0;					// Prior CT
    unsigned int BCT0 = 0;				// Previous BCTBest coarse tune value (this would be allocated in function statement and returned in final code)
    unsigned int Vmin = 0x07FF;			// Max voltage measurement divided by 2
    unsigned int V_Tune63;				//
    unsigned int V_Tune64;				//
    unsigned int V_Tune;				//
    signed int Error;					//

    // Attempt PLL Lock at Major Discontinuity where CT = 63 & 64 and measure V_tune to determine which two linear segments possibly contain the BCT
    send_spi_word(pll_word_1[1]);				// PLL enable, A_counter, R_counter
   	send_spi_word(pll_word_2);					// B_counter
    send_spi_word(vco_word_1X);					// FT = 0
    send_spi_word(vco_word_2A);					// V_Tune_Gain=1.2V/V, V_Tune_Offset=0, CT=63
    //send_spi_word(txrx_cntrl & ~tx_enable);					// Tx Off, Tx_gain=0, Core enable, Rx1 On, Rx2 On, RX gain high
    send_spi_word(txrx_cntrl);
    delay5ms(); //FIXME      			// Wait .4ms for PLL to settle //datasheet says 5ms, Dave said change from .4ms to 2ms

    V_Tune63 = sampleVTUNE();
    send_spi_word(vco_word_2B);					// V_Tune_Gain=1.2V/V, V_Tune_Offset=0, CT=64
    delay5ms(); //FIXME      			// Wait .4ms for PLL to settle //datasheet says 5ms, Dave said change from .4ms to 2ms
    V_Tune64 = sampleVTUNE();
    for (i = 0; i < 2; i++)						// Loop twice with index i over the two segments that can contain the BCT
    {
    	CT = 48;
      	CT0 = 64;
      	if ((V_Tune63 < Voffset11)&(V_Tune64 < Voffset11))
      	{
      		CT = 80;
      		CT0 = 96;
      	}
      	if ((V_Tune63 > Voffset11)&(V_Tune64 > Voffset11))
      	{
      		CT = 16;
      		CT0 = 32;
      	}
      	CT = CT + (i << 5);
      	CTstep = 8;
      	for (j = 6; j != 0; j--)									// Use successive approximation to find BCT on this linear segment
      	{
      		// Set CT and Measure V_Tune
      		send_spi_word(vco_word_2 | CT);							// V_Tune_Gain=1.2V/V, V_Tune_Offset=0, CT= variable CT
      	    delay5ms(); //FIXME      			// Wait .4ms for PLL to settle //datasheet says 5ms, Dave said change from .4ms to 2ms
      	    V_Tune = sampleVTUNE();

      		// Calculate Error and Sign Value if PLL is locked
            PLL_LOCK = PORTEbits.RE0;
     		if (PLL_LOCK) //FIXME									// If PLL_LOCK (P2.7) is high
     		{
          		Error = V_Tune - Voffset11;
          		if (Error < 0)
          		{
          			Error = -Error;
          		}
     			if (Error < Vmin)
     			{
     				Vmin = Error;
     				BCT0 = CT;
     				if(CT > CT0)
					{
     					D0 = CT - CT0;
     				}
     				else
     				{
     					D0 = CT0 - CT;
     				}
     			}
     		}
          	if (V_Tune < Voffset11) CT = CT + CTstep;		// Calculate new CT
          	if (V_Tune >= Voffset11) CT = CT - CTstep;		// Calculate new CT
      		if (CTstep > 1) CTstep = CTstep >> 1;					// Calculate new CTstep
      	}
      	Vmin = 0x07FF;												// Reset Vmin to 1/2 Vmax
      	if(D0>D)
      	{
      		D=D0;
      		BCT=BCT0;
      	}
    }
}

void FT_Discovery(unsigned char j, unsigned int Voffset00, unsigned int Voffset11){
    // Initialize variables
    unsigned int i = 0;								// Best coarse tune value (this would be allocated in function statement and passed into function)
    unsigned int MinError = 0x3F;					// Minimum error variable
    unsigned int FT = 0x0000;
    unsigned int V_Tune = 0x0000;
    signed int Error = 0x0000;
    signed int ErrorMag = 0x0000;
    unsigned int ErrorSign = 0x00;


	// Assign Variables to set Fc = 24.16 GHz Given 20 MHz PLL REF and R=3
    // Lock PLL at Calibration Frequency and measure Vtune to calculate initial FT
	send_spi_word(vco_word_1X);						// FT = 0
	send_spi_word(pll_word_1[j] | pll_enable);		// PLL Enable, A = 10, R = 3
	send_spi_word(pll_word_2);						// Amsb = 1, B = 28
	FT = 0x4000;									// Set FT at mid value

	send_spi_word(vco_word_2 | BCT);				// Vtune_Gain=1.2V/V, Vtune_Offset=0, CT= BCT from CT Discovery
    delay5ms(); //FIXME      			// Wait .4ms for PLL to settle //datasheet says 5ms, Dave said change from .4ms to 2ms
	V_Tune = sampleVTUNE(); 			// Measure fine tune
	Error = (int)V_Tune - (int)Voffset00;						// Subtract Voffset00 to find error
	FT = (Error << 3) + (Error >> 1) + (Error >> 2) + (Error >> 5) + (Error >> 6) + (Error >> 9) + (Error >> 10);
	// Multiplying Error by (32+4+1+1/4+1/16+1/64+1/256+1/1024) is close (Vadc/2^10*3.5/1.2/2.5*2^15 ~ Vadc*37.33)

	// Reduce error by switching to higher gain V_Tune measurement
	send_spi_word(vco_word_2X | BCT);				// Change to Vtune_Gain=20V/V, Vtune_Offset=1.5V, CT= BCT from CT Discovery
	// Loop while error is large
	MinError = 0x7FFF;
	for (i=8; i!=0; i--)
	{
		// Measure error
		send_spi_word(vco_word_1X | FT);			// Set FT close to correct value
		delay5ms(); //FIXME      			// Wait .4ms for PLL to settle //datasheet says 5ms, Dave said change from .4ms to 2ms
		V_Tune = sampleVTUNE();     		// Measure error voltage
		Error = (int)V_Tune - (int)Voffset11;
		if(Error < 0)
		{
			ErrorMag = -Error;
			ErrorSign = 1;
		}
		else
		{
			ErrorMag = Error;
			ErrorSign = 0;
		}
		Error = (ErrorMag >> 1) + (ErrorMag >> 6) + (ErrorMag >> 7) + (ErrorMag >> 8); 	// Error*7/5*32/20 = Error*2.24 is close to correct scaling, use Error*(2+0.25) underdamped
		if(ErrorSign==1)Error = -Error;

   		if(ErrorMag < MinError)
		{
			MinError = ErrorMag;
			BFT[j] = FT;
		}
		FT = FT + Error;
	}
}