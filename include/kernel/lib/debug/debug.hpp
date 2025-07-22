#pragma once
#include <stdint.h>

namespace kernel::lib::debug
{
    void debug_stack_alineation();

    void debug_send(const char *msg);
    void debug_sendln(const char *msg);

    void debug_print_hex_u64(uint64_t value);
    void debug_ptr_address(const void *ptr);
    void debug_print_sp();

    void check_sp_bounds();

} // namespace kernel::lib::debug
