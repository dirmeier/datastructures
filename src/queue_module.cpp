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
#include "queue.hpp"

RCPP_MODULE(queue_module) {
    Rcpp::class_< queue_d >("queue_d")
        .constructor()
        .method("peek",   &queue_d::peek)
        .method("pop",    &queue_d::pop)
        .method("size",   &queue_d::size)
        .method("insert", &queue_d::insert);
    Rcpp::class_< queue_s >( "queue_s" )
        .constructor()
        .method("peek",   &queue_s::peek)
        .method("pop",    &queue_s::pop)
        .method("size",   &queue_s::size)
        .method("insert", &queue_s::insert);
    Rcpp::class_< queue_i >( "queue_i" )
        .constructor()
        .method("peek",   &queue_i::peek)
        .method("pop",    &queue_i::pop)
        .method("size",   &queue_i::size)
        .method("insert", &queue_i::insert);
}
