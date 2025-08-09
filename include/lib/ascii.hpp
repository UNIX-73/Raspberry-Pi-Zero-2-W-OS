#pragma once
#include <cstdint>
#include <cstddef>

namespace lib::ascii
{
    char *u64_to_ascii(uint64_t val, char *out, size_t len);
    char *u64_to_hex_ascii(uint64_t value, char *out, size_t len);
}