#pragma once
#include <cstdint>

namespace lib::mem
{
    void *memcpy(void *dest, const void *src, uint32_t n);
}