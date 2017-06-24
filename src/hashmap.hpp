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

#ifndef DS_HASHMAP
#define DS_HASHMAP

#include <Rcpp.h>
#include <vector>
#include <string>
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

    void insert(std::vector<T> t, std::vector<U> u)
    {
        if (t.size() != u.size())
        {
            Rcpp::stop("keys.size() != values.size()");
        }
        for (typename std::vector<T>::size_type i = 0; i < t.size(); ++i)
        {
            map_.insert(std::pair<T, U>(t[i], u[i]));
        }
    }

    std::vector<U> get(std::vector<T> t)
    {
        std::vector<U> values(t.size());
        for (typename std::vector<T>::size_type i = 0; i < t.size(); ++i)
        {
            T key = t[i];
            if (map_.find(key) != map_.end())
            {
                values[i] =  map_[key];
            }
            else
            {
                std::stringstream ss;
                ss << key;
                Rcpp::stop(std::string("Could not find key: ").append(ss.str()));
            }
        }
        return values;
    }


private:
    std::unordered_map<T, U> map_;
};

typedef hashmap<std::string, std::string> hashmap_ss;
typedef hashmap<std::string, int>         hashmap_si;
typedef hashmap<std::string, bool>        hashmap_sb;
typedef hashmap<std::string, double>      hashmap_sd;

typedef hashmap<double, std::string>  hashmap_ds;
typedef hashmap<double, int>          hashmap_di;
typedef hashmap<double, bool>         hashmap_db;
typedef hashmap<double, double>       hashmap_dd;

typedef hashmap<int, std::string>  hashmap_is;
typedef hashmap<int, int>          hashmap_ii;
typedef hashmap<int, bool>         hashmap_ib;
typedef hashmap<int, double>       hashmap_id;

#endif
