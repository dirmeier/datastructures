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
#include "hashmap.hpp"

RCPP_MODULE(hashmap_module) {
    Rcpp::class_< hashmap_s >( "hashmap_s" )
        .constructor()
        .method("keys",   &hashmap_s::keys)
        .method("values", &hashmap_s::values)
        .method("clear",  &hashmap_s::clear)
        .method("remove", &hashmap_s::remove)
        .method("remove_with_value", &hashmap_s::remove_with_value)
        .method("head",   &hashmap_s::head)
        .method("size",   &hashmap_s::size)
        .method("insert", &hashmap_s::insert)
        .method("get",    &hashmap_s::get);
    Rcpp::class_< hashmap_d >( "hashmap_d" )
        .constructor()
        .method("keys",   &hashmap_d::keys)
        .method("values", &hashmap_d::values)
        .method("clear",  &hashmap_d::clear)
        .method("remove", &hashmap_d::remove)
        .method("remove_with_value", &hashmap_d::remove_with_value)
        .method("head",   &hashmap_d::head)
        .method("size",   &hashmap_d::size)
        .method("insert", &hashmap_d::insert)
        .method("get",    &hashmap_d::get);
    Rcpp::class_< hashmap_i >( "hashmap_i" )
        .constructor()
        .method("keys",   &hashmap_i::keys)
        .method("values", &hashmap_i::values)
        .method("clear",  &hashmap_i::clear)
        .method("remove", &hashmap_i::remove)
        .method("remove_with_value", &hashmap_i::remove_with_value)
        .method("head",   &hashmap_i::head)
        .method("size",   &hashmap_i::size)
        .method("insert", &hashmap_i::insert)
        .method("get",    &hashmap_i::get);
}
