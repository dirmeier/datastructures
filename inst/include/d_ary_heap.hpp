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
#include <boost/variant.hpp>
#include <boost/variant/apply_visitor.hpp>
#include <boost/make_shared.hpp>
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

template <typename T, typename U, size_t N>
using d_ary_heap_type = boost::heap::d_ary_heap<
    node<T, U>,
    boost::heap::mutable_<true>,
    boost::heap::arity<N>,
    boost::heap::compare<compare_node<T, U> > >;

template <typename T, typename U>
using d_ary_heap_variant = boost::variant<
    boost::shared_ptr< d_ary_heap_type<T, U,  3> >,
    boost::shared_ptr< d_ary_heap_type<T, U,  4> >,
    boost::shared_ptr< d_ary_heap_type<T, U,  5> >,
    boost::shared_ptr< d_ary_heap_type<T, U,  6> >,
    boost::shared_ptr< d_ary_heap_type<T, U,  7> >,
    boost::shared_ptr< d_ary_heap_type<T, U,  8> >,
    boost::shared_ptr< d_ary_heap_type<T, U,  9> >,
    boost::shared_ptr< d_ary_heap_type<T, U, 10> >
>;

struct size_visitor: public boost::static_visitor<std::size_t>
{
    template <typename T>
    std::size_t operator()(const T& t) const;
};

struct empty_visitor: public boost::static_visitor<bool>
{
    template <typename T>
    bool operator()(const T& t) const;
};

struct insert_visitor: public boost::static_visitor<>
{
    template <typename T, typename U>
    insert_visitor(std::vector<T>& lefts, std::vector<U> rights);

    template <typename T,  typename U>
    void operator()(T& t);
};

template <typename T, typename U>
class d_ary_heap
{
public:

    d_ary_heap(const int d)
    {
        if (!(2 < d && d <= 10))
        {
            Rcpp::stop("init the d_dary_heap with an arity of 3/4/.../10");
        }
        if (d == 3)
            heap_ = boost::make_shared<d_ary_heap_type<T, U,  3>>();
        else if (d == 4)
            heap_ = boost::make_shared<d_ary_heap_type<T, U,  4>>();
        else if (d == 5)
            heap_ = boost::make_shared<d_ary_heap_type<T, U,  5>>();
        else if (d == 6)
            heap_ = boost::make_shared<d_ary_heap_type<T, U,  6>>();
        else if (d == 7)
            heap_ = boost::make_shared<d_ary_heap_type<T, U,  7>>();
        else if (d == 8)
            heap_ = boost::make_shared<d_ary_heap_type<T, U,  8>>();
        else if (d == 9)
            heap_ = boost::make_shared<d_ary_heap_type<T, U,  9>>();
        else
            heap_ = boost::make_shared<d_ary_heap_type<T, U, 10>>();
    }

    void insert(std::vector<T>& t, std::vector<U>& u)
    {
        // if (t.size() != u.size())
        // {
        //     Rcpp::stop("keys.size() != values.size()");
        // }
        // for (typename std::vector<T>::size_type i = 0; i < t.size(); ++i)
        // {
        //     boost::apply_visitor
        //     *heap_.get().push(node<T, U>(t[i], u[i]));
        // }
    }

    void clear()
    {
        // heap_.clear();
    }

    size_t size()
    {
        return boost::apply_visitor(size_visitor(), heap_);
    }

    bool is_empty()
    {
        // return heap_.empty();
        return true;
    }

    Rcpp::List pop()
    {
        // node<T, U> n = heap_.top();
        // heap_.pop();
        //
        // std::map< T, U > heads;
        // heads.insert(std::pair<T, U>(n.key_, n.value_));
        //
        // return Rcpp::wrap(heads);
        //
        return R_NilValue;
    }

    Rcpp::List peek()
    {
        // node<T, U> n = heap_.top();
        //
        // std::map< T, U > heads;
        // heads.insert(std::pair<T, U>(n.key_, n.value_));
        //
        // return Rcpp::wrap(heads);

        return R_NilValue;
    }

private:
    d_ary_heap_variant<T, U> heap_;
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
