#pragma once
#include <stdint.h>
#include <cstddef>
#include <kernel/apps/shell/shell_program_interface.hpp>

namespace kernel::apps::shell::internal::state {
    extern shell_program_interface::shell_program_ptr running_program;

    constexpr uint32_t TAB_SPACE_SIZE = 4;

    // shell mode input buffer
    constexpr size_t INPUT_BUFFER_SIZE = 255;
    extern uint8_t input_buffer[INPUT_BUFFER_SIZE];
    extern size_t input_idx;

    // program mode input buffer
    constexpr size_t PROGRAM_INPUT_BUFFER_SIZE = 32;
    extern uint8_t program_input_buffer[PROGRAM_INPUT_BUFFER_SIZE];
}
