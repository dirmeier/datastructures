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

#include <unordered_map>
#include <boost/variant.hpp>
#include <boost/shared_ptr.hpp>
#include <boost/make_shared.hpp>

typedef boost::variant<
    boost::shared_ptr<std::unordered_map<std::string, int>>,
    boost::shared_ptr<std::unordered_map<std::string, double>>
> variants;


class hashmap
{
public:
    hashmap(SEXP x, SEXP y)
    {
        map_ = boost::make_shared<std::unordered_map<std::string, int>>(
            "std::string, int", 1
        );
    }
private:
    variants map_;
};

RCPP_MODULE(hashmap_module) {
    using namespace Rcpp;
    class_< hashmap >( "hashmap" )
    .constructor<SEXP, SEXP>();
}


