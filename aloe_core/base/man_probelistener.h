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

#ifndef MAN_PROBELISTENER_H
#define MAN_PROBELISTENER_H

#include "objects_max.h"
#include "hwapi.h"
#include "man_probehandlers.h"

typedef struct {
	man_probehandlers_t handlers[MAX(man_probehandlers)];
	h_itf_t* itf;
}man_probelistener_t;

int man_probelistener_add(man_probelistener_t *lstnr, void (*callback)(void), int code);
int man_probelistener_remove(man_probelistener_t *lstnr, int code);
int man_probelistener_setup(man_probelistener_t *lstnr, h_itf_t *itf);
int man_probelistener_process(man_probelistener_t *lstnr);

#endif