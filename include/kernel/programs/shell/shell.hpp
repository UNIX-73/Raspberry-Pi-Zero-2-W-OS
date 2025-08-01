#pragma once

#include <stdint.h>
#include <cstddef>

namespace kernel::programs::shell
{
    uint64_t run(uint64_t program_id, char *args);

    void reset();
}