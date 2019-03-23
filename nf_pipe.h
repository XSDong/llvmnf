#ifndef NF_PIPE
#define NF_PIPE
#include "kfifo.h"
void nf_pipe_pair(int * sv,int len);
int nf_pipe_read(int pipe_index,unsigned char* buf,int len);
int nf_pipe_write(int pipe_index,unsigned char* buf,int len);

#endif
