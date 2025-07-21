#pragma once
#include <kernel/programs/program_definition.hpp>
#include <cstddef>

namespace kernel::programs::registry
{
    ProgramDefinition *find_by_name(const char *name);
    ProgramDefinition *get_all();
    size_t count();
}
