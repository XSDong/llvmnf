#define _GNU_SOURCE
#include <sched.h>  //这个头文件以及上面这一行一定要在最前面！！！s

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <errno.h>
#include <unistd.h>
#include <string.h>
#include "node.h"

void* node_thread_framework(void* arg){
	//printf("in thread\n");

	node* nd = (node*)arg;
	(nd->fp)(nd);
	return NULL;
}

void node_create_thread(pthread_t *ptid,node* nd){
	int r=pthread_create(ptid,NULL,node_thread_framework,nd);
	if(r!=0)
	{
		printf("create node Thread error:%s,errno:%d\n",strerror(errno),errno);
		exit(0);
	}
}


