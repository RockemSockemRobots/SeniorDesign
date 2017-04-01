/* 
 * File:   pll_ref.h
 * Author: jsiek
 *
 * Created on April 1, 2017, 12:28 PM
 */

#ifndef PLL_REF_H
#define	PLL_REF_H

#include <xc.h>

#ifdef	__cplusplus
extern "C" {
#endif

void init1MHzPLL_REF();
void enablePLL_REF();
void disablePLL_REF();


#ifdef	__cplusplus
}
#endif

#endif	/* PLL_REF_H */

