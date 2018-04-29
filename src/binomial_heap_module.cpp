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
#include "binomial_heap.hpp"


RCPP_MODULE(binomial_heap_module) {
    Rcpp::class_< binomial_heap_s >( "binomial_heap_s" )
        .constructor()
        .method("peek",   &binomial_heap_s::peek)
        .method("handles",   &binomial_heap_s::handles)
        .method("handle_values",   &binomial_heap_s::handles_value)
        .method("values",   &binomial_heap_s::values)
        .method("decrease_key",   &binomial_heap_s::decrease_key)
        .method("pop",    &binomial_heap_s::pop)
        .method("size",   &binomial_heap_s::size)
        .method("insert", &binomial_heap_s::insert)
        .method("clear",  &binomial_heap_s::clear);
    Rcpp::class_< binomial_heap_d >( "binomial_heap_d" )
        .constructor()
        .method("peek",   &binomial_heap_d::peek)
        .method("handles",   &binomial_heap_d::handles)
        .method("handle_values",   &binomial_heap_d::handles_value)
        .method("values",   &binomial_heap_d::values)
        .method("decrease_key",   &binomial_heap_d::decrease_key)
        .method("pop",    &binomial_heap_d::pop)
        .method("size",   &binomial_heap_d::size)
        .method("insert", &binomial_heap_d::insert)
        .method("clear",  &binomial_heap_d::clear);
    Rcpp::class_< binomial_heap_i >( "binomial_heap_i" )
        .constructor()
        .method("peek",   &binomial_heap_i::peek)
        .method("handles",   &binomial_heap_i::handles)
        .method("handle_values",   &binomial_heap_i::handles_value)
        .method("values",   &binomial_heap_i::values)
        .method("decrease_key",   &binomial_heap_i::decrease_key)
        .method("pop",    &binomial_heap_i::pop)
        .method("size",   &binomial_heap_i::size)
        .method("insert", &binomial_heap_i::insert)
        .method("clear",  &binomial_heap_i::clear);
}
