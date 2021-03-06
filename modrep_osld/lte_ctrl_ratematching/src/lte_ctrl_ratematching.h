/* 
 * Copyright (c) 2012, Vuk Marojevic <marojevic@tsc.upc.edu>.
 * This file is part of ALOE++ (http://flexnets.upc.edu/)
 * 
 * ALOE++ is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * ALOE++ is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with ALOE++.  If not, see <http://www.gnu.org/licenses/>.
 */


/**
 * @defgroup LTE control rate matching
 * This module implements the rate matching operation for LTE
 * control channels, associated with convolutional coding. It is configurable 
 * to operate in transmitter or receiver mode and includes interleaving, 
 * merging/splitting and punturing/repetition of bit streams, as specified by 
 * 3GPP.
 * @{
 */
#ifndef DEFINE_H
#define DEFINE_H

typedef char input_t;
typedef char output_t;

#define OUTPUT_MAX_SAMPLES 	8*576	/* Max 576 bits for PDCCH format 3 */
#define INPUT_MAX_SAMPLES 	8*576

#define NOF_INPUT_ITF		1
#define NOF_OUTPUT_ITF		1

#endif

/**@} */

//#define GENERATE_COMPLEX

/********* do not need to modify beyond here */

#ifndef INCLUDE_DEFS_ONLY

/* Input and output buffer sizes (in number of samples) */
const int input_max_samples = INPUT_MAX_SAMPLES;
const int output_max_samples = OUTPUT_MAX_SAMPLES;

/* leave these two lines unmodified */
int input_sample_sz = sizeof(input_t);
int output_sample_sz = sizeof(output_t);

/* Number of I/O interfaces. All have the same maximum size */
const int nof_input_itf = NOF_INPUT_ITF;
const int nof_output_itf = NOF_OUTPUT_ITF;

#endif
