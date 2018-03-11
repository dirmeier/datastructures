/**
 * datastructures: Implementation of core datastructures for R.
 * <p>
 * Copyright (C) Simon Dirmeier
 * <p>
 * This file is part of datastructures.
 * <p>
 * datastructures is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * <p>
 * datastructures is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * <p>
 * You should have received a copy of the GNU General Public License
 * along with datastructures. If not, see <http://www.gnu.org/licenses/>.
 *
 */


#include <R.h>
#include <Rinternals.h>
#include <stdlib.h>
#include <R_ext/Rdynload.h>

extern SEXP _rcpp_module_boot_bimap_module();
extern SEXP _rcpp_module_boot_hashmap_module();
extern SEXP _rcpp_module_boot_multimap_module();

extern SEXP _rcpp_module_boot_binomial_heap_module();
extern SEXP _rcpp_module_boot_fibonacci_heap_module();

extern SEXP _rcpp_module_boot_queue_module();
extern SEXP _rcpp_module_boot_stack_module();

static const R_CallMethodDef CallEntries[] = {
    {"_rcpp_module_boot_hashmap_module",
      (DL_FUNC) &_rcpp_module_boot_hashmap_module, 0},
    {"_rcpp_module_boot_bimap_module",
      (DL_FUNC) &_rcpp_module_boot_bimap_module, 0},
    {"_rcpp_module_boot_multimap_module",
      (DL_FUNC) &_rcpp_module_boot_multimap_module, 0},

    {"_rcpp_module_boot_binomial_heap_module",
     (DL_FUNC) &_rcpp_module_boot_binomial_heap_module, 0},
    {"_rcpp_module_boot_fibonacci_heap_module",
     (DL_FUNC) &_rcpp_module_boot_fibonacci_heap_module, 0},

    {"_rcpp_module_boot_queue_module",
     (DL_FUNC) &_rcpp_module_boot_queue_module, 0},
    {"_rcpp_module_boot_stack_module",
     (DL_FUNC) &_rcpp_module_boot_stack_module, 0},
    {NULL, NULL, 0}
};

void R_init_datastructures(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
