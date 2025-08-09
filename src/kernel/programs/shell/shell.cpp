#include <kernel/programs/shell/shell.hpp>
#include <kernel/programs/shell/internal/input_handler.hpp>
#include <kernel/programs/shell/internal/state.hpp>
#include <kernel/io/input_buffer.hpp>
#include <kernel/io/uart/uart_io.hpp>

static bool init = false;
static const size_t UNREAD_INPUT_BUFFER_SIZE = 32;

namespace kernel::programs::shell
{
    using namespace kernel::programs::shell::internal;
    uint64_t run(uint64_t program_id, char *args)
    {
        kernel::io::input_buffer::subscribe(program_id);
        init = true;

        kernel::io::uart::send("\n\r>");
        kernel::io::uart::show_cursor();

        uint8_t unread_input[UNREAD_INPUT_BUFFER_SIZE] = {};

        while (init)
        {
            size_t unread_len = kernel::io::input_buffer::ib_read_unread(program_id, unread_input, UNREAD_INPUT_BUFFER_SIZE);

            for (uint32_t i = 0; i < unread_len; i++)
            {
                input_handler::handle_input_char(unread_input[i]);
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