#include <drivers/mailbox/clock.hpp>
#include <drivers/mailbox/mailbox.hpp>
#include <drivers/mailbox/core/mailbox_tags.hpp>

namespace drivers::mailbox::clock
{
    uint32_t read_clock_rate(ClockType clock_type)
    {
        uint32_t rate = 0;

        bool result = mailbox_generic_command(tags::RPI_FIRMWARE_GET_CLOCK_RATE, (uint32_t)clock_type, &rate);

        if (!result)
        {
            // TODO: panic()
        }

        return rate;
    }
}