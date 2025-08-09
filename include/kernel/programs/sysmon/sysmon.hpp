#pragma once
#include <cstdint>

namespace kernel::programs::sysmon
{
    uint64_t run(uint64_t program_id, char *args);

    uint64_t exit();
} // namespace kernel::program::
