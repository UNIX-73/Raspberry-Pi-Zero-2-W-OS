#include <kernel/io/input_buffer.hpp>
#include <kernel/lib/buffer/buffer.hpp>

#ifdef DEBUG
#include <kernel/io/uart/uart_io.hpp>
#endif

struct InputBufferProgram
{
    uint64_t program_id;
    uint32_t access_order;
    size_t read_idx;
};

namespace kernel::io::input_buffer
{
    // Subscribed programs
    static constexpr size_t MAX_SUBSCRIBED_PROGRAMS = 8;
    static InputBufferProgram subscribed_programs[MAX_SUBSCRIBED_PROGRAMS] = {};

    static uint8_t buffer[INPUT_BUFFER_SIZE] = {0};
    static uint32_t write_idx = 0;

    void subscribe(uint64_t program_id)
    {
        int32_t subscribed_program_id = -1;
        int32_t empty_space = -1;

        for (size_t i = 0; i < MAX_SUBSCRIBED_PROGRAMS; i++)
        {
            // Si ya estaba registrado lo pone como el ultimo accedido
            if (subscribed_programs[i].program_id == program_id)
            {
                subscribed_programs[i].access_order = 0;
                subscribed_program_id = i;
            }
            else if (subscribed_programs[i].program_id != 0)
            {
                subscribed_programs[i].access_order++;
            }

            // Si hay hueco en el buffer (programa con id 0) marca esa variable para
            // usarla luego
            if (empty_space == -1 && subscribed_programs[i].program_id == 0)
                empty_space = i;
        }

        // El programa ya estaba registrado
        if (subscribed_program_id != -1)
            return;

        if (empty_space != -1)
        {
            subscribed_programs[empty_space] = {
                .program_id = program_id,
                .access_order = 0,
                .read_idx = write_idx,
            };
            return;
        }

        // Si el programa no estaba ya en el buffer, se añade aquí
        size_t last_order_idx = 0;
        size_t last_order_val = 0;

        for (size_t i = 0; i < MAX_SUBSCRIBED_PROGRAMS; i++)
        {
            // Se busca el hueco se inserta y se returnea
            {
                // Se busca el idx con orden de acceso mas grande
                if (subscribed_programs[i].access_order >= last_order_val)
                {
                    last_order_val = subscribed_programs[i].access_order;
                    last_order_idx = i;
                }
            }
        }

        // Se reemplaza el ultimo programa que ha accedido por el nuevo, cuando se implemente malloc, hay que cambiar esto
        subscribed_programs[last_order_idx] = {
            .program_id = program_id,
            .access_order = 0,
            .read_idx = write_idx,
        };

        return;
    }

    void ib_push_char(uint8_t c)
    {
        buffer[write_idx] = c;
        write_idx = (write_idx + 1) % INPUT_BUFFER_SIZE;
    }

    static bool program_buffer_overflows(size_t buffer_len)
    {
        if (buffer_len > INPUT_BUFFER_SIZE)
        {

#ifdef DEBUG
            kernel::io::uart::sendln("\n\r!Requested input buffer max len is bigger than the input buffer size");
#endif
            return true;
        }
        return false;
    }

    /**
     * @returns -1 if not found or the idx
     */
    static inline int32_t find_subscribed_program_idx(uint64_t program_id)
    {
        int32_t program_idx = -1;
        for (size_t i = 0; i < MAX_SUBSCRIBED_PROGRAMS; i++)
        {
            if (program_id == subscribed_programs[i].program_id)
            {
                program_idx = i;
                break;
            }
        }
        return program_idx;
    }

    void ib_get_data(uint8_t *buf, size_t max_len)
    {
        if (program_buffer_overflows(max_len))
            return;

        size_t initial_idx = (write_idx + INPUT_BUFFER_SIZE - max_len) % INPUT_BUFFER_SIZE;

        for (size_t i = 0; i < max_len; i++)
        {
            buf[i] = buffer[initial_idx];
            initial_idx = (initial_idx + 1) % INPUT_BUFFER_SIZE;
        }
    }

    /**
     * Remembers the subscribed program IDs and returns the unread info
     * @returns The len of the unread info
     */
    size_t ib_read_unread(uint64_t program_id, uint8_t *buf, size_t max_len)
    {
        volatile uint32_t atomic_write_idx = write_idx; // ver §2
        if (program_buffer_overflows(max_len))
            return 0;

        int32_t program_idx = find_subscribed_program_idx(program_id);
        if (program_idx < 0)
        {
            kernel::lib::buffer::fill_buffer<uint8_t>(0, buf, max_len);
            return 0;
        }

        // nº total disponible en el ring
        size_t unread_total =
            (atomic_write_idx + INPUT_BUFFER_SIZE - subscribed_programs[program_idx].read_idx) % INPUT_BUFFER_SIZE;

        // sólo copiamos hasta max_len
        size_t to_copy = (unread_total > max_len) ? max_len : unread_total;

        for (size_t i = 0; i < to_copy; i++)
        {
            size_t r = subscribed_programs[program_idx].read_idx;
            buf[i] = buffer[r];
            subscribed_programs[program_idx].read_idx = (r + 1) % INPUT_BUFFER_SIZE;
        }

        // si había más de max_len, adelantamos el read_idx para “descartar” el resto (o quita esto si prefieres mantenerlo)
        size_t discard = unread_total - to_copy;
        if (discard)
        {
            subscribed_programs[program_idx].read_idx =
                (subscribed_programs[program_idx].read_idx + discard) % INPUT_BUFFER_SIZE;
        }

        return to_copy; // devolvemos lo realmente copiado
    }

    void ib_reset()
    {
        for (uint32_t i = 0; i < MAX_SUBSCRIBED_PROGRAMS; i++)
        {
            buffer[i] = 0;
            subscribed_programs[i] = {};
        }
    }
}
