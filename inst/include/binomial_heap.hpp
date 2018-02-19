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


#ifndef DS_BINOMIALHEAP
#define DS_BINOMIALHEAP


#include <Rcpp.h>
#include <vector>
#include <string>
#include <map>
#include <unordered_map>
#include <boost/heap/binomial_heap.hpp>
#include <boost/uuid/uuid.hpp>
#include <boost/uuid/uuid_generators.hpp>
#include <boost/uuid/uuid_io.hpp>
#include <boost/lexical_cast.hpp>


using ul = std::string;

template <typename T, typename U>
struct binomial_node
{
    typename boost::heap::binomial_heap<binomial_node<T, U>>::handle_type handle;
    T key_;
    std::vector<U> value_;
    ul id_;

    binomial_node(T key, std::vector<U> value, ul id) :
        key_(key), value_(value), id_(id)
    {}

    bool operator<( const binomial_node<T, U>& rhs) const
    {
        return key_ > rhs.key_;
    }
};


template <typename T, typename U>
using Heap = boost::heap::binomial_heap<binomial_node<T, U>>;


template <typename T, typename U>
class binomial_heap
{
public:
    binomial_heap(): heap_(), key_to_id_(), id_to_handles_(), generator_()
    {}

    void insert(std::vector<T>& t, std::vector< std::vector<U> >& u)
    {
        if (t.size() != u.size())
        {
            Rcpp::stop("keys.size() != values.size()");
        }
        for (typename std::vector<T>::size_type i = 0; i < t.size(); ++i)
        {
            std::string id_ = boost::lexical_cast<ul>(generator_());
            typename Heap<T, U>::handle_type h =
                heap_.push(binomial_node<T, U>(t[i], u[i], id_));
            (*h).handle = h;

            id_to_handles_.insert(std::pair<ul, typename Heap<T, U>::handle_type>(id_, h));
            key_to_id_.insert(std::pair<T, ul>(t[i], id_));
        }
    }

    Rcpp::List handles(T from)
    {
        std::map<ul, std::vector<U>> ret;
        if (key_to_id_.find(from) != key_to_id_.end())
        {
            auto iterpair = key_to_id_.equal_range(from);
            for (auto it = iterpair.first; it != iterpair.second; ++it)
            {
                ul id = it->second;
                ret.insert(std::pair<ul, std::vector<U>>(
                  id, (*id_to_handles_[id]).value_));
            }
        }

        return Rcpp::wrap(ret);
    }

    void decrease_key(std::vector<T> from, std::vector<T> to, std::vector<ul> id)
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
            if(id_to_handles_.find(id[i]) == id_to_handles_.end())
            {
              Rcpp::stop(std::string("'id' key not found."));
            }

            bool has_id = false;
            auto iterpair = key_to_id_.equal_range(from[i]);
            for (auto it = iterpair.first; it != iterpair.second; ++it)
            {
                if (it->second == id[i]) has_id = true;
            }
            if (!has_id) Rcpp::stop(std::string("'from' does not fit  value 'id'"));

            decrease_key_(to[i], from[i], id[i]);
        }
    }

    void clear()
    {
        heap_.clear();
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
        binomial_node<T, U> n = heap_.top();
        heap_.pop();

        std::map< T, std::vector<U> > heads;
        heads.insert(std::pair<T, std::vector<U>>(n.key_, n.value_));

        auto iterpair = key_to_id_.equal_range(n.key_);
        for (auto it = iterpair.first; it != iterpair.second; ++it)
        {
            if (it->second == n.id_)
            {
                key_to_id_.erase(it);
                break;
            }
        }

        return Rcpp::wrap(heads);
    }

    Rcpp::List peek()
    {
        binomial_node<T, U> n = heap_.top();

        std::map< T, std::vector<U> > heads;
        heads.insert(std::pair<T, std::vector<U>>(n.key_, n.value_));


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

    void decrease_(T to, ul id)
    {
      (*id_to_handles_[id]).key_ = to;
      heap_.decrease(id_to_handles_[id]);
    }

    Heap<T, U> heap_;
    std::unordered_multimap<T, ul> key_to_id_;
    std::unordered_map<ul, typename Heap<T, U>::handle_type> id_to_handles_;
    boost::uuids::random_generator generator_;
};

typedef binomial_heap<std::string, std::string> binomial_heap_ss;
typedef binomial_heap<std::string, int>         binomial_heap_si;
typedef binomial_heap<std::string, bool>        binomial_heap_sb;
typedef binomial_heap<std::string, double>      binomial_heap_sd;

typedef binomial_heap<double, std::string>  binomial_heap_ds;
typedef binomial_heap<double, int>          binomial_heap_di;
typedef binomial_heap<double, bool>         binomial_heap_db;
typedef binomial_heap<double, double>       binomial_heap_dd;

typedef binomial_heap<int, std::string>  binomial_heap_is;
typedef binomial_heap<int, int>          binomial_heap_ii;
typedef binomial_heap<int, bool>         binomial_heap_ib;
typedef binomial_heap<int, double>       binomial_heap_id;

#endif
