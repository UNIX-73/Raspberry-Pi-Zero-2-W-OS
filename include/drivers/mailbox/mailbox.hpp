#pragma once

#include <cstdint>
#include <drivers/mailbox/core/mailbox_constants.hpp>
#include <drivers/utils/mapped_reg.hpp>

namespace drivers::mailbox
{
    extern reg32_ptr_t MAILBOX_READ;
    extern reg32_ptr_t MAILBOX_STATUS;
    extern reg32_ptr_t MAILBOX_CONFIG;
    extern reg32_ptr_t MAILBOX_WRITE;

    struct MailboxTag
    {
        uint32_t id;
        uint32_t buffer_size;
        uint32_t value_length;
    };

    struct MailboxCommand
    {
        uint32_t size;
        void *tag;
    };

    struct MailboxGeneric
    {
        MailboxTag tag;
        uint32_t id;
        uint32_t value;
    };

    bool mailbox_generic_command(uint32_t tag_id, uint32_t id, uint32_t *value);

    bool mailbox_power_check(uint32_t type);

    bool mailbox_process(MailboxTag *tag, uint32_t tag_size);

}