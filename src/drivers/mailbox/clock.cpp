#include <drivers/mailbox/clock/clock.hpp>
#include <drivers/mailbox/mailbox.hpp>
#include <drivers/mailbox/mailbox_tags.hpp>

namespace drivers::mailbox::clock
{
    uint32_t mailbox_read_clock_rate(ClockType ct)
    {
        MailboxGeneric c;
        c.tag.id = tags::RPI_FIRMWARE_GET_CLOCK_RATE;
        c.tag.value_length = 0;
        c.tag.buffer_size = sizeof(c) - sizeof(c.tag);
        c.id = (uint32_t)ct;

        mailbox_process((MailboxTag *)&c, sizeof(c));

        return c.value;
    }
}