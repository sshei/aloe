/* 
 * Copyright (c) 2012, Ismael Gomez-Miguelez <ismael.gomez@tsc.upc.edu>.
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

#ifndef MAN_PROCESSOR_H
#define MAN_PROCESSOR_H

typedef struct {

	/**
	 * Total processor capacity, in MOPS
	 */
	float total_c;
	/**
	 * Total internal processor bandwidth (i.e. memory bandwidth). In MBPS
	 */
	float total_b;
	/**
	 * Remaining processor capacity, in MOPS
	 */
	float rem_c;
	/**
	 * Remaining internal bandwidth (in MBPS)
	 */
	float rem_b;
	/**
	 * Processor index in the node
	 */
	int idx;

} man_processor_t;

#endif
