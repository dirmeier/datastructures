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
#include "bimap.hpp"

RCPP_MODULE(bimap_module) {
    Rcpp::class_< bimap_ss >( "bimap_ss" )
        .constructor()
        .method("lefts",     &bimap_ss::lefts)
        .method("rights",    &bimap_ss::rights)
        .method("clear",     &bimap_ss::clear)
        .method("remove",    &bimap_ss::remove)
        .method("remove_value", &bimap_ss::remove_value)
        .method("head",      &bimap_ss::head)
        .method("size",      &bimap_ss::size)
        .method("insert",    &bimap_ss::insert)
        .method("get_left",  &bimap_ss::get_left)
        .method("get_right", &bimap_ss::get_right);
    Rcpp::class_< bimap_si >( "bimap_si" )
        .constructor()
        .method("lefts",     &bimap_si::lefts)
        .method("rights",    &bimap_si::rights)
        .method("clear",     &bimap_si::clear)
        .method("remove",    &bimap_si::remove)
        .method("remove_value", &bimap_si::remove_value)
        .method("head",      &bimap_si::head)
        .method("size",      &bimap_si::size)
        .method("insert",    &bimap_si::insert)
        .method("get_left",  &bimap_si::get_left)
        .method("get_right", &bimap_si::get_right);
    Rcpp::class_< bimap_sd >( "bimap_sd" )
        .constructor()
        .method("lefts",     &bimap_sd::lefts)
        .method("rights",    &bimap_sd::rights)
        .method("clear",  &bimap_sd::clear)
        .method("remove", &bimap_sd::remove)
        .method("remove_value", &bimap_sd::remove_value)
        .method("head",      &bimap_sd::head)
        .method("size",      &bimap_sd::size)
        .method("insert",    &bimap_sd::insert)
        .method("get_left",  &bimap_sd::get_left)
        .method("get_right", &bimap_sd::get_right);
    Rcpp::class_< bimap_sb >( "bimap_sb" )
        .constructor()
        .method("lefts",     &bimap_sb::lefts)
        .method("rights",    &bimap_sb::rights)
        .method("clear",     &bimap_sb::clear)
        .method("remove",    &bimap_sb::remove)
        .method("remove_value", &bimap_sb::remove_value)
        .method("head",      &bimap_sb::head)
        .method("size",      &bimap_sb::size)
        .method("insert",    &bimap_sb::insert)
        .method("get_left",  &bimap_sb::get_left)
        .method("get_right", &bimap_sb::get_right);

    Rcpp::class_< bimap_ds >( "bimap_ds" )
        .constructor()
        .method("lefts",     &bimap_ds::lefts)
        .method("rights",    &bimap_ds::rights)
        .method("clear",     &bimap_ds::clear)
        .method("remove",    &bimap_ds::remove)
        .method("remove_value", &bimap_ds::remove_value)
        .method("head",      &bimap_ds::head)
        .method("size",      &bimap_ds::size)
        .method("insert",    &bimap_ds::insert)
        .method("get_left",  &bimap_ds::get_left)
        .method("get_right", &bimap_ds::get_right);
    Rcpp::class_< bimap_dd >( "bimap_dd" )
        .constructor()
        .method("lefts",     &bimap_dd::lefts)
        .method("rights",    &bimap_dd::rights)
        .method("clear",     &bimap_dd::clear)
        .method("remove",    &bimap_dd::remove)
        .method("remove_value", &bimap_dd::remove_value)
        .method("head",      &bimap_dd::head)
        .method("size",      &bimap_dd::size)
        .method("insert",    &bimap_dd::insert)
        .method("get_left",  &bimap_dd::get_left)
        .method("get_right", &bimap_dd::get_right);
    Rcpp::class_< bimap_di >( "bimap_di" )
        .constructor()
        .method("lefts",     &bimap_di::lefts)
        .method("rights",    &bimap_di::rights)
        .method("clear",     &bimap_di::clear)
        .method("remove",    &bimap_di::remove)
        .method("remove_value", &bimap_di::remove_value)
        .method("head",      &bimap_di::head)
        .method("size",      &bimap_di::size)
        .method("insert",    &bimap_di::insert)
        .method("get_left",  &bimap_di::get_left)
        .method("get_right", &bimap_di::get_right);
    Rcpp::class_< bimap_db >( "bimap_db" )
        .constructor()
        .method("lefts",     &bimap_db::lefts)
        .method("rights",    &bimap_db::rights)
        .method("clear",  &bimap_db::clear)
        .method("remove", &bimap_db::remove)
        .method("remove_value", &bimap_db::remove_value)
        .method("head",      &bimap_db::head)
        .method("size",      &bimap_db::size)
        .method("insert",    &bimap_db::insert)
        .method("get_left",  &bimap_db::get_left)
        .method("get_right", &bimap_db::get_right);

    Rcpp::class_< bimap_is >( "bimap_is" )
        .constructor()
        .method("lefts",     &bimap_is::lefts)
        .method("rights",    &bimap_is::rights)
        .method("clear",     &bimap_is::clear)
        .method("remove",    &bimap_is::remove)
        .method("remove_value", &bimap_is::remove_value)
        .method("head",      &bimap_is::head)
        .method("size",      &bimap_is::size)
        .method("insert",    &bimap_is::insert)
        .method("get_left",  &bimap_is::get_left)
        .method("get_right", &bimap_is::get_right);
    Rcpp::class_< bimap_id >( "bimap_id" )
        .constructor()
        .method("lefts",     &bimap_id::lefts)
        .method("rights",    &bimap_id::rights)
        .method("clear",     &bimap_id::clear)
        .method("remove",    &bimap_id::remove)
        .method("remove_value", &bimap_id::remove_value)
        .method("head",      &bimap_id::head)
        .method("size",      &bimap_id::size)
        .method("insert",    &bimap_id::insert)
        .method("get_left",  &bimap_id::get_left)
        .method("get_right", &bimap_id::get_right);
    Rcpp::class_< bimap_ii >( "bimap_ii" )
        .constructor()
        .method("lefts",     &bimap_ii::lefts)
        .method("rights",    &bimap_ii::rights)
        .method("clear",     &bimap_ii::clear)
        .method("remove",    &bimap_ii::remove)
        .method("remove_value", &bimap_ii::remove_value)
        .method("head",      &bimap_ii::head)
        .method("size",      &bimap_ii::size)
        .method("insert",    &bimap_ii::insert)
        .method("get_left",  &bimap_ii::get_left)
        .method("get_right", &bimap_ii::get_right);
    Rcpp::class_< bimap_ib >( "bimap_ib" )
        .constructor()
        .method("lefts",     &bimap_ib::lefts)
        .method("rights",    &bimap_ib::rights)
        .method("clear",     &bimap_ib::clear)
        .method("remove",    &bimap_ib::remove)
        .method("remove_value", &bimap_ib::remove_value)
        .method("head",      &bimap_ib::head)
        .method("size",      &bimap_ib::size)
        .method("insert",    &bimap_ib::insert)
        .method("get_left",  &bimap_ib::get_left)
        .method("get_right", &bimap_ib::get_right);
}
