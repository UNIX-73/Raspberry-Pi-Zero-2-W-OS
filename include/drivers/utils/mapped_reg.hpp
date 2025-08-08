#include <stdint.h>

typedef volatile uint32_t reg32_t;
typedef volatile uint64_t reg64_t;

typedef reg32_t *const reg32_ptr_t;
typedef reg64_t *const reg64_ptr_t;

#define REG32_PTR(base, offset) (reg32_ptr_t)((base) + (offset))
#define REG64_PTR(base, offset) (reg64_ptr_t)((base) + (offset))