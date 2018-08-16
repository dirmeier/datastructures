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

#ifndef DS_HEAP
#define DS_HEAP

#include <Rcpp.h>
#include <vector>
#include <string>
#include <sstream>
#include <map>
#include <unordered_map>
#include <algorithm>

using ul = std::string;

template<template<typename...> class H, typename T>
struct node
{
    typename H<node<H, T>>::handle_type handle_;
    T key_;
    Rcpp::RObject value_;
    ul id_;

    node(T key, Rcpp::RObject value, ul id): key_(key), value_(value), id_(id)
    {}

    bool operator<(const node<H, T>& rhs) const
    {
        return key_ > rhs.key_;
    }
};

template<template<typename...> class H, typename T>
class heap
{
public:
    heap() = default;

    void insert(std::vector<T>& t, Rcpp::RObject u)
    {
        if(!Rf_isNewList(u))
        {
            Rcpp::stop("Rcpp::RObject needs to be a NewList\n");
        }

        const int size = static_cast<int>(Rf_length(u));
        if (t.size() != size)
        {
            Rcpp::stop("keys.size() != values.size()");
        }

        for (typename std::vector<T>::size_type i = 0; i < t.size(); ++i)
        {
            std::stringstream ss;
            ss << "handle-" << unid_++;
            std::string id = ss.str();

            Rcpp::RObject s = Rf_duplicate(VECTOR_ELT(u, i));

            typename H<node<H, T>>::handle_type h =
                heap_.push(node<H, T>(t[i], s, id));
            (*h).handle_ = h;

            id_to_handles_.insert(
              std::pair<ul, typename H<node<H, T>>::handle_type>(id, h));
            key_to_id_.insert(std::pair<T, ul>(t[i], id));
        }
    }

    Rcpp::List handles(std::vector<T>& keys)
    {
        std::map<ul, Rcpp::RObject> ret;
        int prt = 0;
        for (typename std::vector<T>::size_type i = 0; i < keys.size(); ++i)
        {
            T key = keys[i];
            if (key_to_id_.find(key) != key_to_id_.end())
            {
                auto iterpair = key_to_id_.equal_range(key);
                for (auto it = iterpair.first; it != iterpair.second; ++it)
                {
                    ul id = it->second;
                    if (id_to_handles_.find(id) != id_to_handles_.end())
                    {
                        Rcpp::RObject s = PROTECT((*id_to_handles_[id]).value_);
                        ++prt;
                        ret.insert(std::pair<ul, Rcpp::RObject>(id, s));
                    }
                }
            }
        }
        UNPROTECT(prt);

        return Rcpp::wrap(ret);
    }


    Rcpp::List handles_value(Rcpp::RObject values)
    {
        if(!Rf_isNewList(values))
        {
            Rcpp::stop("Rcpp::RObject needs to be a NewList\n");
        }
        const int size = static_cast<int>(Rf_length(values));

        std::map<ul, T> ret;
        int prt = 0;
        for (int i = 0; i < size; ++i)
        {
            Rcpp::RObject value = PROTECT(VECTOR_ELT(values, i));
            ++prt;
            for (auto it = id_to_handles_.begin();
                 it != id_to_handles_.end(); ++it)
            {
                Rcpp::RObject s = PROTECT((*it->second).value_);
                ++prt;
                if (R_compute_identical(value, s, 0))
                    ret.insert(std::pair<ul, T>(it->first, (*(it->second)).key_));
            }
        }
        UNPROTECT(prt);

        return Rcpp::wrap(ret);
    }

    Rcpp::List values()
    {
        std::multimap<T, Rcpp::RObject> ret;
        int prt = 0;
        for (auto it = id_to_handles_.begin();
             it != id_to_handles_.end();
             ++it)
        {
            Rcpp::RObject el = PROTECT(Rf_allocVector(VECSXP, 3));
            Rcpp::RObject names = PROTECT(Rf_allocVector(STRSXP, 3));
            Rcpp::RObject s = PROTECT((*(it->second)).value_);
            prt += 3;

            SET_STRING_ELT(names, 0, Rf_mkChar("handle"));
            SET_STRING_ELT(names, 1, Rf_mkChar("key"));
            SET_STRING_ELT(names, 2, Rf_mkChar("value"));
            Rf_setAttrib(el, R_NamesSymbol, names);
            SET_VECTOR_ELT(el, 0, Rcpp::wrap(it->first));
            SET_VECTOR_ELT(el, 1, Rcpp::wrap((*(it->second)).key_));
            SET_VECTOR_ELT(el, 2, s);

            ret.insert(std::pair<T, Rcpp::RObject>((*(it->second)).key_, el));

        }
        UNPROTECT(prt);

        return Rcpp::wrap(ret);
    }

    void decrease_key(std::vector<T> from,
                      std::vector<T> to,
                      std::vector<ul> id)
    {
        if (from.size() != to.size() || to.size() != id.size())
        {
            Rcpp::stop(std::string("all vectors need to have same size."));
        }

        for (typename std::vector<T>::size_type i = 0; i < from.size(); ++i)
        {
            if (to[i] >= from[i])
            {
                Rcpp::stop(std::string("'to' key is not smaller than 'from'"));
            }
            if (key_to_id_.find(from[i]) == key_to_id_.end())
            {
                Rcpp::stop(std::string("'from' key not found"));
            }
            if (id_to_handles_.find(id[i]) == id_to_handles_.end())
            {
                Rcpp::stop(std::string("'id' key not found."));
            }

            bool has_id = false;
            auto iterpair = key_to_id_.equal_range(from[i]);
            for (auto it = iterpair.first; it != iterpair.second; ++it)
            {
                if (it->second == id[i]) has_id = true;
            }
            if (!has_id)
                Rcpp::stop(std::string("'from' does not fit value 'id'"));

            decrease_key_(to[i], from[i], id[i]);
        }
    }

    void clear()
    {
        heap_.clear();
        key_to_id_.clear();
        id_to_handles_.clear();
        unid_ = 0;
    }

    size_t size()
    {
        return heap_.size();
    }

    bool is_empty()
    {
        return heap_.empty();
    }

    Rcpp::List pop()
    {
        node<H, T> n = heap_.top();
        heap_.pop();

        std::map<T, Rcpp::RObject > heads;
        Rcpp::RObject s = PROTECT(n.value_);
        heads.insert(std::pair<T, Rcpp::RObject>(n.key_, s));

        drop_from_key_map_(n.key_, n.id_);
        drop_from_id_map_(n.id_);
        UNPROTECT(1);
        return Rcpp::wrap(heads);
    }

    Rcpp::List peek()
    {
        node<H, T> n = heap_.top();
        std::map<T, Rcpp::RObject > heads;
        Rcpp::RObject s = PROTECT(n.value_);
        heads.insert(std::pair<T, Rcpp::RObject>(n.key_, s));
        UNPROTECT(1);

        return Rcpp::wrap(heads);
    }

private:
    void decrease_key_(T to, T from, ul id)
    {
        drop_from_key_map_(from, id);
        decrease_(to, id);
        key_to_id_.insert(std::pair<T, ul>(to, id));
    }

    void drop_from_key_map_(T from, ul id)
    {
        auto iterpair = key_to_id_.equal_range(from);
        for (auto it = iterpair.first; it != iterpair.second; ++it)
        {
            if (it->second == id)
            {
                key_to_id_.erase(it);
                break;
            }
        }
    }

    void drop_from_id_map_(ul id)
    {
        if (id_to_handles_.find(id) != id_to_handles_.end())
        {
            id_to_handles_.erase(id);
        }
    }

    void decrease_(T to, ul id)
    {
        (*id_to_handles_[id]).key_ = to;
        heap_.decrease(id_to_handles_[id]);
        heap_.update(id_to_handles_[id]);
    }

    Rcpp::RObject obj_;
    H<node<H, T>> heap_;
    std::unordered_multimap<T, ul> key_to_id_;
    std::unordered_map<
      ul, typename H<node<H, T>>::handle_type> id_to_handles_;
    unsigned long unid_ = 0;

};

#endif
