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

#include <boost/heap/binomial_heap.hpp>
#include "heap.hpp"

using binomial_heap_ss =
    heap<boost::heap::binomial_heap, std::string, std::string>;
using binomial_heap_si = heap<boost::heap::binomial_heap, std::string, int>;
using binomial_heap_sb = heap<boost::heap::binomial_heap, std::string, bool>;
using binomial_heap_sd =
    heap<boost::heap::binomial_heap, std::string, double>;

using binomial_heap_ds =
    heap<boost::heap::binomial_heap, double, std::string>;
using binomial_heap_di = heap<boost::heap::binomial_heap, double, int>;
using binomial_heap_db = heap<boost::heap::binomial_heap, double, bool>;
using binomial_heap_dd = heap<boost::heap::binomial_heap, double, double>;

using binomial_heap_is = heap<boost::heap::binomial_heap, int, std::string>;
using binomial_heap_ii = heap<boost::heap::binomial_heap, int, int>;
using binomial_heap_ib = heap<boost::heap::binomial_heap, int, bool>;
using binomial_heap_id = heap<boost::heap::binomial_heap, int, double>;

#endif
