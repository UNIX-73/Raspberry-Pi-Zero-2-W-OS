#pragma once
#include <drivers/aux/aux.hpp>
#include <stdint.h>

namespace AUX::MINI_UART
{
	void init();

	inline uint8_t read()
	{
		return *MU_IO_REG_ADDR_PTR; // TODO: Verificar
	};

	// If bit 5 is not 1 FIFO cant accept new data because it is full
	inline bool write_fifo_has_space()
	{
		return ((*MU_LSR_REG_ADDR_PTR & (1u << 5)) != 0u);
	}

	inline void write(uint8_t byte)
	{
		*MU_IO_REG_ADDR_PTR = byte;
	};
} // namespace AUX::MINI_UART