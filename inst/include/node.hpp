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

#ifndef DS_NODE
#define DS_NODE

#include <vector>

template <typename T, typename U>
struct node
{
    T key_;
    std::vector<U> value_;

    node(T key, std::vector<U> value) : key_(key), value_(value)
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



#endif
