#ifndef THREADMGR_H
#define THREADMGR_H
#include "nfsocket.h"
#include "packet.h"
#include <pthread.h>
#include <ucontext.h>

//typedef void (*FuncType)(thread_para_t*);

typedef struct thread_para_t{
	void* fp;
	nfsocket sock_fd;
	nfsocket sock_fd_second;
}thread_para_t;

typedef void (*FuncType)(thread_para_t*);



void initial_new_thread(pthread_t *ptid,FuncType fp,char* prev_server_name,char* cur_server_name);
void initial_new_thread_two_port(pthread_t *ptid,FuncType fp,char* prev_server_name,char* cur_server_name,char* prev_server_name_second,char* cur_server_name_second);

#endif
