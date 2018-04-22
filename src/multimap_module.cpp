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
#include "multimap.hpp"


RCPP_MODULE(multimap_module) {
    Rcpp::class_< multimap_s >( "multimap_s" )
        .constructor()
        .method("keys",   &multimap_s::keys)
        .method("values", &multimap_s::values)
        .method("head",   &multimap_s::head)
        .method("size",   &multimap_s::size)
        .method("insert", &multimap_s::insert)
        .method("get",    &multimap_s::get);
    Rcpp::class_< multimap_d >( "multimap_d" )
        .constructor()
        .method("keys",   &multimap_d::keys)
        .method("values", &multimap_d::values)
        .method("head",   &multimap_d::head)
        .method("size",   &multimap_d::size)
        .method("insert", &multimap_d::insert)
        .method("get",    &multimap_d::get);
    Rcpp::class_< multimap_i >( "multimap_i" )
        .constructor()
        .method("keys",   &multimap_i::keys)
        .method("values", &multimap_i::values)
        .method("head",   &multimap_i::head)
        .method("size",   &multimap_i::size)
        .method("insert", &multimap_i::insert)
        .method("get",    &multimap_i::get);

}
