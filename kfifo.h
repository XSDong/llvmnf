#ifndef KFIFO
#define KFIFO

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
#define __u32 unsigned long
#define __u64 unsigned long long
 
#if defined(__GNUC__)
#define min(x,y) ({ 		\
        typeof(x) _x = (x); \
        typeof(y) _y = (y);	\
        (void) (&_x == &_y);\
        _x < _y ? _x : _y; })
 
#define max(x,y) ({ 		\
        typeof(x) _x = (x);	\
        typeof(y) _y = (y);	\
        (void) (&_x == &_y);\
        _x > _y ? _x : _y; })
 
#else
#define max(a,b)            (((a) > (b)) ? (a) : (b))
#define min(a,b)            (((a) < (b)) ? (a) : (b))
#endif
 
#define MAX_KFIFO_SIZE 0x1000


#define smp_mb() asm volatile("mfence":::"memory")
#define smp_rmb() asm volatile("lfence":::"memory") 
#define smp_wmb() asm volatile("sfence" ::: "memory")

struct kfifo { 
    unsigned char *buffer; /* the buffer holding the data */ 
    unsigned int size; /* the size of the allocated buffer */ 
    unsigned int in; /* data is added at offset (in % size) */ 
    unsigned int out; /* data is extracted from off. (out % size) */ 
};
 
/**
 * fls - find last bit set
 * @x: the word to search
 *
 * This is defined the same way as ffs:
 * - return 32..1 to indicate bit 31..0 most significant bit set
 * - return 0 to indicate no bits set
 */
#if defined(__GNUC__)
static inline int fls(int x)
{
    int r;
 
    __asm__("bsrl %1,%0\n\t"
            "jnz 1f\n\t"
            "movl $-1,%0\n"
            "1:" : "=r" (r) : "rm" (x));
    return r+1;
}
#else
static inline int fls(int x)
{
	int position;
	int i;
	if(0 != x)
	{
		for (i = (x >> 1), position = 0; i != 0; ++position)
			i >>= 1;
	}
	else
	{
		position = -1;
	}		
	return position+1;
}
#endif
/**
 * fls64 - find last bit set in a 64-bit value
 * @n: the value to search
 *
 * This is defined the same way as ffs:
 * - return 64..1 to indicate bit 63..0 most significant bit set
 * - return 0 to indicate no bits set
 */
static inline int fls64(__u64 x)
{
    __u32 h = x >> 32;
    if (h)
        return fls(h) + 32;
    return fls(x);
}
 
static inline unsigned fls_long(unsigned long l)
{
    if (sizeof(l) == 4)
        return fls(l);
    return fls64(l);
}
 
static inline unsigned long roundup_pow_of_two(unsigned long x)
{
    return 1UL << fls_long(x - 1);
}
 
/**
 * * kfifo_alloc - allocates a new FIFO and its internal buffer
 * * @size: the size of the internal buffer to be allocated.
 * * @gfp_mask: get_free_pages mask, passed to kmalloc()
 * * @lock: the lock to be used to protect the fifo buffer
 * *
 * * The size will be rounded-up to a power of 2.
 * */
struct kfifo *kfifo_alloc(unsigned int size);
 
/**
 * * kfifo_free - frees the FIFO
 * * @fifo: the fifo to be freed.
 * */
void kfifo_free(struct kfifo *fifo);
/**
* __kfifo_put - puts some data into the FIFO, no locking version
* @fifo: the fifo to be used.
* @buffer: the data to be added.
* @len: the length of the data to be added.
*
* This function copies at most @len bytes from the @buffer into
* the FIFO depending on the free space, and returns the number of
* bytes copied.
*
* Note that with only one concurrent reader and one concurrent
* writer, you don't need extra locking to use these functions.
*/
unsigned int __kfifo_put(struct kfifo *fifo,
  const unsigned char *buffer, unsigned int len);
 
/**
* __kfifo_get - gets some data from the FIFO, no locking version
* @fifo: the fifo to be used.
* @buffer: where the data must be copied.
* @len: the size of the destination buffer.
*
* This function copies at most @len bytes from the FIFO into the
* @buffer and returns the number of copied bytes.
*
* Note that with only one concurrent reader and one concurrent
* writer, you don't need extra locking to use these functions.
*/
unsigned int __kfifo_get(struct kfifo *fifo,
  unsigned char *buffer, unsigned int len);
 
/**
* __kfifo_reset - removes the entire FIFO contents, no locking version
* @fifo: the fifo to be emptied.
*/
static inline void __kfifo_reset(struct kfifo *fifo)
{
        fifo->in = fifo->out = 0;
}
 
/**
* __kfifo_len - returns the number of bytes available in the FIFO, no locking version
* @fifo: the fifo to be used.
*/
static inline unsigned int __kfifo_len(struct kfifo *fifo)
{
        return fifo->in - fifo->out;
}

#endif
