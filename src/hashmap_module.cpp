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
    Rcpp::class_< hashmap_ss >( "hashmap_ss" )
        .constructor()
        .method("size",   &hashmap_ss::size)
        .method("insert", &hashmap_ss::insert)
        .method("get",    &hashmap_ss::get);
    Rcpp::class_< hashmap_si >( "hashmap_si" )
        .constructor()
        .method("size",   &hashmap_si::size)
        .method("insert", &hashmap_si::insert)
        .method("get",    &hashmap_si::get);
    Rcpp::class_< hashmap_sb >( "hashmap_sb" )
        .constructor()
        .method("size",   &hashmap_sb::size)
        .method("insert", &hashmap_sb::insert)
        .method("get",    &hashmap_sb::get);
    Rcpp::class_< hashmap_sd >( "hashmap_sd" )
        .constructor()
        .method("size",   &hashmap_sd::size)
        .method("insert", &hashmap_sd::insert)
        .method("get",    &hashmap_sd::get);

    Rcpp::class_< hashmap_ds >( "hashmap_ds" )
        .constructor()
        .method("size",   &hashmap_ds::size)
        .method("insert", &hashmap_ds::insert)
        .method("get",    &hashmap_ds::get);
    Rcpp::class_< hashmap_dd >( "hashmap_dd" )
        .constructor()
        .method("size",   &hashmap_dd::size)
        .method("insert", &hashmap_dd::insert)
        .method("get",    &hashmap_dd::get);
    Rcpp::class_< hashmap_di >( "hashmap_di" )
        .constructor()
        .method("size",   &hashmap_di::size)
        .method("insert", &hashmap_di::insert)
        .method("get",    &hashmap_di::get);
    Rcpp::class_< hashmap_db >( "hashmap_db" )
        .constructor()
        .method("size",   &hashmap_db::size)
        .method("insert", &hashmap_db::insert)
        .method("get",    &hashmap_db::get);

    Rcpp::class_< hashmap_is >( "hashmap_is" )
        .constructor()
        .method("size",   &hashmap_is::size)
        .method("insert", &hashmap_is::insert)
        .method("get",    &hashmap_is::get);
    Rcpp::class_< hashmap_id >( "hashmap_id" )
        .constructor()
        .method("size",   &hashmap_id::size)
        .method("insert", &hashmap_id::insert)
        .method("get",    &hashmap_id::get);
    Rcpp::class_< hashmap_ib >( "hashmap_ib" )
        .constructor()
        .method("size",   &hashmap_ib::size)
        .method("insert", &hashmap_ib::insert)
        .method("get",    &hashmap_ib::get);
    Rcpp::class_< hashmap_ii >( "hashmap_ii" )
        .constructor()
        .method("size",   &hashmap_ii::size)
        .method("insert", &hashmap_ii::insert)
        .method("get",    &hashmap_ii::get);
}
