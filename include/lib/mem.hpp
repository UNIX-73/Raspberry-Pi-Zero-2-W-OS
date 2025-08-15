#pragma once
#include <stddef.h>

namespace lib::mem
{
	extern "C"
	{
		void *memset(void *dst, int c, size_t n);
		void *memcpy(void *dest, const void *src, size_t n);
		void *memmove(void *dst, const void *src, size_t n);
	}
} // namespace lib::mem