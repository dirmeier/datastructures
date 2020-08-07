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


#ifndef DS_MAP
#define DS_MAP

#include <Rcpp.h>
#include <vector>
#include <algorithm>
#include <string>
#include <unordered_map>


namespace datastructures
{
    template<template<typename...> class H, typename T>
    class map
    {
    public:
        map() = default;

        size_t size()
        {
            return map_.size();
        }

        void insert(std::vector<T>& t, Rcpp::RObject u)
        {
            if(!Rf_isNewList(u))
            {
                Rcpp::stop(
                    "Rcpp::RObject needs to be a NewList\n");
            }

            const unsigned int sexp_size = static_cast<unsigned int>(Rf_length(u));
            if (t.size() != sexp_size)
            {
                Rcpp::stop("keys.size() != values.size()");
            }
            for (typename std::vector<T>::size_type i = 0; i < t.size(); ++i)
            {
                Rcpp::RObject s = Rf_duplicate(VECTOR_ELT(u, i));
                map_.insert(std::pair<T, Rcpp::RObject>(t[i], s));
            }
        }

        void clear()
        {
            for (auto it = map_.begin(); it != map_.end(); ++it)
                R_ReleaseObject(it->second);
            map_.clear();
        }

        void remove_with_value(std::vector<T>& t, Rcpp::RObject u)
        {
            for (typename std::vector<T>::size_type i = 0; i < t.size(); ++i)
            {
                auto iter = map_.equal_range(t[i]);
                for (auto it = iter.first; it != iter.second; ++it)
                {
                    if (R_compute_identical(VECTOR_ELT(u, i), it->second, 0))
                    {
                        map_.erase(it);
                        break;
                    }
                }
            }
        }

        void remove(std::vector<T>& t)
        {
            for (typename std::vector<T>::size_type i = 0; i < t.size(); ++i)
                map_.erase(t[i]);
        }

        bool is_empty()
        {
            return map_.empty();
        }

        std::vector<T> keys()
        {
            std::vector<T> keys;
            keys.reserve(map_.size());
            for (const auto& pair : map_)
            {
                keys.push_back(pair.first);
            }

            return keys;
        }

        Rcpp::List values()
        {
            std::vector< Rcpp::RObject > values;
            values.reserve(map_.size());

            int prt = 0;
            for (const auto& pair : map_)
            {
                Rcpp::RObject s = PROTECT(pair.second);
                values.push_back(s);
                ++prt;
            }
            UNPROTECT(prt);

            return Rcpp::wrap(values);
        }

        Rcpp::List head()
        {
            unsigned int i = 0;
            std::map<T, Rcpp::RObject> heads;
            for (const auto& pair : map_)
            {
                if (i++ == 5) break;
                heads.insert(pair);
            }

            return Rcpp::wrap(heads);
        }

        Rcpp::List get(std::vector<T>& t)
        {
            std::vector< Rcpp::RObject > values;
            int prt = 0;

            for (typename std::vector<T>::size_type i = 0; i < t.size(); ++i)
            {
                T key = t[i];
                if (map_.find(key) != map_.end())
                {
                    auto range = map_.equal_range(key);
                    for (auto it = range.first; it != range.second; ++it)
                    {
                        Rcpp::RObject s = PROTECT(it->second);
                        ++prt;
                        values.push_back(s);
                    }
                }
                else
                {
                    std::ostringstream ss;
                    ss << key;
                    UNPROTECT(prt);
                    Rcpp::stop(
                        std::string("Could not find key: ").append(ss.str()));
                }
            }
            UNPROTECT(prt);

            return Rcpp::wrap(values);
        }

    private:
        H<T, Rcpp::RObject> map_;
    };
}
#endif
