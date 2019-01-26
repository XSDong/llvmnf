#ifndef PACKET_H
#define PACKET_H
#include <ucontext.h>
#include <sys/time.h>

#define PACKET_SIZE (16*32*2)
#define STACK_SIZE (1024*1024*10)
typedef struct packet_t{
	char buf[PACKET_SIZE];
	char stack[STACK_SIZE];
        ucontext_t uc;
	int count;
	struct timeval start_time;
	struct timeval end_time;
	//ucontext_t ucm;
}packet_t;
packet_t* instantiate_packet(void);
void destroy_packet(packet_t*p);
void cal_time_start(packet_t *p);
void cal_time_end(packet_t *p);

#endif
