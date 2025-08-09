#include <drivers/mailbox/mailbox.hpp>
#include <drivers/mailbox/core/mailbox_tags.hpp>
#include <drivers/peripherals.hpp>
#include <lib/mem.hpp>

#define MAILBOX_REG_PTR(offset) (REG32_PTR(PERIPHERAL_BASE, (0xB880 + offset)))

namespace drivers::mailbox
{
    reg32_ptr_t MAILBOX_READ = MAILBOX_REG_PTR(0x00);
    reg32_ptr_t MAILBOX_STATUS = MAILBOX_REG_PTR(0x18);
    reg32_ptr_t MAILBOX_CONFIG = MAILBOX_REG_PTR(0x1C);
    reg32_ptr_t MAILBOX_WRITE = MAILBOX_REG_PTR(0x20);

    struct PropertyBuffer
    {
        uint32_t size;
        uint32_t code;
        uint8_t tags[0];
    };

    static uint32_t property_data[8192] __attribute__((aligned(16)));

    // Mailbox status flags
    static constexpr uint32_t MAIL_EMPTY = 0x40000000; // Mailbox status: empty
    static constexpr uint32_t MAIL_FULL = 0x80000000;  // Mailbox status: full

    // Mailbox channels
    static constexpr uint8_t MAIL_POWER = 0x0;   // Mailbox Channel 0: Power Management Interface
    static constexpr uint8_t MAIL_FB = 0x1;      // Mailbox Channel 1: Frame Buffer
    static constexpr uint8_t MAIL_VUART = 0x2;   // Mailbox Channel 2: Virtual UART
    static constexpr uint8_t MAIL_VCHIQ = 0x3;   // Mailbox Channel 3: VCHIQ Interface
    static constexpr uint8_t MAIL_LEDS = 0x4;    // Mailbox Channel 4: LEDs Interface
    static constexpr uint8_t MAIL_BUTTONS = 0x5; // Mailbox Channel 5: Buttons Interface
    static constexpr uint8_t MAIL_TOUCH = 0x6;   // Mailbox Channel 6: Touchscreen Interface
    static constexpr uint8_t MAIL_COUNT = 0x7;   // Mailbox Channel 7: Counter
    static constexpr uint8_t MAIL_TAGS = 0x8;    // Mailbox Channel 8: Tags (ARM to VC)

    static void mailbox_write(uint8_t channel, uint32_t data)
    {
        while (*MAILBOX_STATUS & MAIL_FULL)
        {
            asm("nop");
        };

        *MAILBOX_WRITE = (data & 0xFFFFFFF0 | (channel & 0xF));
    }

    static uint32_t mailbox_read(uint8_t channel)
    {
        while (true)
        {
            while (*MAILBOX_STATUS & MAIL_EMPTY)
            {
                asm("nop");
            };

            uint32_t data = *MAILBOX_READ;

            uint8_t read_channel = (uint8_t)(data & 0xF);

            if (read_channel == channel)
            {
                return data & 0xFFFFFFF0; // mask de los ultimos bits
            }
        }
    }

    bool mailbox_process(MailboxTag *tag, uint32_t tag_size)
    {
        int buffer_size = tag_size + 12;

        lib::mem::memcpy(&property_data[2], tag, tag_size);

        PropertyBuffer *buff = (PropertyBuffer *)property_data;
        buff->size = buffer_size;
        buff->code = rpi_firmware_property_status_const::RPI_FIRMWARE_STATUS_REQUEST;
        property_data[(tag_size + 12) / 4 - 1] = tags::RPI_FIRMWARE_PROPERTY_END;

        mailbox_write(MAIL_TAGS, (uint32_t)(uintptr_t)property_data);

        int result = mailbox_read(MAIL_TAGS);

        lib::mem::memcpy(tag, property_data + 2, tag_size);

        return true;
    }

    bool mailbox_generic_command(uint32_t tag_id, uint32_t id, uint32_t *value)
    {
        MailboxGeneric mbx;
        mbx.tag.id = tag_id;
        mbx.tag.value_length = 0;
        mbx.tag.buffer_size = sizeof(MailboxGeneric) - sizeof(MailboxTag);
        mbx.id = id;
        mbx.value = *value;

        if (!mailbox_process((MailboxTag *)&mbx, sizeof(mbx)))
        {
            return false;
        }

        *value = mbx.value;

        return true;
    }

    
}