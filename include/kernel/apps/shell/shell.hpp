#pragma once

#include <stdint.h>
#include <cstddef>

namespace kernel::apps::shell
{
    uint64_t run(uint64_t program_id);

    void reset();
}