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

#ifndef DS_FIBHEAP
#define DS_FIBHEAP

#include <Rcpp.h>
#include <vector>
#include <string>
#include <map>
#include <unordered_map>
#include <boost/heap/fibonacci_heap.hpp>

using ul = unsigned long;

template <typename T, typename U>
struct fibonacci_node
{
    typename boost::heap::fibonacci_heap<fibonacci_node<T, U>>::handle_type handle;
    T key_;
    std::vector<U> value_;
    unsigned long id_;

    fibonacci_node(T key, std::vector<U> value, ul id) :
        key_(key), value_(value), id_(id)
    {}

      bool operator<( const fibonacci_node<T, U>& rhs) const
      {
          return key_ > rhs.key_;
      }
};


template <typename T, typename U>
class fibonacci_heap
{
public:
    fibonacci_heap(): id_(0), heap_(), key_to_id_(), id_to_handles_()
    {}

    void insert(std::vector<T>& t, std::vector< std::vector<U> >& u)
    {
        if (t.size() != u.size())
        {
            Rcpp::stop("keys.size() != values.size()");
        }
        for (typename std::vector<T>::size_type i = 0; i < t.size(); ++i)
        {
            typename boost::heap::fibonacci_heap< fibonacci_node<T, U> >::handle_type h = heap_.push(fibonacci_node<T, U>(t[i], u[i], id_));
            (*h).handle = h;

            id_to_handles_.insert(std::pair<ul, typename boost::heap::fibonacci_heap<fibonacci_node<T, U>>::handle_type>(id_, h));
            key_to_id_.insert(std::pair<T, ul>(t[i], id_));
            id_++;
        }
    }

    Rcpp::List handles(T from)
    {
        std::map<T, std::pair<ul, std::vector<U>>> ret;
        if (key_to_id_.find(from) != key_to_id_.end())
        {
            auto iterpair = key_to_id_.equal_range(from);
            for (auto it = iterpair.first; it != iterpair.second; ++it)
            {
                ul id = it->second;
                auto val = std::pair<ul, std::vector<U>>(
                                id, (*id_to_handles_[id]).value_);
                ret.insert(std::pair<T, std::pair<ul, std::vector<U> > >(from, val));
            }
        }

        return Rcpp::wrap(ret);
    }

    Rcpp::List decrease_key(T from, T to, unsigned long id)
    {
        std::map< T, std::pair<unsigned long, std::vector<U>> > ret;
        if (to >= from)
        {
            Rcpp::stop(std::string("'to' key is not smaller than 'from'"));
        }
        if (key_to_id_.find(from) == key_to_id_.end())
        {
            Rcpp::stop(std::string("'to' key not found"));
        }
        if(id_to_handles_[id].count() == 1)
        {
            ret = decrease_key_(to, from, key_to_id_[from]);
        }
        else
        {
          Rcpp::stop(std::string("'id' key not found."));
        }

        return Rcpp::wrap(ret);
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
        fibonacci_node<T, U> n = heap_.top();
        heap_.pop();

        std::map<T, std::vector<U>> heads;
        heads.insert(std::pair<T, std::vector<U> >(n.key_, n.value_));

        return Rcpp::wrap(heads);
    }

    Rcpp::List peek()
    {
        fibonacci_node<T, U> n = heap_.top();

        std::map< T, std::vector<U> > heads;
        heads.insert(std::pair< T, std::vector<U> >(n.key_, n.value_));

        return Rcpp::wrap(heads);
    }

private:
    std::map<T, std::pair<ul, std::vector<U>>> decrease_key_(T to, T from, ul id)
    {
        drop_from_map_(from, id);
        decrease_(to, id);
        key_to_id_.insert(std::pair<T, ul>(to, id));

        std::map<T, std::pair<ul, std::vector<U>>> ret;
        auto val = std::pair<ul, std::vector<U>>(id, (*id_to_handles_[id]).value_);
        ret.insert(std::pair<T, std::pair<ul, std::vector<U> > >(to, val));

        return ret;
    }

    void drop_from_map_(T from, unsigned long id)
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

    void decrease_(T to, unsigned long id)
    {
      (*id_to_handles_[id]).key_ = to;
      heap_.decrease(id_to_handles_[id]);
    }

    ul id_;
    boost::heap::fibonacci_heap< fibonacci_node<T, U> > heap_;
    std::unordered_multimap<T, ul> key_to_id_;
    std::unordered_map<ul, typename boost::heap::fibonacci_heap< fibonacci_node<T, U> >::handle_type> id_to_handles_;
};

typedef fibonacci_heap<std::string, std::string> fibonacci_heap_ss;
typedef fibonacci_heap<std::string, int>         fibonacci_heap_si;
typedef fibonacci_heap<std::string, bool>        fibonacci_heap_sb;
typedef fibonacci_heap<std::string, double>      fibonacci_heap_sd;

typedef fibonacci_heap<double, std::string>  fibonacci_heap_ds;
typedef fibonacci_heap<double, int>          fibonacci_heap_di;
typedef fibonacci_heap<double, bool>         fibonacci_heap_db;
typedef fibonacci_heap<double, double>       fibonacci_heap_dd;

typedef fibonacci_heap<int, std::string>  fibonacci_heap_is;
typedef fibonacci_heap<int, int>          fibonacci_heap_ii;
typedef fibonacci_heap<int, bool>         fibonacci_heap_ib;
typedef fibonacci_heap<int, double>       fibonacci_heap_id;

#endif
