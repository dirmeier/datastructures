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
#include <boost/heap/binomial_heap.hpp>

#include <node.hpp>


template <typename T, typename U>
class binomial_heap
{
public:
    binomial_heap(): heap_()
    {}

    void insert(std::vector<T>& t, std::vector< std::vector<U> >& u)
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

        std::map< T, std::vector<U> > heads;
        heads.insert(std::pair<T, std::vector<U>>(n.key_, n.value_));

        return Rcpp::wrap(heads);
    }

    Rcpp::List peek()
    {
        node<T, U> n = heap_.top();

        std::map< T, std::vector<U> > heads;
        heads.insert(std::pair<T, std::vector<U>>(n.key_, n.value_));

        return Rcpp::wrap(heads);
    }

private:
    boost::heap::binomial_heap< node<T, U>,
                                boost::heap::compare<compare_node<T, U> > > heap_;
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
