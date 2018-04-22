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


#include <Rcpp.h>
#include "fibonacci_heap.hpp"


RCPP_MODULE(fibonacci_heap_module) {
    Rcpp::class_< fibonacci_heap_s >( "fibonacci_heap_s" )
        .constructor()
        .method("peek",   &fibonacci_heap_s::peek)
        .method("handles",   &fibonacci_heap_s::handles)
        .method("values",   &fibonacci_heap_s::values)
        .method("decrease_key",   &fibonacci_heap_s::decrease_key)
        .method("pop",    &fibonacci_heap_s::pop)
        .method("size",   &fibonacci_heap_s::size)
        .method("insert", &fibonacci_heap_s::insert)
        .method("clear",  &fibonacci_heap_s::clear);
    Rcpp::class_< fibonacci_heap_d >( "fibonacci_heap_d" )
        .constructor()
        .method("peek",   &fibonacci_heap_d::peek)
        .method("handles",   &fibonacci_heap_d::handles)
        .method("values",   &fibonacci_heap_d::values)
        .method("decrease_key",   &fibonacci_heap_d::decrease_key)
        .method("pop",    &fibonacci_heap_d::pop)
        .method("size",   &fibonacci_heap_d::size)
        .method("insert", &fibonacci_heap_d::insert)
        .method("clear",  &fibonacci_heap_d::clear);
    Rcpp::class_< fibonacci_heap_i >( "fibonacci_heap_i" )
        .constructor()
        .method("peek",   &fibonacci_heap_i::peek)
        .method("handles",   &fibonacci_heap_i::handles)
        .method("values",   &fibonacci_heap_i::values)
        .method("decrease_key",   &fibonacci_heap_i::decrease_key)
        .method("pop",    &fibonacci_heap_i::pop)
        .method("size",   &fibonacci_heap_i::size)
        .method("insert", &fibonacci_heap_i::insert)
        .method("clear",  &fibonacci_heap_i::clear);
}
