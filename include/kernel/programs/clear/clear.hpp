#pragma once
#include <kernel/programs/program_definition.hpp>

namespace kernel::programs::clear
{
    uint64_t run(uint64_t program_id, const char *args);
}