#pragma once
#include <stdint.h>
#include <kernel/apps/shell/shell_program_interface.hpp>

namespace kernel::apps::shell::internal::state
{
    shell_program_interface::shell_program_ptr running_program = nullptr;

    constexpr uint32_t INPUT_BUFFER_SIZE = 255;
    constexpr uint32_t TAB_SPACE_SIZE = 4;

    // Input buffer
    uint8_t input_buffer[INPUT_BUFFER_SIZE];
    size_t input_idx = 0;
}