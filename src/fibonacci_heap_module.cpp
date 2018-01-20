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
    Rcpp::class_< fibonacci_heap_ss >( "fibonacci_heap_ss" )
        .constructor()
        .method("peek",   &fibonacci_heap_ss::peek)
        .method("pop",    &fibonacci_heap_ss::pop)
        .method("size",   &fibonacci_heap_ss::size)
        .method("insert", &fibonacci_heap_ss::insert)
        .method("clear",  &fibonacci_heap_ss::clear);
    Rcpp::class_< fibonacci_heap_sd >( "fibonacci_heap_sd" )
        .constructor()
        .method("peek",   &fibonacci_heap_sd::peek)
        .method("pop",    &fibonacci_heap_sd::pop)
        .method("size",   &fibonacci_heap_sd::size)
        .method("insert", &fibonacci_heap_sd::insert)
        .method("clear",  &fibonacci_heap_sd::clear);
    Rcpp::class_< fibonacci_heap_si >( "fibonacci_heap_si" )
        .constructor()
        .method("peek",   &fibonacci_heap_si::peek)
        .method("pop",    &fibonacci_heap_si::pop)
        .method("size",   &fibonacci_heap_si::size)
        .method("insert", &fibonacci_heap_si::insert)
        .method("clear",  &fibonacci_heap_si::clear);

    Rcpp::class_< fibonacci_heap_dd >( "fibonacci_heap_dd" )
        .constructor()
        .method("peek",   &fibonacci_heap_dd::peek)
        .method("pop",    &fibonacci_heap_dd::pop)
        .method("size",   &fibonacci_heap_dd::size)
        .method("insert", &fibonacci_heap_dd::insert)
        .method("clear",  &fibonacci_heap_dd::clear);
    Rcpp::class_< fibonacci_heap_ds >( "fibonacci_heap_ds" )
        .constructor()
        .method("peek",   &fibonacci_heap_ds::peek)
        .method("pop",    &fibonacci_heap_ds::pop)
        .method("size",   &fibonacci_heap_ds::size)
        .method("insert", &fibonacci_heap_ds::insert)
        .method("clear",  &fibonacci_heap_ds::clear);
    Rcpp::class_< fibonacci_heap_di >( "fibonacci_heap_di" )
        .constructor()
        .method("peek",   &fibonacci_heap_di::peek)
        .method("pop",    &fibonacci_heap_di::pop)
        .method("size",   &fibonacci_heap_di::size)
        .method("insert", &fibonacci_heap_di::insert)
        .method("clear",  &fibonacci_heap_di::clear);
    Rcpp::class_< fibonacci_heap_id >( "fibonacci_heap_id" )
        .constructor()
        .method("peek",   &fibonacci_heap_id::peek)
        .method("pop",    &fibonacci_heap_id::pop)
        .method("size",   &fibonacci_heap_id::size)
        .method("insert", &fibonacci_heap_id::insert)
        .method("clear",  &fibonacci_heap_id::clear);
    Rcpp::class_< fibonacci_heap_is >( "fibonacci_heap_is" )
        .constructor()
        .method("peek",   &fibonacci_heap_is::peek)
        .method("pop",    &fibonacci_heap_is::pop)
        .method("size",   &fibonacci_heap_is::size)
        .method("insert", &fibonacci_heap_is::insert)
        .method("clear",  &fibonacci_heap_is::clear);
    Rcpp::class_< fibonacci_heap_ii >( "fibonacci_heap_ii" )
        .constructor()
        .method("peek",   &fibonacci_heap_ii::peek)
        .method("pop",    &fibonacci_heap_ii::pop)
        .method("size",   &fibonacci_heap_ii::size)
        .method("insert", &fibonacci_heap_ii::insert)
        .method("clear",  &fibonacci_heap_ii::clear);
}
