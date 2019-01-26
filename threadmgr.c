#define _GNU_SOURCE
#include <sched.h>  //这个头文件以及上面这一行一定要在最前面！！！s

#include "threadmgr.h"
#include "nfsocket.h"
#include "packet.h"
#include <pthread.h>
#include <ucontext.h>
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <errno.h>
#include <unistd.h>
#include <string.h>

void* thread_framework(void* arg){
	//printf("in thread\n");

	thread_para_t *tp = (thread_para_t*)arg;
	nf_connect_and_accept(&tp->sock_fd);
	FuncType f = (FuncType)(tp->fp);
   	printf("before f\n");
	(*f)(tp);
	return NULL;
}

void* thread_framework_two_port(void* arg){
	//printf("in thread\n");

	thread_para_t *tp = (thread_para_t*)arg;
	nf_connect_and_accept(&tp->sock_fd);
	nf_connect_and_accept(&tp->sock_fd_second);
	FuncType f = (FuncType)(tp->fp);
   	printf("before f\n");
	(*f)(tp);
	return NULL;
}

void initial_new_thread(pthread_t *ptid,FuncType fp,char* prev_server_name,char* cur_server_name){
	//printf("in initial %s\n",thread_name);
	thread_para_t *tp = (thread_para_t *)malloc(sizeof(thread_para_t));
	tp->fp = (void*)fp;
	nf_initial(&tp->sock_fd,prev_server_name,cur_server_name);
	
	int r=pthread_create(ptid,NULL,thread_framework,tp);
	if(r!=0)
	{
		printf("create Write Thread error:%s,errno:%d\n",strerror(errno),errno);
		exit(0);
	}
	usleep(300000);	
	
}

void initial_new_thread_two_port(pthread_t *ptid,FuncType fp,char* prev_server_name,char* cur_server_name,char* prev_server_name_second,char* cur_server_name_second){
	//printf("in initial %s\n",thread_name);
	thread_para_t *tp = (thread_para_t *)malloc(sizeof(thread_para_t));
	tp->fp = fp;
	nf_initial(&tp->sock_fd,prev_server_name,cur_server_name);
	nf_initial(&tp->sock_fd_second,prev_server_name_second,cur_server_name_second);
        nf_connect_and_accept(&tp->sock_fd);
	nf_connect_and_accept(&tp->sock_fd_second);
	int r=pthread_create(ptid,NULL,thread_framework_two_port,tp);
	if(r!=0)
	{
		printf("create Write Thread error:%s,errno:%d\n",strerror(errno),errno);
		exit(0);
	}
	usleep(300000);	
	
}


