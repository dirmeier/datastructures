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


#ifndef DS_QUEUE
#define DS_QUEUE

#include <Rcpp.h>
#include <queue>
#include <string>


class queue
{
public:
    queue(): queue_()
    {}

    size_t size()
    {
        return queue_.size();
    }

    void insert(SEXP t)
    {
        if(!Rf_isNewList(t))
            Rcpp::stop("SEXP needs to be a NewList\n");
        for (int i = 0; i < Rf_length(t); ++i)
            queue_.push(VECTOR_ELT(t, i));
    }

    SEXP peek()
    {
        return queue_.front();
    }

    SEXP pop()
    {
        SEXP t = peek();
        queue_.pop();
        return t;
    }

private:
    std::queue< SEXP > queue_;
};

using queue_sexp = queue;

#endif
