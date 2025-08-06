#include <boot/exception_level/el1/mmu/mmu.hpp>
#include <drivers/peripherals.hpp>
#include <kernel/io/uart/uart_io.hpp>

#define PAGE_SHIFT 12
#define TABLE_SHIFT 9
#define SECTION_SHIFT (PAGE_SHIFT + TABLE_SHIFT)
#define PAGE_SIZE (1 << PAGE_SHIFT)
#define SECTION_SIZE (1 << SECTION_SHIFT)

#define LOW_MEMORY (2 * SECTION_SIZE)

#define HIGH_MEMORY 0x40000000
#define PAGING_MEMORY (HIGH_MEMORY - LOW_MEMORY)
#define PAGING_PAGES (PAGING_MEMORY / PAGE_SIZE)

#define TD_VALID (1 << 0)
#define TD_BLOCK (0 << 1)
#define TD_TABLE (1 << 1)
#define TD_ACCESS (1 << 10)
#define TD_KERNEL_PERMS (1L << 54)
#define TD_INNER_SHARABLE (3 << 8)

#define TD_KERNEL_TABLE_FLAGS (TD_TABLE | TD_VALID)
#define TD_KERNEL_BLOCK_FLAGS (TD_ACCESS | TD_INNER_SHARABLE | TD_KERNEL_PERMS | (MATTR_NORMAL_NC_INDEX << 2) | TD_BLOCK | TD_VALID)
#define TD_DEVICE_BLOCK_FLAGS (TD_ACCESS | TD_INNER_SHARABLE | TD_KERNEL_PERMS | (MATTR_DEVICE_nGnRnE_INDEX << 2) | TD_BLOCK | TD_VALID)

#define MATTR_DEVICE_nGnRnE 0x0
#define MATTR_NORMAL_NC 0x44
#define MATTR_DEVICE_nGnRnE_INDEX 0
#define MATTR_NORMAL_NC_INDEX 1
#define MAIR_EL1_VAL ((MATTR_NORMAL_NC << (8 * MATTR_NORMAL_NC_INDEX)) | MATTR_DEVICE_nGnRnE << (8 * MATTR_DEVICE_nGnRnE_INDEX))

#define ID_MAP_PAGES 6
#define ID_MAP_TABLE_SIZE (ID_MAP_PAGES * PAGE_SIZE)
#define ENTRIES_PER_TABLE 512
#define PGD_SHIFT (PAGE_SHIFT + 3 * TABLE_SHIFT)
#define PUD_SHIFT (PAGE_SHIFT + 2 * TABLE_SHIFT)
#define PMD_SHIFT (PAGE_SHIFT + TABLE_SHIFT)
#define PUD_ENTRY_MAP_SIZE (1 << PUD_SHIFT)

#define BLOCK_SIZE 0x40000000

#define MMU_MAP_RAM_END 0x20000000     // 512 MiB
#define MMU_MAP_PERIPHERALS 0x40000000 // hasta 1 GiB cubre también 0x3Fxxxxxx
#define MMU_IDENTITY_MAP_UP_TO MMU_MAP_PERIPHERALS

void create_table_entry(uint64_t tbl, uint64_t next_tbl, uint64_t va, uint64_t shift, uint64_t flags)
{
    uint64_t table_index = va >> shift;
    table_index &= (ENTRIES_PER_TABLE - 1);
    uint64_t descriptor = next_tbl | flags;
    *((uint64_t *)(tbl + (table_index << 3))) = descriptor;
}

void create_block_map(uint64_t pmd, uint64_t vstart, uint64_t vend, uint64_t pa)
{
    vstart >>= SECTION_SHIFT;
    vstart &= (ENTRIES_PER_TABLE - 1);

    vend >>= SECTION_SHIFT;
    vend--;
    vend &= (ENTRIES_PER_TABLE - 1);

    pa >>= SECTION_SHIFT;
    pa <<= SECTION_SHIFT;

    do
    {
        uint64_t _pa = pa;

        if (pa >= DEVICE_START)
        {
            _pa |= TD_DEVICE_BLOCK_FLAGS;
        }
        else
        {
            _pa |= TD_KERNEL_BLOCK_FLAGS;
        }

        *((uint64_t *)(pmd + (vstart << 3))) = _pa;
        pa += SECTION_SIZE;
        vstart++;
    } while (vstart <= vend);
}

void init_el1_mmu_table()
{
    kernel::io::uart::uart_io::sendln("init_el1_mmu_table start");

    uint64_t id_pgd = __id_pgd_addr();

    memzero(id_pgd, ID_MAP_TABLE_SIZE);

    uint64_t map_base = 0;
    uint64_t tbl = id_pgd;
    uint64_t next_tbl = tbl + PAGE_SIZE;

    create_table_entry(tbl, next_tbl, map_base, PGD_SHIFT, TD_KERNEL_TABLE_FLAGS);

    tbl += PAGE_SIZE;
    next_tbl += PAGE_SIZE;

    uint64_t block_tbl = tbl;

    uint64_t total_map_size = MMU_IDENTITY_MAP_UP_TO;
    uint64_t num_blocks = total_map_size / BLOCK_SIZE;

    for (uint64_t i = 0; i < num_blocks; i++)
    {
        create_table_entry(tbl, next_tbl, map_base, PUD_SHIFT, TD_KERNEL_TABLE_FLAGS);

        next_tbl += PAGE_SIZE;
        map_base += PUD_ENTRY_MAP_SIZE;

        block_tbl += PAGE_SIZE;

        uint64_t offset = BLOCK_SIZE * i;
        create_block_map(block_tbl, offset, offset + BLOCK_SIZE, offset);
    }

    kernel::io::uart::uart_io::sendln("init_el1_mmu_table end");
}