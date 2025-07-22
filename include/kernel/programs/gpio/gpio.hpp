#pragma once
#include <stdint.h>

namespace kernel::programs::gpio
{
    uint64_t run(uint64_t program_id, char *args);
}
