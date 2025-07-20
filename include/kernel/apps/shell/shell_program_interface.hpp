#pragma once
#include <stdint.h>

namespace kernel::apps::shell::shell_program_interface
{

    enum class shell_program_result
    {
        OK,
        ERROR,
        PANIC,
    };

    struct ShellProgramAPI;
    typedef shell_program_result (*shell_program_ptr)(ShellProgramAPI);

    // API
    struct ShellProgramAPI
    {
        // Input
        uint8_t (*input_char)();

        // Output
        void (*print)(const uint8_t *);
        void (*newline)();
        void (*cls)();

        // Control
        void (*exit)(shell_program_result);
    };
}