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
        .method("keys",   &hashmap_ss::keys)
        .method("values", &hashmap_ss::values)
        .method("head",   &hashmap_ss::head)
        .method("size",   &hashmap_ss::size)
        .method("insert_many", &hashmap_ss::insert_many)
        .method("insert_vectorial", &hashmap_ss::insert_vectorial)
        .method("insert_many_vectorials", &hashmap_ss::insert_many_vectorials)
        .method("get",    &hashmap_ss::get);
    Rcpp::class_< hashmap_si >( "hashmap_si" )
        .constructor()
        .method("keys",   &hashmap_si::keys)
        .method("values", &hashmap_si::values)
        .method("head",   &hashmap_si::head)
        .method("size",   &hashmap_si::size)
        .method("insert_many", &hashmap_si::insert_many)
        .method("insert_vectorial", &hashmap_si::insert_vectorial)
        .method("insert_many_vectorials", &hashmap_si::insert_many_vectorials)
        .method("get",    &hashmap_si::get);
    Rcpp::class_< hashmap_sb >( "hashmap_sb" )
        .constructor()
        .method("keys",   &hashmap_sb::keys)
        .method("values", &hashmap_sb::values)
        .method("head",   &hashmap_sb::head)
        .method("size",   &hashmap_sb::size)
        .method("insert_many", &hashmap_sb::insert_many)
        .method("insert_vectorial", &hashmap_sb::insert_vectorial)
        .method("insert_many_vectorials", &hashmap_sb::insert_many_vectorials)
        .method("get",    &hashmap_sb::get);
    Rcpp::class_< hashmap_sd >( "hashmap_sd" )
        .constructor()
        .method("keys",   &hashmap_sd::keys)
        .method("values", &hashmap_sd::values)
        .method("head",   &hashmap_sd::head)
        .method("size",   &hashmap_sd::size)
        .method("insert_many", &hashmap_sd::insert_many)
        .method("insert_vectorial", &hashmap_sd::insert_vectorial)
        .method("insert_many_vectorials", &hashmap_sd::insert_many_vectorials)
        .method("get",    &hashmap_sd::get);

    Rcpp::class_< hashmap_ds >( "hashmap_ds" )
        .constructor()
        .method("keys",   &hashmap_ds::keys)
        .method("values", &hashmap_ds::values)
        .method("head",   &hashmap_ds::head)
        .method("size",   &hashmap_ds::size)
        .method("insert_many", &hashmap_ds::insert_many)
        .method("insert_vectorial", &hashmap_ds::insert_vectorial)
        .method("insert_many_vectorials", &hashmap_ds::insert_many_vectorials)
        .method("get",    &hashmap_ds::get);
    Rcpp::class_< hashmap_dd >( "hashmap_dd" )
        .constructor()
        .method("keys",   &hashmap_dd::keys)
        .method("values", &hashmap_dd::values)
        .method("head",   &hashmap_dd::head)
        .method("size",   &hashmap_dd::size)
        .method("insert_many", &hashmap_dd::insert_many)
        .method("insert_vectorial", &hashmap_dd::insert_vectorial)
        .method("insert_many_vectorials", &hashmap_dd::insert_many_vectorials)
        .method("get",    &hashmap_dd::get);
    Rcpp::class_< hashmap_di >( "hashmap_di" )
        .constructor()
        .method("keys",   &hashmap_di::keys)
        .method("values", &hashmap_di::values)
        .method("head",   &hashmap_di::head)
        .method("size",   &hashmap_di::size)
        .method("insert_many", &hashmap_di::insert_many)
        .method("insert_vectorial", &hashmap_di::insert_vectorial)
        .method("insert_many_vectorials", &hashmap_di::insert_many_vectorials)
        .method("get",    &hashmap_di::get);
    Rcpp::class_< hashmap_db >( "hashmap_db" )
        .constructor()
        .method("keys",   &hashmap_db::keys)
        .method("values", &hashmap_db::values)
        .method("head",   &hashmap_db::head)
        .method("size",   &hashmap_db::size)
        .method("insert_many", &hashmap_db::insert_many)
        .method("insert_vectorial", &hashmap_db::insert_vectorial)
        .method("insert_many_vectorials", &hashmap_db::insert_many_vectorials)
        .method("get",    &hashmap_db::get);

    Rcpp::class_< hashmap_is >( "hashmap_is" )
        .constructor()
        .method("keys",   &hashmap_is::keys)
        .method("values", &hashmap_is::values)
        .method("head",   &hashmap_is::head)
        .method("size",   &hashmap_is::size)
        .method("insert_many", &hashmap_is::insert_many)
        .method("insert_vectorial", &hashmap_is::insert_vectorial)
        .method("insert_many_vectorials", &hashmap_is::insert_many_vectorials)
        .method("get",    &hashmap_is::get);
    Rcpp::class_< hashmap_id >( "hashmap_id" )
        .constructor()
        .method("keys",   &hashmap_id::keys)
        .method("values", &hashmap_id::values)
        .method("head",   &hashmap_id::head)
        .method("size",   &hashmap_id::size)
        .method("insert_many", &hashmap_id::insert_many)
        .method("insert_vectorial", &hashmap_id::insert_vectorial)
        .method("insert_many_vectorials", &hashmap_id::insert_many_vectorials)
        .method("get",    &hashmap_id::get);
    Rcpp::class_< hashmap_ib >( "hashmap_ib" )
        .constructor()
        .method("keys",   &hashmap_ib::keys)
        .method("values", &hashmap_ib::values)
        .method("head",   &hashmap_ib::head)
        .method("size",   &hashmap_ib::size)
        .method("insert_many", &hashmap_ib::insert_many)
        .method("insert_vectorial", &hashmap_ib::insert_vectorial)
        .method("insert_many_vectorials", &hashmap_ib::insert_many_vectorials)
        .method("get",    &hashmap_ib::get);
    Rcpp::class_< hashmap_ii >( "hashmap_ii" )
        .constructor()
        .method("keys",   &hashmap_ii::keys)
        .method("values", &hashmap_ii::values)
        .method("head",   &hashmap_ii::head)
        .method("size",   &hashmap_ii::size)
        .method("insert_many", &hashmap_ii::insert_many)
        .method("insert_vectorial", &hashmap_ii::insert_vectorial)
        .method("insert_many_vectorials", &hashmap_ii::insert_many_vectorials)
        .method("get",    &hashmap_ii::get);
}
