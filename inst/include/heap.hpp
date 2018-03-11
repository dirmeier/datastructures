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
#include <map>
#include <unordered_map>
#include <algorithm>
#include <boost/uuid/uuid.hpp>
#include <boost/uuid/uuid_generators.hpp>
#include <boost/uuid/uuid_io.hpp>
#include <boost/lexical_cast.hpp>

using ul = std::string;

template<template<typename...> class H, typename T, typename U>
struct node
{
    typename H<node<H, T, U>>::handle_type handle_;
    T key_;
    std::vector<U> value_;
    ul id_;

    node(T key, std::vector<U> value, ul id): key_(key), value_(value),
                                              id_(id)
    {}

    bool operator<(const node<H, T, U>& rhs) const
    {
        return key_ > rhs.key_;
    }
};

template<template<typename...> class H, typename T, typename U>
class heap
{
public:
    heap() = default;

    void insert(std::vector<T>& t, std::vector<std::vector<U> >& u)
    {
        if (t.size() != u.size())
        {
            Rcpp::stop("keys.size() != values.size()");
        }
        for (typename std::vector<T>::size_type i = 0; i < t.size(); ++i)
        {
            std::string id_ = boost::lexical_cast<ul>(generator_());
            typename H<node<H, T, U>>::handle_type h =
              heap_.push(node<H, T, U>(t[i], u[i], id_));
            (*h).handle_ = h;

            id_to_handles_.insert(
              std::pair<ul, typename H<node<H, T, U>>::handle_type>(id_, h));
            key_to_id_.insert(std::pair<T, ul>(t[i], id_));
        }
    }

    Rcpp::List handles(T& from)
    {
        std::map<ul, std::vector<U>> ret;
        if (key_to_id_.find(from) != key_to_id_.end())
        {
            auto iterpair = key_to_id_.equal_range(from);
            for (auto it = iterpair.first; it != iterpair.second; ++it)
            {
                ul id = it->second;
                if (id_to_handles_.find(id) != id_to_handles_.end())
                {
                    ret.insert(std::pair<ul, std::vector<U>>(
                      id, (*id_to_handles_[id]).value_));
                }
            }
        }

        return Rcpp::wrap(ret);
    }

    Rcpp::List handles_value(std::vector<U>& from)
    {
        std::map<ul, T> ret;
        for (auto it = id_to_handles_.begin();
             it != id_to_handles_.end(); ++it)
        {
            if (from == (*it->second).value_)
                ret.insert(std::pair<ul, T>(it->first, (*(it->second)).key_));
        }

        return Rcpp::wrap(ret);
    }

    std::vector<std::vector<U>> values()
    {
        std::vector<std::vector<U>> ret;
        ret.reserve(id_to_handles_.size());
        for (auto it = id_to_handles_.begin();
             it != id_to_handles_.end();
             ++it)
        {
            ret.push_back((*(it->second)).value_);
        }

        return ret;
    }

    void decrease_key(std::vector<T>& from, std::vector<T>& to,
                      std::vector<ul>& id)
    {
        if (from.size() != to.size() || to.size() != id.size())
        {
            Rcpp::stop(std::string("all vectors need to have same size."));
        }
        for (typename std::vector<T>::size_type i = 0; i < from.size(); ++i)
        {
            if (to[i] >= from[i])
            {
                Rcpp::stop(
                  std::string("'to' key is not smaller than 'from'"));
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
                Rcpp::stop(std::string("'from' does not fit  value 'id'"));

            decrease_key_(to[i], from[i], id[i]);
        }
    }

    void clear()
    {
        heap_.clear();
        key_to_id_.clear();
        id_to_handles_.clear();
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
        node<H, T, U> n = heap_.top();
        heap_.pop();

        std::map<T, std::vector<U> > heads;
        heads.insert(std::pair<T, std::vector<U>>(n.key_, n.value_));

        drop_from_key_map_(n.key_, n.id_);
        drop_from_id_map_(n.id_);

        return Rcpp::wrap(heads);
    }

    Rcpp::List peek()
    {
        node<H, T, U> n = heap_.top();

        std::map<T, std::vector<U> > heads;
        heads.insert(std::pair<T, std::vector<U>>(n.key_, n.value_));

        return Rcpp::wrap(heads);
    }

private:
    void decrease_key_(T& to, T& from, ul id)
    {
        drop_from_key_map_(from, id);
        decrease_(to, id);
        key_to_id_.insert(std::pair<T, ul>(to, id));
    }

    void drop_from_key_map_(T& from, ul id)
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

    void decrease_(T& to, ul id)
    {
        (*id_to_handles_[id]).key_ = to;
        heap_.decrease(id_to_handles_[id]);
        heap_.update(id_to_handles_[id]);
    }

    H<node<H, T, U>> heap_;
    std::unordered_multimap<T, ul> key_to_id_;
    std::unordered_map<
      ul, typename H<node<H, T, U>>::handle_type> id_to_handles_;
    boost::uuids::random_generator generator_;
};

#endif
