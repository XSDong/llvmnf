#include "nf_pipe.h"

struct kfifo* pipe_pool[100];

//const int WRITE_INDEX = 0;
//const int READ_INDEX = 1;

const int DEFAULT_PIPE_LENGTH = 8;

int cur_allocate_index = 0;

void nf_pipe_pair(int * sv,int len){
	if(len >0){
		pipe_pool[cur_allocate_index] = kfifo_alloc(len);
	}
	else{
		pipe_pool[cur_allocate_index] = kfifo_alloc(DEFAULT_PIPE_LENGTH);
	}
	//pipe_pool[cur_allocate_index][READ_INDEX] = kfifo_alloc(PIPE_LENGTH);
	sv[0] = sv[1] = cur_allocate_index;
	cur_allocate_index++;
}

int nf_pipe_read(int pipe_index,unsigned char* buf,int len){
	if(__kfifo_len(pipe_pool[pipe_index]) < len){
		return -1;
	}
	else{
		__kfifo_get(pipe_pool[pipe_index],buf,len);
		return len;
	}
}

int nf_pipe_write(int pipe_index,unsigned char* buf,int len){
	if(__kfifo_len(pipe_pool[pipe_index]) > DEFAULT_PIPE_LENGTH - len){
		return -1;
	}
	else{
		__kfifo_put(pipe_pool[pipe_index],buf,len);
		return len;
	}
	
}
