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
#include <map>


using namespace Rcpp;

//' @export hashmap
template <typename T, typename V>
class hashmap
{
public:
    hashmap() : map_<T, V>() {}

    void insert(Rcpp::CharacterVector key, double value)
    {
        std::string fname = Rcpp::as<std::string>(key);
        map_.insert(std::pair<std::string, double>(fname, value));
    }

    double get(Rcpp::CharacterVector key)
    {
        std::string fname = Rcpp::as<std::string>(key);
        return map_[fname];
    }

    std::string gets()
    {
        return "hallo";
    }

private:
    std::map< T, V > map_;

};

RCPP_MODULE(hashmap_module) {
    class_<hashmap>( "hashmap" )
    .constructor<SEXP, SEXP>()
    .method( "insert", &hashmap::insert )
    .method( "gets", &hashmap::gets )
    .method( "get", &hashmap::get )
    ;
}
