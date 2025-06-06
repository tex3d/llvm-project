//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

// UNSUPPORTED: c++03

// <vector>

// vector(initializer_list<value_type> il, const Allocator& a = allocator_type());

#include <vector>
#include <cassert>

#include "test_macros.h"
#include "test_allocator.h"
#include "min_allocator.h"
#include "asan_testing.h"

TEST_CONSTEXPR_CXX20 bool tests() {
  {
    std::vector<int, test_allocator<int>> d({3, 4, 5, 6}, test_allocator<int>(3));
    assert(d.get_allocator() == test_allocator<int>(3));
    assert(d.size() == 4);
    assert(is_contiguous_container_asan_correct(d));
    assert(d[0] == 3);
    assert(d[1] == 4);
    assert(d[2] == 5);
    assert(d[3] == 6);
  }
  {
    std::vector<int, min_allocator<int>> d({3, 4, 5, 6}, min_allocator<int>());
    assert(d.get_allocator() == min_allocator<int>());
    assert(d.size() == 4);
    assert(is_contiguous_container_asan_correct(d));
    assert(d[0] == 3);
    assert(d[1] == 4);
    assert(d[2] == 5);
    assert(d[3] == 6);
  }
  {
    std::vector<int, min_allocator<int>> d({}, min_allocator<int>());
    assert(d.size() == 0);
    assert(d.empty());
    assert(is_contiguous_container_asan_correct(d));
  }
  {
    std::vector<int, safe_allocator<int>> d({3, 4, 5, 6}, safe_allocator<int>());
    assert(d.get_allocator() == safe_allocator<int>());
    assert(d.size() == 4);
    assert(is_contiguous_container_asan_correct(d));
    assert(d[0] == 3);
    assert(d[1] == 4);
    assert(d[2] == 5);
    assert(d[3] == 6);
  }
  {
    std::vector<int, safe_allocator<int>> d({}, safe_allocator<int>());
    assert(d.size() == 0);
    assert(d.empty());
    assert(is_contiguous_container_asan_correct(d));
  }

  return true;
}

int main(int, char**) {
  tests();
#if TEST_STD_VER > 17
  static_assert(tests());
#endif
  return 0;
}
