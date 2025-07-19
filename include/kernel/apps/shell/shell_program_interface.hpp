#pragma once

namespace kernel::apps::shell::internal::shell_program_interface
{
    struct ShellProgramAPI
    {
        // Input
        uint8_t (*input_char)();

        // Output
        void (*print)(const char *);
        void (*newline)();
        void (*cls)();

        // Control
        void (*exit)(shell_program_result);
    };

    enum class shell_program_result
    {
        OK,
        ERROR,
        PANIC,
    };

    using shell_program_ptr = shell_program_result (*)(ShellProgramAPI);

}