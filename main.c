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
#include "test.h"
#include "profile_count.h"
#include "coroutine.h"

long long count_send = 0;
long long count_recv = 0;
unsigned long long time_min = ULLONG_MAX;
unsigned long long time_max = 0;
unsigned long long time_avg = 0;
unsigned long long time_num = 0;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

//pthread_key_t g_key;
//void packet_sender(nfsocket* nf);
//void packet_receiver(nfsocket* nf);
void packet_sender(node* tp);
void packet_receiver(node* tp);
//void test();
void aes_128_first(node* nf);
void router(node* tp);
void aes_128_one(node* tp);
void aes_128_two(node* tp);
void aes_mutex(node* tp);
//void aes_128_second(nfsocket* nf);
//void test();
//void produced_test();

void para_topology_construct();
void single_topology_construct();
void two_serial_topology();
void two_para_topology();
void router_aes_serial_topology();
void route_aes_para_topology();
void two_serial_llvmnf_topology();
void aes_naive_para_mutex();

int main(int argc,char** argv)
{	
	
	//init_profile("metadata");

	
	single_topology_construct();

	//para_topology_construct();
	//two_serial_topology();
	//two_para_topology();
	//router_aes_serial_topology();
  	//route_aes_para_topology();

//two_serial_llvmnf_topology();

	//aes_naive_para_mutex();
	/*set_cpu(tid[0],0);
	set_cpu(tid[1],1);
	set_cpu(tid[2],2);
	set_cpu(tid[3],3);
	int i = 0;
	for(i=0;i<6;i++)set_multi_cpu(tid[i]);*/
	while(1){
		sleep(1);
		printf("send:%lld,recv:%lld,max:%llu,min:%llu,avg:%llu\n",
			count_send,count_recv,time_max,time_min,time_avg);
		count_send = 0;
		count_recv = 0;
		time_min = ULLONG_MAX;
		time_max = 0;
		time_avg = 0;
		time_num = 0;
	}

	//pthread_join(tid[0],NULL);
	//pthread_join(tid[1],NULL);
	return 0;
}


void aes_naive_para_mutex(){
	node* sender = create_node(packet_sender);
	node* receiver = create_node(packet_receiver);
	node* para_content1 = create_node(aes_mutex);
	node* para_content2 = create_node(aes_mutex);
	
	create_pipe(sender,para_content1);
	create_pipe(sender,para_content2);
	create_pipe(para_content1,receiver);
	create_pipe(para_content2,receiver);

	pthread_t tid[4];
	node_create_thread(&tid[0],sender);
	node_create_thread(&tid[1],receiver);
	node_create_thread(&tid[2],para_content1);
	node_create_thread(&tid[3],para_content2);
        
	for(int i=0;i<4;i++)set_cpus(tid[i],1,i);	
}

void router_aes_serial_topology(){
	node* sender = create_node(packet_sender);
	node* receiver = create_node(packet_receiver);
	node* serial_content1 = create_node(router);
	node* serial_content2 = create_node(aes_128_first);	

	create_pipe(sender,serial_content1);
	create_pipe(serial_content1,serial_content2);
	create_pipe(serial_content2,receiver);

	pthread_t tid[4];
	node_create_thread(&tid[0],sender);
	node_create_thread(&tid[1],receiver);
	node_create_thread(&tid[2],serial_content1);
	node_create_thread(&tid[3],serial_content2);

	for(int i=0;i<4;i++){
		set_cpus(tid[i],1,i);
	}
}

void route_aes_para_topology(){
	node* sender = create_node(packet_sender);
	node* receiver = create_node(packet_receiver);
	node* serial_content1 = create_node(router);
	node* serial_content1_para = create_node(router);
	node* serial_content2 = create_node(aes_128_first);
	node* serial_content2_para = create_node(aes_128_first);

	create_pipe(sender,serial_content1);
	create_pipe(sender,serial_content1_para);
	create_pipe(serial_content1,serial_content2);
	create_pipe(serial_content1_para,serial_content2_para);
	create_pipe(serial_content2,receiver);
	create_pipe(serial_content2_para,receiver);

	pthread_t tid[6];
	node_create_thread(&tid[0],sender);
	node_create_thread(&tid[1],receiver);
	node_create_thread(&tid[2],serial_content1);
	node_create_thread(&tid[3],serial_content2);
	node_create_thread(&tid[4],serial_content1_para);
	node_create_thread(&tid[5],serial_content2_para);

	set_cpus(tid[0],1,0);
	set_cpus(tid[1],1,1);
	for(int i=2;i<6;i++){
		set_cpus(tid[i],2,2,3);
	}	
}


void two_serial_llvmnf_topology(){
	node* sender = create_node(packet_sender);
	node* receiver = create_node(packet_receiver);
	node* serial_content1 = create_node(aes_128_one);
	node* serial_content2 = create_node(aes_128_two);

	create_pipe(sender,serial_content1);
	create_pipe(serial_content1,serial_content2);
	create_pipe(serial_content2,receiver);

	pthread_t tid[4];
	node_create_thread(&tid[0],sender);
	node_create_thread(&tid[1],receiver);
	node_create_thread(&tid[2],serial_content1);
	node_create_thread(&tid[3],serial_content2);

	for(int i=0;i<4;i++){
		set_cpus(tid[i],1,i*2);
	}
}

void two_serial_topology(){
	node* sender = create_node(packet_sender);
	node* receiver = create_node(packet_receiver);
	node* serial_content1 = create_node(aes_128_first);
	node* serial_content2 = create_node(aes_128_first);

	create_pipe(sender,serial_content1);
	create_pipe(serial_content1,serial_content2);
	create_pipe(serial_content2,receiver);

	pthread_t tid[4];
	node_create_thread(&tid[0],sender);
	node_create_thread(&tid[1],receiver);
	node_create_thread(&tid[2],serial_content1);
	node_create_thread(&tid[3],serial_content2);

	for(int i=0;i<4;i++){
		set_cpus(tid[i],1,i);
	}
}

void two_para_topology(){
	node* sender = create_node(packet_sender);
	node* receiver = create_node(packet_receiver);
	node* serial_content1 = create_node(aes_128_first);
	node* serial_content1_para = create_node(aes_128_first);;
	node* serial_content2 = create_node(aes_128_first);
	node* serial_content2_para = create_node(aes_128_first);

	create_pipe(sender,serial_content1);
	create_pipe(sender,serial_content1_para);
	create_pipe(serial_content1,serial_content2);
	create_pipe(serial_content1_para,serial_content2_para);
	create_pipe(serial_content2,receiver);
	create_pipe(serial_content2_para,receiver);

	pthread_t tid[6];
	node_create_thread(&tid[0],sender);
	node_create_thread(&tid[1],receiver);
	node_create_thread(&tid[2],serial_content1);
	node_create_thread(&tid[3],serial_content2);
	node_create_thread(&tid[4],serial_content1_para);
	node_create_thread(&tid[5],serial_content2_para);

	set_cpus(tid[0],1,0);
	set_cpus(tid[1],1,1);
	for(int i=2;i<6;i++){
		set_cpus(tid[i],2,2,3);
	}	
}

void para_topology_construct(){
	node* sender = create_node(packet_sender);
	node* receiver = create_node(packet_receiver);
	node* para_content1 = create_node(aes_128_first);
	node* para_content2 = create_node(aes_128_first);
	
	create_pipe(sender,para_content1);
	create_pipe(sender,para_content2);
	create_pipe(para_content1,receiver);
	create_pipe(para_content2,receiver);

	pthread_t tid[4];
	node_create_thread(&tid[0],sender);
	node_create_thread(&tid[1],receiver);
	node_create_thread(&tid[2],para_content1);
	node_create_thread(&tid[3],para_content2);
        
	for(int i=0;i<4;i++)set_cpus(tid[i],2,0,2);	
}

void single_topology_construct(){
	node* sender = create_node(packet_sender);
	node* receiver = create_node(packet_receiver);
	node* content = create_node(aes_128_first);

	create_pipe(sender,content);
	create_pipe(content,receiver);

	pthread_t tid[3];
	node_create_thread(&tid[0],sender);
	node_create_thread(&tid[1],receiver);
	node_create_thread(&tid[2],content);

	set_cpus(tid[0],1,0);
	set_cpus(tid[1],1,2);
	set_cpus(tid[2],1,4);			
}

void packet_sender(node* tp){
	while(1){
		for(int i=0;i<tp->len_output;i++){
			packet_t * p = instantiate_packet();
			cal_time_start(p);
			node_write(tp->sock_output[i],(char*)&p,sizeof(p)); 
			count_send ++;
		}
	}
}

void packet_receiver(node* tp){
	int num = 0;
	while(1){
		for(int i=0;i<tp->len_input;i++){
			packet_t * p;
			node_read(tp->sock_input[i],(char*)&p,sizeof(p));
			cal_time_end(p);
			destroy_packet(p);
			num ++;
			count_recv ++;
		}		
	}
}

void router(node* tp){
	packet_t * p;
	while(1){
		//p = instantiate_packet();
		//printf("aes_first\n");
		node_read(tp->sock_input[0],(char*)&p,sizeof(p));
		//count_send ++;
		char src[64];
		char dst[64];
		for(int i=0;i<64;i++){
			src[i] = dst[i];
			src[i]++;
		}
		//count_recv ++;
		//destroy_packet(p);
		node_write(tp->sock_output[0],(char*)&p,sizeof(p)); 
	}	
}

void aes_mutex(node* tp){
	packet_t * p;
	while(1){
		//p = instantiate_packet();
		//printf("aes_first\n");
		node_read(tp->sock_input[0],(char*)&p,sizeof(p));
		//count_send ++;
		pthread_mutex_lock(&mutex);
		for (int i=0;i<10;i++){

		}
		pthread_mutex_unlock(&mutex);
		produced_test();
		
		//count_recv ++;
		//destroy_packet(p);
		node_write(tp->sock_output[0],(char*)&p,sizeof(p)); 
	}	
}

void aes_128_first(node* tp){
        //thread_local_t tls;
	//t1.nf = &tp->sock_fd;
	//t1.tid = pthread_self();
        //pthread_setspecific(g_key,&t1);
//thread_index = 19;
	packet_t * p;
	while(1){
		//p = instantiate_packet();
		//printf("aes_first\n");
		node_read(tp->sock_input[0],(char*)&p,sizeof(p));
		//count_send ++;

		produced_test();
		//count_recv ++;
		//destroy_packet(p);
		node_write(tp->sock_output[0],(char*)&p,sizeof(p)); 
	}	
}

void aes_128_one(node* tp){
        //thread_local_t tls;
	//t1.nf = &tp->sock_fd;
	////t1.tid = pthread_self();
        //pthread_setspecific(g_key,&t1);
	packet_t * p;
	while(1){
		//p = instantiate_packet();
		//printf("aes_first\n");
		node_read(tp->sock_input[0],(char*)&p,sizeof(p));
		//count_send ++;

		//produced_test();

		init_ucp(&p->uc,p->stack,test);

		co_call(&p->uc);
		//count_recv ++;
		//destroy_packet(p);
		//printf("first return\n");
		node_write(tp->sock_output[0],(char*)&p,sizeof(p)); 
	}	
}

void aes_128_two(node* tp){
        //thread_local_t tls;
	//t2.nf = nf;
	packet_t * p;
	while(1){
		//printf("in aes-128-second\n");
		//sleep(1);
		node_read(tp->sock_input[0],(char*)&p,sizeof(p));
                //tls.packet = p;
		//count_recv ++;
		//p = singlerecv();
		co_call(&p->uc);

		node_write(tp->sock_output[0],(char*)&p,sizeof(p)); 
		//destroy_packet(p);
		//if(swapcontext(&tls.uct, &p->uc) <0)printf("swap fail second\n");
		//nf_write(nf,(char*)&p,sizeof(p)); //这里就是要指针的大小
		//nf_write(tls.nf,(char*)&p,sizeof(p));
	}	
}

/*void aes_128_second(nfsocket* nf){
	t2.nf = nf;
	t2.tid = pthread_self();
        pthread_setspecific(g_key,&t2);
	packet_t * p;
	while(1){
		count_recv ++;
		p = singlerecv();
		t2.packet = p;
		if(swapcontext(&t2.uct, &p->uc) <0)printf("swap fail second\n");
		destroy_packet(p);
	}	
}*/


