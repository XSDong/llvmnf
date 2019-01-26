#include<pthread.h>

#ifndef CPUMGR_H
#define CPUMGR_H

int set_cpus(pthread_t ntid,int num,...);
//int set_multi_cpu(pthread_t ntid);
//int set_cpu(pthread_t ntid,int i);

#endif
