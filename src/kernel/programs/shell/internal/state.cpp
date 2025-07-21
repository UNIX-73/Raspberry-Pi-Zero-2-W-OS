#include <kernel/programs/shell/internal/state.hpp>

namespace kernel::programs::shell::internal::state
{
    uint8_t command_buffer[COMMAND_BUFFER_SIZE];
    size_t command_buffer_idx = 0;
}
