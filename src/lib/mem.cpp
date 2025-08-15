#include <lib/mem.hpp>

namespace lib::mem
{
	void *memset(void *dst, int c, size_t n)
	{
		unsigned char *d = (unsigned char *)dst;
		unsigned char v = (unsigned char)c;
		for (size_t i = 0; i < n; ++i)
			d[i] = v;
		return dst;
	}

	void *memcpy(void *dst, const void *src, size_t n)
	{
		unsigned char *d = (unsigned char *)dst;
		const unsigned char *s = (const unsigned char *)src;
		for (size_t i = 0; i < n; ++i)
			d[i] = s[i];
		return dst;
	}

	void *memmove(void *dst, const void *src, size_t n)
	{
		unsigned char *d = (unsigned char *)dst;
		const unsigned char *s = (const unsigned char *)src;
		if (d == s || n == 0)
			return dst;
		if (d < s)
		{
			for (size_t i = 0; i < n; ++i)
				d[i] = s[i];
		}
		else
		{
			for (size_t i = n; i-- > 0;)
				d[i] = s[i];
		}
		return dst;
	}
} // namespace lib::mem