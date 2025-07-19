#pragma once

#include <cstdint>                 // Para uintptr_t y uint32_t
#include "../utils/mapped_reg.hpp" // Asegúrate de que este archivo contiene REG32_PTR y reg32_ptr_t

#define AUX_REG_PTR(offset) REG32_PTR(AUX::AUX_BASE, offset)

namespace AUX
{
    constexpr uintptr_t AUX_BASE = 0x3F215000;

    constexpr uint32_t IRQ_OFFSET = 0x000;
    constexpr uint32_t ENABLES_OFFSET = 0x004;

    constexpr uint32_t MU_IO_REG_OFFSET = 0x040;
    constexpr uint32_t MU_IER_REG_OFFSET = 0x044;
    constexpr uint32_t MU_IIR_REG_OFFSET = 0x048;
    constexpr uint32_t MU_LCR_REG_OFFSET = 0x04C;
    constexpr uint32_t MU_MCR_REG_OFFSET = 0x050;
    constexpr uint32_t MU_LSR_REG_OFFSET = 0x054;
    constexpr uint32_t MU_MSR_REG_OFFSET = 0x058;
    constexpr uint32_t MU_SCRATCH_OFFSET = 0x05C;
    constexpr uint32_t MU_CNTL_REG_OFFSET = 0x060;
    constexpr uint32_t MU_STAT_REG_OFFSET = 0x064;
    constexpr uint32_t MU_BAUD_REG_OFFSET = 0x068;

    constexpr uint32_t SPI0_CNTL0_REG_OFFSET = 0x080;
    constexpr uint32_t SPI0_CNTL1_REG_OFFSET = 0x084;
    constexpr uint32_t SPI0_STAT_REG_OFFSET = 0x088;
    constexpr uint32_t SPI0_IO_REG_OFFSET = 0x090;
    constexpr uint32_t SPI0_PEEK_REG_OFFSET = 0x094;

    constexpr uint32_t SPI1_CNTL0_REG_OFFSET = 0x0C0;
    constexpr uint32_t SPI1_CNTL1_REG_OFFSET = 0x0C4;
    constexpr uint32_t SPI1_STAT_REG_OFFSET = 0x0C8;
    constexpr uint32_t SPI1_IO_REG_OFFSET = 0x0D0;
    constexpr uint32_t SPI1_PEEK_REG_OFFSET = 0x0D4;

    reg32_ptr_t IRQ_ADDR_PTR = AUX_REG_PTR(IRQ_OFFSET);
    reg32_ptr_t ENABLES_ADDR_PTR = AUX_REG_PTR(ENABLES_OFFSET);

    reg32_ptr_t MU_IO_REG_ADDR_PTR = AUX_REG_PTR(MU_IO_REG_OFFSET);
    reg32_ptr_t MU_IER_REG_ADDR_PTR = AUX_REG_PTR(MU_IER_REG_OFFSET);
    reg32_ptr_t MU_IIR_REG_ADDR_PTR = AUX_REG_PTR(MU_IIR_REG_OFFSET);
    reg32_ptr_t MU_LCR_REG_ADDR_PTR = AUX_REG_PTR(MU_LCR_REG_OFFSET);
    reg32_ptr_t MU_MCR_REG_ADDR_PTR = AUX_REG_PTR(MU_MCR_REG_OFFSET);
    reg32_ptr_t MU_LSR_REG_ADDR_PTR = AUX_REG_PTR(MU_LSR_REG_OFFSET);
    reg32_ptr_t MU_MSR_REG_ADDR_PTR = AUX_REG_PTR(MU_MSR_REG_OFFSET);
    reg32_ptr_t MU_SCRATCH_ADDR_PTR = AUX_REG_PTR(MU_SCRATCH_OFFSET);
    reg32_ptr_t MU_CNTL_REG_ADDR_PTR = AUX_REG_PTR(MU_CNTL_REG_OFFSET);
    reg32_ptr_t MU_STAT_REG_ADDR_PTR = AUX_REG_PTR(MU_STAT_REG_OFFSET);
    reg32_ptr_t MU_BAUD_REG_ADDR_PTR = AUX_REG_PTR(MU_BAUD_REG_OFFSET);

    reg32_ptr_t SPI0_CNTL0_REG_ADDR_PTR = AUX_REG_PTR(SPI0_CNTL0_REG_OFFSET);
    reg32_ptr_t SPI0_CNTL1_REG_ADDR_PTR = AUX_REG_PTR(SPI0_CNTL1_REG_OFFSET);
    reg32_ptr_t SPI0_STAT_REG_ADDR_PTR = AUX_REG_PTR(SPI0_STAT_REG_OFFSET);
    reg32_ptr_t SPI0_IO_REG_ADDR_PTR = AUX_REG_PTR(SPI0_IO_REG_OFFSET);
    reg32_ptr_t SPI0_PEEK_REG_ADDR_PTR = AUX_REG_PTR(SPI0_PEEK_REG_OFFSET);

    reg32_ptr_t SPI1_CNTL0_REG_ADDR_PTR = AUX_REG_PTR(SPI1_CNTL0_REG_OFFSET);
    reg32_ptr_t SPI1_CNTL1_REG_ADDR_PTR = AUX_REG_PTR(SPI1_CNTL1_REG_OFFSET);
    reg32_ptr_t SPI1_STAT_REG_ADDR_PTR = AUX_REG_PTR(SPI1_STAT_REG_OFFSET);
    reg32_ptr_t SPI1_IO_REG_ADDR_PTR = AUX_REG_PTR(SPI1_IO_REG_OFFSET);
    reg32_ptr_t SPI1_PEEK_REG_ADDR_PTR = AUX_REG_PTR(SPI1_PEEK_REG_OFFSET);

    void init();
}