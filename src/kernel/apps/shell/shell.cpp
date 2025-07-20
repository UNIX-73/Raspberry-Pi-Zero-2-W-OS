#include <kernel/apps/shell/shell.hpp>
#include <kernel/apps/shell/internal/input_handler.hpp>
#include <kernel/apps/shell/internal/command_executor.hpp>
#include <kernel/apps/shell/internal/state.hpp>

static bool init = false;

namespace kernel::apps::shell
{
    uint64_t run()
    {
        init = true;
        return 0;
    }

    using namespace kernel::apps::shell::internal;
    void handle_input_char(uint8_t c)
    {
        if (state::running_program == nullptr)
        {

            if (input_handler::char_is_allowed_symbol(c))
            {
                input_handler::push_char(c);
                return;
            }

            if (c == ' ')
            {
                input_handler::push_char(c);
            }

            if (c == '\t')
            {
                if (state::input_idx < (state::INPUT_BUFFER_SIZE - state::TAB_SPACE_SIZE))
                {
                    for (int i = 0; i < 4; i++)
                    {
                        input_handler::push_char(' ');
                    }
                }
            }

            if (c == '\n')
            {
                command_executor::execute_command();
            }
        }
        else
        {
        }
    }

    void reset() {}

}