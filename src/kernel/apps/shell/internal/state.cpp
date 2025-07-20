#include <kernel/apps/shell/internal/state.hpp>

namespace kernel::apps::shell::internal::state
{
    shell_program_interface::shell_program_ptr running_program = nullptr;
    uint8_t input_buffer[INPUT_BUFFER_SIZE];
    size_t input_idx = 0;
    uint8_t program_input_buffer[PROGRAM_INPUT_BUFFER_SIZE];
}
