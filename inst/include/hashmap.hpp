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


#ifndef DS_HASHMAP
#define DS_HASHMAP


#include <vector>
#include <string>
#include "map.hpp"
#include <unordered_map>


using hashmap_ss = datastructures::map<
  std::unordered_map, std::string, std::string>;
using hashmap_si = datastructures::map<
  std::unordered_map, std::string, int>;
using hashmap_sb = datastructures::map<
  std::unordered_map, std::string, bool>;
using hashmap_sd = datastructures::map<
  std::unordered_map, std::string, double>;

using hashmap_ds = datastructures::map<
  std::unordered_map, double, std::string>;
using hashmap_di = datastructures::map<
  std::unordered_map, double, int>;
using hashmap_db = datastructures::map<
  std::unordered_map, double, bool>;
using hashmap_dd = datastructures::map<
  std::unordered_map, double, double>;

using hashmap_is = datastructures::map<
  std::unordered_map, int, std::string>;
using hashmap_ii = datastructures::map<
  std::unordered_map, int, int>;
using hashmap_ib = datastructures::map<
  std::unordered_map, int, bool>;
using hashmap_id = datastructures::map<
  std::unordered_map, int, double>;

#endif
