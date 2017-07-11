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
#include "d_ary_heap.hpp"

RCPP_MODULE(d_ary_heap_module) {
    Rcpp::class_< d_ary_heap_ss >( "d_ary_heap_ss" )
    .constructor()
    .method("peek",   &d_ary_heap_ss::peek)
    .method("pop",    &d_ary_heap_ss::pop)
    .method("size",   &d_ary_heap_ss::size)
    .method("insert", &d_ary_heap_ss::insert)
    .method("clear",  &d_ary_heap_ss::clear);
    Rcpp::class_< d_ary_heap_sd >( "d_ary_heap_sd" )
        .constructor()
        .method("peek",   &d_ary_heap_sd::peek)
        .method("pop",    &d_ary_heap_sd::pop)
        .method("size",   &d_ary_heap_sd::size)
        .method("insert", &d_ary_heap_sd::insert)
        .method("clear",  &d_ary_heap_sd::clear);
    Rcpp::class_< d_ary_heap_si >( "d_ary_heap_si" )
        .constructor()
        .method("peek",   &d_ary_heap_si::peek)
        .method("pop",    &d_ary_heap_si::pop)
        .method("size",   &d_ary_heap_si::size)
        .method("insert", &d_ary_heap_si::insert)
        .method("clear",  &d_ary_heap_si::clear);

    Rcpp::class_< d_ary_heap_dd >( "d_ary_heap_dd" )
        .constructor()
        .method("peek",   &d_ary_heap_dd::peek)
        .method("pop",    &d_ary_heap_dd::pop)
        .method("size",   &d_ary_heap_dd::size)
        .method("insert", &d_ary_heap_dd::insert)
        .method("clear",  &d_ary_heap_dd::clear);
    Rcpp::class_< d_ary_heap_ds >( "d_ary_heap_ds" )
        .constructor()
        .method("peek",   &d_ary_heap_ds::peek)
        .method("pop",    &d_ary_heap_ds::pop)
        .method("size",   &d_ary_heap_ds::size)
        .method("insert", &d_ary_heap_ds::insert)
        .method("clear",  &d_ary_heap_ds::clear);
    Rcpp::class_< d_ary_heap_di >( "d_ary_heap_di" )
        .constructor()
        .method("peek",   &d_ary_heap_di::peek)
        .method("pop",    &d_ary_heap_di::pop)
        .method("size",   &d_ary_heap_di::size)
        .method("insert", &d_ary_heap_di::insert)
        .method("clear",  &d_ary_heap_di::clear);

    Rcpp::class_< d_ary_heap_id >( "d_ary_heap_id" )
        .constructor()
        .method("peek",   &d_ary_heap_id::peek)
        .method("pop",    &d_ary_heap_id::pop)
        .method("size",   &d_ary_heap_id::size)
        .method("insert", &d_ary_heap_id::insert)
        .method("clear",  &d_ary_heap_id::clear);
    Rcpp::class_< d_ary_heap_is >( "d_ary_heap_is" )
        .constructor()
        .method("peek",   &d_ary_heap_is::peek)
        .method("pop",    &d_ary_heap_is::pop)
        .method("size",   &d_ary_heap_is::size)
        .method("insert", &d_ary_heap_is::insert)
        .method("clear",  &d_ary_heap_is::clear);
    Rcpp::class_< d_ary_heap_ii >( "d_ary_heap_ii" )
        .constructor()
        .method("peek",   &d_ary_heap_ii::peek)
        .method("pop",    &d_ary_heap_ii::pop)
        .method("size",   &d_ary_heap_ii::size)
        .method("insert", &d_ary_heap_ii::insert)
        .method("clear",  &d_ary_heap_ii::clear);
}
