#define _GNU_SOURCE
#include <sched.h>  //这个头文件以及上面这一行一定要在最前面！！！s

#include <pthread.h>
#include <errno.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>  
#include <stdarg.h>  
#include <string.h> 

int set_cpus(pthread_t ntid,int num,...){
	va_list argptr;
	va_start(argptr,num);
	cpu_set_t mask;
	CPU_ZERO(&mask);
	int t = 0;
	while(num--){
		t = va_arg(argptr,int);
		CPU_SET(t,&mask);
	}
	if(-1 == pthread_setaffinity_np(ntid ,sizeof(mask),&mask))  
	{  
		fprintf(stderr, "pthread_setaffinity_np erro\n");  
		return -1;  
	}  
	return 0; 
}


/*int set_multi_cpu(pthread_t ntid)
{
    cpu_set_t mask;
    CPU_ZERO(&mask);
    
    CPU_SET(0,&mask);
CPU_SET(2,&mask);
CPU_SET(4,&mask);
CPU_SET(8,&mask);
    if(-1 == pthread_setaffinity_np(ntid ,sizeof(mask),&mask))  
    {  
        fprintf(stderr, "pthread_setaffinity_np erro\n");  
        return -1;  
    }  
    return 0;  
}

int set_cpu(pthread_t ntid,int i)  
{  
    cpu_set_t mask;  
    CPU_ZERO(&mask);  
  
    CPU_SET(i,&mask);  
  
    //printf("thread %u, i = %d\n", pthread_self(), i);  
    if(-1 == pthread_setaffinity_np(ntid ,sizeof(mask),&mask))  
    {  
        fprintf(stderr, "pthread_setaffinity_np erro\n");  
        return -1;  
    }  
    return 0;  
} */
