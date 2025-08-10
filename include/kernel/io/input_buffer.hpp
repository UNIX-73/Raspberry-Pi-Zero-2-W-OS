#pragma once
#include <stdint.h>
#include <stddef.h>

namespace kernel::io::input_buffer
{
    constexpr size_t INPUT_BUFFER_SIZE = 2048;

    // Llamado desde el irq
    void ib_push_char(uint8_t c);

    void subscribe(uint64_t program_id);
    size_t ib_read_unread(uint64_t program_id, uint8_t *buf, size_t max_len);
    void ib_get_data(uint8_t *buf, size_t max_len);
    void ib_reset();
} 