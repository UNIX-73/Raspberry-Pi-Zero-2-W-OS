#pragma once
#include <cstdint>

namespace drivers::mailbox::clock
{
    enum class ClockType : uint32_t
    {
        CT_EMMC = 1,
        CT_UART = 2,
        CT_ARM = 3,
        CT_CORE = 4
    };

    uint32_t read_clock_rate(ClockType ct);

}