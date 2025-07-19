#pragma once

extern "C"
{
    // EL1t
    void sync_el1t(void);
    void irq_el1t(void);
    void fiq_el1t(void);
    void serror_el1t(void);

    // EL1h
    void sync_el1h(void);
    void irq_el1h(void);
    void fiq_el1h(void);
    void serror_el1h(void);

    // EL0 64-bit
    void sync_el0_64(void);
    void irq_el0_64(void);
    void fiq_el0_64(void);
    void serror_el0_64(void);

    // EL0 32-bit
    void sync_el0_32(void);
    void irq_el0_32(void);
    void fiq_el0_32(void);
    void serror_el0_32(void);
}
