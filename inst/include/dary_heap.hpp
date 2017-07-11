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

#ifndef DS_DARYHEAP
#define DS_DARYHEAP

#include <Rcpp.h>
#include <vector>
#include <string>
#include <map>
#include <boost/heap/d_ary_heap.hpp>

template <typename T, typename U>
struct node
{
    T key_;
    U value_;

    node(T key, U value) : key_(key), value_(value)
    {}
};

template <typename T, typename U>
struct compare_node
{
    bool operator()(const node<T, U>& lhs, const node<T, U>& rhs) const
    {
        return lhs.key_ > rhs.key_;
    }
};


template <typename T, typename U>
class d_ary_heap
{
public:
    d_ary_heap(): heap_()
    {}

    void insert(std::vector<T>& t, std::vector<U>& u)
    {
        if (t.size() != u.size())
        {
            Rcpp::stop("keys.size() != values.size()");
        }
        for (typename std::vector<T>::size_type i = 0; i < t.size(); ++i)
        {
            heap_.push(node<T, U>(t[i], u[i]));
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
        node<T, U> n = heap_.top();
        heap_.pop();

        std::map< T, U > heads;
        heads.insert(std::pair<T, U>(n.key_, n.value_));

        return Rcpp::wrap(heads);
    }

    Rcpp::List peek()
    {
        node<T, U> n = heap_.top();

        std::map< T, U > heads;
        heads.insert(std::pair<T, U>(n.key_, n.value_));

        return Rcpp::wrap(heads);
    }

private:
    boost::heap::d_ary_heap< node<T, U>,
                             boost::heap::compare<compare_node<T, U> > > heap_;
};

typedef d_ary_heap<std::string, std::string> d_ary_heap_ss;
typedef d_ary_heap<std::string, int>         d_ary_heap_si;
typedef d_ary_heap<std::string, bool>        d_ary_heap_sb;
typedef d_ary_heap<std::string, double>      d_ary_heap_sd;

typedef d_ary_heap<double, std::string>  d_ary_heap_ds;
typedef d_ary_heap<double, int>          d_ary_heap_di;
typedef d_ary_heap<double, bool>         d_ary_heap_db;
typedef d_ary_heap<double, double>       d_ary_heap_dd;

typedef d_ary_heap<int, std::string>  d_ary_heap_is;
typedef d_ary_heap<int, int>          d_ary_heap_ii;
typedef d_ary_heap<int, bool>         d_ary_heap_ib;
typedef d_ary_heap<int, double>       d_ary_heap_id;

#endif
