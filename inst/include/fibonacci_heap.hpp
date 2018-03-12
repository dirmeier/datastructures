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

using fibonacci_heap_ss =
  heap<boost::heap::fibonacci_heap, std::string, std::string>;
using fibonacci_heap_si = heap<boost::heap::fibonacci_heap, std::string, int>;
using fibonacci_heap_sb = heap<boost::heap::fibonacci_heap, std::string, bool>;
using fibonacci_heap_sd =
  heap<boost::heap::fibonacci_heap, std::string, double>;

using fibonacci_heap_ds =
  heap<boost::heap::fibonacci_heap, double, std::string>;
using fibonacci_heap_di = heap<boost::heap::fibonacci_heap, double, int>;
using fibonacci_heap_db = heap<boost::heap::fibonacci_heap, double, bool>;
using fibonacci_heap_dd = heap<boost::heap::fibonacci_heap, double, double>;

using fibonacci_heap_is = heap<boost::heap::fibonacci_heap, int, std::string>;
using fibonacci_heap_ii = heap<boost::heap::fibonacci_heap, int, int>;
using fibonacci_heap_ib = heap<boost::heap::fibonacci_heap, int, bool>;
using fibonacci_heap_id = heap<boost::heap::fibonacci_heap, int, double>;

#endif
