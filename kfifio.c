#include "kfifo.h"

unsigned int __kfifo_get(struct kfifo *fifo,
  unsigned char *buffer, unsigned int len)
{
  unsigned int l;
  len = min(len, fifo->in - fifo->out);

  /*
   * Ensure that we sample the fifo->in index -before- we
   * start removing bytes from the kfifo.
   */
  smp_rmb();

  /* first get the data from fifo->out until the end of the buffer */
  l = min(len, fifo->size - (fifo->out & (fifo->size - 1)));
  memcpy(buffer, fifo->buffer + (fifo->out & (fifo->size - 1)), l);

  /* then get the rest (if any) from the beginning of the buffer */
  memcpy(buffer + l, fifo->buffer, len - l);

  /*
   * Ensure that we remove the bytes from the kfifo -before-
   * we update the fifo->out index.
   */
  smp_mb();
  fifo->out += len;

  return len;
}


unsigned int __kfifo_put(struct kfifo *fifo,
  const unsigned char *buffer, unsigned int len)
{
  unsigned int l;
  len = min(len, fifo->size - fifo->in + fifo->out);

  /*
   * Ensure that we sample the fifo->out index -before- we
   * start putting bytes into the kfifo.
   */
  smp_mb();

  /* first put the data starting from fifo->in to buffer end */
  l = min(len, fifo->size - (fifo->in & (fifo->size - 1)));
  memcpy(fifo->buffer + (fifo->in & (fifo->size - 1)), buffer, l);

  /* then put the rest (if any) at the beginning of the buffer */
  memcpy(fifo->buffer, buffer + l, len - l);

  /*
   * Ensure that we add the bytes to the kfifo -before-
   * we update the fifo->in index.
   */
  smp_wmb();
  fifo->in += len;

  return len;
}


void kfifo_free(struct kfifo *fifo)
{
    free(fifo->buffer);
    free(fifo);
}


struct kfifo *kfifo_alloc(unsigned int size)   
{   
    unsigned char *buffer;   
    struct kfifo *fifo;   
  
    /*  
     *       * round up to the next power of 2, since our 'let the indices  
     *            * wrap' tachnique works only in this case.  
     *                 */   
    if (size & (size - 1)) {   
            if(size > 0x80000000)
				return NULL;
            size = roundup_pow_of_two(size);            
        }
  
    buffer = (unsigned char *)malloc(size);   
    if (!buffer)   
        return NULL;   
  
    fifo = (struct kfifo*)malloc(sizeof(struct kfifo));   
  
    if (!fifo)   
    {
         free(buffer);
         return NULL;
    }
 
    fifo->buffer = buffer;
    fifo->size = size;
    fifo->in = fifo->out = 0;
  
    return fifo;   
} 
