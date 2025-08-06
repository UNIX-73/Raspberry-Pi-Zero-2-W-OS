.ifndef __ASM_DEBUG_MACROS__
.set __ASM_DEBUG_MACROS__, 1

.macro __sendln msg
    adrp x0, \msg
    add  x0, x0, :lo12:\msg
    bl sendln
.endm

.endif
