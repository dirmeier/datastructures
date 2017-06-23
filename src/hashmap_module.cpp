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

template <typename T, typename U>
class hashmap
{
public:
    hashmap(): map_()
    {}

    size_t size()
    {
        return map_.size();
    }

    void insert(T t, U u)
    {
        map_.insert(std::pair<T, U>(t, u));
    }

    U get(T t)
    {
        return map_[t];
    }

private:
    std::unordered_map<T, U> map_;
};

typedef hashmap<std::string, int>    hashmap_si;
typedef hashmap<std::string, double> hashmap_sd;

RCPP_MODULE(hashmap_module) {
    using namespace Rcpp;
    class_< hashmap_si >( "hashmap_si" )
        .constructor()
        .method("size", &hashmap_si::size)
        .method( "[<-", &hashmap_si::insert)
        .method( "[",   &hashmap_si::get);

    class_< hashmap_sd >( "hashmap_sd" )
        .constructor()
        .method("size", &hashmap_sd::size)
        .method( "[<-", &hashmap_sd::insert)
        .method( "[",   &hashmap_sd::get);
}
