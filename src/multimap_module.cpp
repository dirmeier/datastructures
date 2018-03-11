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
    Rcpp::class_< multimap_ss >( "multimap_ss" )
        .constructor()
        .method("keys",   &multimap_ss::keys)
        .method("values", &multimap_ss::values)
        .method("head",   &multimap_ss::head)
        .method("size",   &multimap_ss::size)
        .method("insert", &multimap_ss::insert)
        .method("get",    &multimap_ss::get);
    Rcpp::class_< multimap_si >( "multimap_si" )
        .constructor()
        .method("keys",   &multimap_si::keys)
        .method("values", &multimap_si::values)
        .method("head",   &multimap_si::head)
        .method("size",   &multimap_si::size)
        .method("insert", &multimap_si::insert)
        .method("get",    &multimap_si::get);
    Rcpp::class_< multimap_sb >( "multimap_sb" )
        .constructor()
        .method("keys",   &multimap_sb::keys)
        .method("values", &multimap_sb::values)
        .method("head",   &multimap_sb::head)
        .method("size",   &multimap_sb::size)
        .method("insert", &multimap_sb::insert)
        .method("get",    &multimap_sb::get);
    Rcpp::class_< multimap_sd >( "multimap_sd" )
        .constructor()
        .method("keys",   &multimap_sd::keys)
        .method("values", &multimap_sd::values)
        .method("head",   &multimap_sd::head)
        .method("size",   &multimap_sd::size)
        .method("insert", &multimap_sd::insert)
        .method("get",    &multimap_sd::get);

    Rcpp::class_< multimap_ds >( "multimap_ds" )
        .constructor()
        .method("keys",   &multimap_ds::keys)
        .method("values", &multimap_ds::values)
        .method("head",   &multimap_ds::head)
        .method("size",   &multimap_ds::size)
        .method("insert", &multimap_ds::insert)
        .method("get",    &multimap_ds::get);
    Rcpp::class_< multimap_dd >( "multimap_dd" )
        .constructor()
        .method("keys",   &multimap_dd::keys)
        .method("values", &multimap_dd::values)
        .method("head",   &multimap_dd::head)
        .method("size",   &multimap_dd::size)
        .method("insert", &multimap_dd::insert)
        .method("get",    &multimap_dd::get);
    Rcpp::class_< multimap_di >( "multimap_di" )
        .constructor()
        .method("keys",   &multimap_di::keys)
        .method("values", &multimap_di::values)
        .method("head",   &multimap_di::head)
        .method("size",   &multimap_di::size)
        .method("insert", &multimap_di::insert)
        .method("get",    &multimap_di::get);
    Rcpp::class_< multimap_db >( "multimap_db" )
        .constructor()
        .method("keys",   &multimap_db::keys)
        .method("values", &multimap_db::values)
        .method("head",   &multimap_db::head)
        .method("size",   &multimap_db::size)
        .method("insert", &multimap_db::insert)
        .method("get",    &multimap_db::get);
    Rcpp::class_< multimap_is >( "multimap_is" )
        .constructor()
        .method("keys",   &multimap_is::keys)
        .method("values", &multimap_is::values)
        .method("head",   &multimap_is::head)
        .method("size",   &multimap_is::size)
        .method("insert", &multimap_is::insert)
        .method("get",    &multimap_is::get);
    Rcpp::class_< multimap_id >( "multimap_id" )
        .constructor()
        .method("keys",   &multimap_id::keys)
        .method("values", &multimap_id::values)
        .method("head",   &multimap_id::head)
        .method("size",   &multimap_id::size)
        .method("insert", &multimap_id::insert)
        .method("get",    &multimap_id::get);
    Rcpp::class_< multimap_ib >( "multimap_ib" )
        .constructor()
        .method("keys",   &multimap_ib::keys)
        .method("values", &multimap_ib::values)
        .method("head",   &multimap_ib::head)
        .method("size",   &multimap_ib::size)
        .method("insert", &multimap_ib::insert)
        .method("get",    &multimap_ib::get);
    Rcpp::class_< multimap_ii >( "multimap_ii" )
        .constructor()
        .method("keys",   &multimap_ii::keys)
        .method("values", &multimap_ii::values)
        .method("head",   &multimap_ii::head)
        .method("size",   &multimap_ii::size)
        .method("insert", &multimap_ii::insert)
        .method("get",    &multimap_ii::get);
}
