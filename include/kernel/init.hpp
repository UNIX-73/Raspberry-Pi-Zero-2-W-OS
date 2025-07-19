#pragma once
#include <stdint.h>

namespace kernel
{
    // Executed before kernel start (inits irq, uart, switches to el1 when it finishes)
    void init_devices();
    void start();
} // namespace kernel
