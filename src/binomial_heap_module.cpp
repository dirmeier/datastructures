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
    Rcpp::class_< binomial_heap_ss >( "binomial_heap_ss" )
    .constructor()
    .method("peek",   &binomial_heap_ss::peek)
    .method("handles",   &fibonacci_heap_ss::handles)
    .method("decrease_key",   &fibonacci_heap_ss::decrease_key)
    .method("pop",    &binomial_heap_ss::pop)
    .method("size",   &binomial_heap_ss::size)
    .method("insert", &binomial_heap_ss::insert)
    .method("clear",  &binomial_heap_ss::clear);
    Rcpp::class_< binomial_heap_sd >( "binomial_heap_sd" )
        .constructor()
        .method("peek",   &binomial_heap_sd::peek)
        .method("handles",   &fibonacci_heap_sd::handles)
        .method("decrease_key",   &fibonacci_heap_sd::decrease_key)
        .method("pop",    &binomial_heap_sd::pop)
        .method("size",   &binomial_heap_sd::size)
        .method("insert", &binomial_heap_sd::insert)
        .method("clear",  &binomial_heap_sd::clear);
    Rcpp::class_< binomial_heap_si >( "binomial_heap_si" )
        .constructor()
        .method("peek",   &binomial_heap_si::peek)
        .method("handles",   &fibonacci_heap_si::handles)
        .method("decrease_key",   &fibonacci_heap_si::decrease_key)
        .method("pop",    &binomial_heap_si::pop)
        .method("size",   &binomial_heap_si::size)
        .method("insert", &binomial_heap_si::insert)
        .method("clear",  &binomial_heap_si::clear);

    Rcpp::class_< binomial_heap_dd >( "binomial_heap_dd" )
        .constructor()
        .method("peek",   &binomial_heap_dd::peek)
        .method("handles",   &fibonacci_heap_dd::handles)
        .method("decrease_key",   &fibonacci_heap_dd::decrease_key)
        .method("pop",    &binomial_heap_dd::pop)
        .method("size",   &binomial_heap_dd::size)
        .method("insert", &binomial_heap_dd::insert)
        .method("clear",  &binomial_heap_dd::clear);
    Rcpp::class_< binomial_heap_ds >( "binomial_heap_ds" )
        .constructor()
        .method("peek",   &binomial_heap_ds::peek)
        .method("handles",   &fibonacci_heap_ds::handles)
        .method("decrease_key",   &fibonacci_heap_ds::decrease_key)
        .method("pop",    &binomial_heap_ds::pop)
        .method("size",   &binomial_heap_ds::size)
        .method("insert", &binomial_heap_ds::insert)
        .method("clear",  &binomial_heap_ds::clear);
    Rcpp::class_< binomial_heap_di >( "binomial_heap_di" )
        .constructor()
        .method("peek",   &binomial_heap_di::peek)
        .method("handles",   &fibonacci_heap_di::handles)
        .method("decrease_key",   &fibonacci_heap_di::decrease_key)
        .method("pop",    &binomial_heap_di::pop)
        .method("size",   &binomial_heap_di::size)
        .method("insert", &binomial_heap_di::insert)
        .method("clear",  &binomial_heap_di::clear);
    Rcpp::class_< binomial_heap_id >( "binomial_heap_id" )
        .constructor()
        .method("peek",   &binomial_heap_id::peek)
        .method("handles",   &fibonacci_heap_id::handles)
        .method("decrease_key",   &fibonacci_heap_id::decrease_key)
        .method("pop",    &binomial_heap_id::pop)
        .method("size",   &binomial_heap_id::size)
        .method("insert", &binomial_heap_id::insert)
        .method("clear",  &binomial_heap_id::clear);
    Rcpp::class_< binomial_heap_is >( "binomial_heap_is" )
        .constructor()
        .method("peek",   &binomial_heap_is::peek)
        .method("handles",   &fibonacci_heap_is::handles)
        .method("decrease_key",   &fibonacci_heap_is::decrease_key)
        .method("pop",    &binomial_heap_is::pop)
        .method("size",   &binomial_heap_is::size)
        .method("insert", &binomial_heap_is::insert)
        .method("clear",  &binomial_heap_is::clear);
    Rcpp::class_< binomial_heap_ii >( "binomial_heap_ii" )
        .constructor()
        .method("peek",   &binomial_heap_ii::peek)
        .method("handles",   &fibonacci_heap_ii::handles)
        .method("decrease_key",   &fibonacci_heap_ii::decrease_key)
        .method("pop",    &binomial_heap_ii::pop)
        .method("size",   &binomial_heap_ii::size)
        .method("insert", &binomial_heap_ii::insert)
        .method("clear",  &binomial_heap_ii::clear);
}
