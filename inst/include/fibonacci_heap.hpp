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


#ifndef DS_FIBONACCIHEAP
#define DS_FIBONACCIHEAP


#include <boost/heap/fibonacci_heap.hpp>
#include "heap.hpp"

typedef heap<boost::heap::fibonacci_heap, std::string, std::string> fibonacci_heap_ss;
typedef heap<boost::heap::fibonacci_heap, std::string, int>         fibonacci_heap_si;
typedef heap<boost::heap::fibonacci_heap, std::string, bool>        fibonacci_heap_sb;
typedef heap<boost::heap::fibonacci_heap, std::string, double>      fibonacci_heap_sd;

typedef heap<boost::heap::fibonacci_heap, double, std::string>  fibonacci_heap_ds;
typedef heap<boost::heap::fibonacci_heap, double, int>          fibonacci_heap_di;
typedef heap<boost::heap::fibonacci_heap, double, bool>         fibonacci_heap_db;
typedef heap<boost::heap::fibonacci_heap, double, double>       fibonacci_heap_dd;

typedef heap<boost::heap::fibonacci_heap, int, std::string>  fibonacci_heap_is;
typedef heap<boost::heap::fibonacci_heap, int, int>          fibonacci_heap_ii;
typedef heap<boost::heap::fibonacci_heap, int, bool>         fibonacci_heap_ib;
typedef heap<boost::heap::fibonacci_heap, int, double>       fibonacci_heap_id;

#endif
