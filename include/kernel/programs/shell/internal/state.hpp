#pragma once
#include <stdint.h>
#include <cstddef>

namespace kernel::programs::shell::internal::state
{
    constexpr uint32_t TAB_SPACE_SIZE = 4;

    // shell mode input buffer
    constexpr size_t COMMAND_BUFFER_SIZE = 255;
    extern uint8_t command_buffer[COMMAND_BUFFER_SIZE];
    extern size_t command_buffer_idx;
}
