#include <kernel/programs/shell/internal/command_executor.hpp>
#include <kernel/programs/shell/internal/input_handler.hpp>
#include <kernel/programs/shell/internal/state.hpp>
#include <kernel/programs/program_registry.hpp>
#include <kernel/lib/string.hpp>
#include <kernel/lib/debug/debug.hpp>
#include <kernel/io/uart/uart_io.hpp>

namespace kernel::programs::shell::internal::command_executor
{
    void execute_command()
    {
        internal::input_handler::send_to_frontend('\n');

        // Get command name and command args
        size_t name_idx = 0;
        char command_name[state::command_buffer_idx + 1] = {'\0'}; // Se debería inicializar con todo \0s
        size_t args_idx = 0;
        char command_args[state::command_buffer_idx + 1] = {'\0'};

        bool found_name = false;
        for (size_t i = 0; i < state::command_buffer_idx; i++)
        {
            uint8_t c = state::command_buffer[i];

            if (c == '\0')
                break;

            if (!found_name && c == ' ')
            {
                found_name = true;
                continue;
            }

            if (!found_name)
            {
                command_name[name_idx++] = c;
            }
            else
            {
                command_args[args_idx++] = c;
            }
        }

        // Execute
        ProgramDefinition *program = programs::registry::find_by_name(command_name);

        if ((program == nullptr || program->hidden) && state::command_buffer[0] != '\0')
        {
            internal::input_handler::send_to_frontend("Unkown command: ");
            internal::input_handler::send_to_frontend(command_name);
            internal::input_handler::send_to_frontend('\n');
        }
        else
        {
            program->entry(1234, command_args); // TODO: program id manager
        }

        internal::state::command_buffer_idx = 0;
        internal::input_handler::send_to_frontend('>');
        kernel::io::uart::show_cursor();
    }
}