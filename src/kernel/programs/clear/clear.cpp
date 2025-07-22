#include <kernel/programs/clear/clear.hpp>
#include <kernel/io/uart/uart_io.hpp>

namespace kernel::programs::clear
{
    uint64_t run(uint64_t program_id, char *args)
    {
        // TODO: en vez de al uart conectarlo al output que sea (habrá que hacer un manager)
        io::uart::uart_io::clear_screen();

        return 0;
    };
}