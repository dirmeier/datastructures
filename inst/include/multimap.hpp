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


#ifndef DS_MULTIMAP
#define DS_MULTIMAP


#include <vector>
#include <string>
#include "map.hpp"
#include <unordered_map>


using multimap_ss = datastructures::map<
  std::unordered_multimap, std::string, std::string>;
using multimap_si = datastructures::map<
  std::unordered_multimap, std::string, int>;
using multimap_sb = datastructures::map<
  std::unordered_multimap, std::string, bool>;
using multimap_sd = datastructures::map<
  std::unordered_multimap, std::string, double>;

using multimap_ds = datastructures::map<
  std::unordered_multimap, double, std::string>;
using multimap_di = datastructures::map<
  std::unordered_multimap, double, int>;
using multimap_db = datastructures::map<
  std::unordered_multimap, double, bool>;
using multimap_dd = datastructures::map<
  std::unordered_multimap, double, double>;

using multimap_is = datastructures::map<
  std::unordered_multimap, int, std::string>;
using multimap_ii = datastructures::map<
  std::unordered_multimap, int, int>;
using multimap_ib = datastructures::map<
  std::unordered_multimap, int, bool>;
using multimap_id = datastructures::map<
  std::unordered_multimap, int, double>;

#endif
