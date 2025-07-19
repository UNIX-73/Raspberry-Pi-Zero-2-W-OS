.section .text

.global read_el
.type read_el, %function
read_el:
    mrs x0, CurrentEL // Gets el level
    lsr x0, x0, #2 // bits 3:2 have the level (>> 2)
    ret


.globl irq_enable
irq_enable:
    msr daifclr, #2
    ret

.globl irq_disable
irq_disable:
    msr daifset, #2
    ret