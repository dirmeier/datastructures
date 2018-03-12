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


#ifndef DS_STACK
#define DS_STACK

#include <Rcpp.h>
#include <stack>
#include <string>


template <typename T>
class stack
{
public:
    stack(): stack_()
    {}

    size_t size()
    {
        return stack_.size();
    }

    void insert(std::vector< std::vector<T> >& t)
    {
        for (typename std::vector<T>::size_type i = 0; i < t.size(); ++i)
            stack_.push(t[i]);
    }

    std::vector<T> peek()
    {
        return stack_.top();
    }

    std::vector<T> pop()
    {
        std::vector<T> t = peek();
        stack_.pop();
        return t;
    }

private:
    std::stack< std::vector<T> > stack_;
};

using stack_s = stack<std::string>;
using stack_d = stack<double>;
using stack_i = stack<int>;

#endif
