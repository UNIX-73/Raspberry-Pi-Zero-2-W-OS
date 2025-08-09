#include <kernel/programs/sysmon/sysmon.hpp>
#include <kernel/programs/sysmon/internal/print_info.hpp>
#include <cstddef>
#include <kernel/io/input_buffer.hpp>
#include <kernel/io/uart/uart_io.hpp>
#include <drivers/mailbox/temperature.hpp>
#include <lib/ascii.hpp>

static bool init = false;
static uint32_t loop_count = 0;

static const size_t UNREAD_INPUT_BUFFER_SIZE = 32;
static uint8_t unread_input[UNREAD_INPUT_BUFFER_SIZE] = {'\0'};

namespace kernel::programs::sysmon
{
    uint64_t run(uint64_t program_id, char *args)
    {
        kernel::io::input_buffer::subscribe(program_id);

        init = true;

        kernel::io::uart::hide_cursor();
        internal::print_info();

        while (init)
        {
            size_t unread_len = kernel::io::input_buffer::ib_read_unread(program_id, unread_input, UNREAD_INPUT_BUFFER_SIZE);

            for (uint32_t i = 0; i < unread_len; i++)
            {
                char c = (char)unread_input[i];

                if (c == 0x03) // Ctrl + C
                {
                    exit();
                }
            }

            if (++loop_count >= 500000) // TODO: timer irq
            {
                internal::print_info();
                loop_count = 0;
            }
        }

        return exit();
    }

    uint64_t exit()
    {
        loop_count = 0;
        init = false;
        kernel::io::uart::clr_screen();

        return 0;
    };
}