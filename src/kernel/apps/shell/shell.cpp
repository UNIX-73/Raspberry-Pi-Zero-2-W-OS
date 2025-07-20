#include <kernel/apps/shell/shell.hpp>
#include <kernel/apps/shell/internal/input_handler.hpp>
#include <kernel/apps/shell/internal/state.hpp>
#include <kernel/io/input_buffer.hpp>
#include <kernel/io/uart/uart_io.hpp>

static bool init = false;
static const size_t TEMPORAL_INPUT_BUFFER_SIZE = 32;

namespace kernel::apps::shell
{
    using namespace kernel::apps::shell::internal;
    uint64_t run(uint64_t program_id)
    {
        kernel::io::input_buffer::subscribe(program_id);
        init = true;

        kernel::io::uart::uart_io::send("\n\r>");

        uint8_t unread[TEMPORAL_INPUT_BUFFER_SIZE] = {};

        while (init)
        {
            size_t unread_len = kernel::io::input_buffer::ib_read_unread(program_id, unread, TEMPORAL_INPUT_BUFFER_SIZE);

            for (uint32_t i = 0; i < unread_len; i++)
            {
                input_handler::handle_input_char(unread[i]);
            }

            for (uint32_t i = 0; i < 20000; i++)
            {
                asm("nop");
            }
        }

        return 0;
    }

    void reset() {}
}