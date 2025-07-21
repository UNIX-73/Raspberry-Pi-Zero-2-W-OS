#pragma once
#include <stdint.h>

namespace kernel::programs
{
    typedef uint64_t (*program_entry_ptr)(uint64_t program_id, const char *args);

    struct ProgramDefinition
    {
        const char *name;
        const char *description; // For -h for example
        program_entry_ptr entry; // main fn entry
        bool hidden;             // If hidden it is hidden from shell and other lists
    };
}