#include "packet.h"
#include <malloc.h>
#include <stdio.h>
#include "kfifo.h"

extern unsigned long long time_min;
extern unsigned long long time_max;
extern unsigned long long time_avg;
extern unsigned long long time_num;

packet_t p_global; 
struct kfifo* packet_pool;
long long pp_size;

void initial_packet_pool(long long packet_pool_size){
    pp_size = packet_pool_size;
    packet_pool = kfifo_alloc(pp_size);
}

packet_t* instantiate_packet(void){
    packet_t * p;
    if(__kfifo_len(packet_pool) <= 8){
      p = (packet_t*)malloc(sizeof(packet_t));
    }
    else{
	__kfifo_get(packet_pool,(unsigned char*)&p,sizeof(p));
    }
    //packet_t* p = &p_global;
    p->count = 0;
    return p;
    //p->buf = (char*)malloc(PACKET_SIZE);
    //P->stack = (char*)malloc(STACK_SIZE);		
}

void destroy_packet(packet_t *p){
    //free(p->buf);
    //free(p->stack);
    //free(p);
    if(__kfifo_len(packet_pool) >= pp_size-8){
	printf("packet pool expired!\n");
	free(p);
	exit(0);
    }
    __kfifo_put(packet_pool,(unsigned char*)&p,sizeof(p));
}

void cal_time_start(packet_t *p){
    int ret = gettimeofday(&p->start_time,NULL);
    if(ret < 0){
	perror("set start time error\n");
    }
}

void cal_time_end(packet_t *p){
    int ret = gettimeofday(&p->end_time,NULL);
    if(ret < 0){
	perror("set start time error\n");
	return;
    }
    unsigned long long cur = (p->end_time.tv_sec*1000000+p->end_time.tv_usec)-(p->start_time.tv_sec*1000000+p->start_time.tv_usec);
    time_avg = ((time_avg*time_num + cur)/(time_num+1));
    if(cur < time_min){
	time_min = cur;
    }
    if(cur > time_max){
	time_max = cur;
    }	
    time_num ++;
}
