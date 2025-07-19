#pragma once

#include <stdint.h>
#include <cstddef>

namespace kernel::apps::shell
{
    uint32_t run();

    void handle_input_char(uint8_t c);

    void reset();
}