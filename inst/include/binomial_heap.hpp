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


#ifndef DS_BINOMIALHEAP
#define DS_BINOMIALHEAP


#include <Rcpp.h>
#include <boost/heap/binomial_heap.hpp>
#include "heap.hpp"

typedef heap<boost::heap::binomial_heap, std::string, std::string> binomial_heap_ss;
typedef heap<boost::heap::binomial_heap, std::string, int>         binomial_heap_si;
typedef heap<boost::heap::binomial_heap, std::string, bool>        binomial_heap_sb;
typedef heap<boost::heap::binomial_heap, std::string, double>      binomial_heap_sd;

typedef heap<boost::heap::binomial_heap, double, std::string>  binomial_heap_ds;
typedef heap<boost::heap::binomial_heap, double, int>          binomial_heap_di;
typedef heap<boost::heap::binomial_heap, double, bool>         binomial_heap_db;
typedef heap<boost::heap::binomial_heap, double, double>       binomial_heap_dd;

typedef heap<boost::heap::binomial_heap, int, std::string>  binomial_heap_is;
typedef heap<boost::heap::binomial_heap, int, int>          binomial_heap_ii;
typedef heap<boost::heap::binomial_heap, int, bool>         binomial_heap_ib;
typedef heap<boost::heap::binomial_heap, int, double>       binomial_heap_id;

#endif
