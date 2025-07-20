#include <kernel/apps/shell/internal/command_executor.hpp>
#include <kernel/apps/shell/internal/input_handler.hpp>
#include <kernel/apps/shell/internal/state.hpp>

namespace kernel::apps::shell::internal::command_executor
{
    void execute_command()
    {
        internal::input_handler::send_to_frontend('\n');

        // Execute

        internal::state::input_idx = 0;
        internal::input_handler::send_to_frontend('>');
    }
}