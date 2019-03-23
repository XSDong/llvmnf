#ifndef PROFILE_COUNT_H
#define PROFILE_COUNT_H

#define _GNU_SOURCE
#include <sched.h>  //这个头文件以及上面这一行一定要在最前面！！！s
  
#include <signal.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/unistd.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <pthread.h>
#include <errno.h>
#include <string.h>
#include <malloc.h>
#include <ucontext.h>
#include <sys/time.h>
#include <limits.h>
#include "thread_control.h"
#include "cpumgr.h"
#include "packet.h"
#include "node.h"
#include "coroutine.h"


void profile_count_num(int index);
void output_profile_result(char* ptr);
void init_profile(char* metadata_path,const char*_output_file_name);
void close_profile();

void profile_thread_initial(char* metadata_path,
		const char* _output_file_name,void (*func)(node*));
#endif
