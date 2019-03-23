#include<stdio.h>
#include <ctype.h>
#include <string.h>
#include <ucontext.h>
#include <pthread.h>
#include <unistd.h>
//#include "aes-128.h"
#include "packet.h"
#include "test.h"
#include "coroutine.h"
#include "ac.h"
//#include "aes-128.h"
int aes(char* source_path, char* des_path, int len,int method);
void func();
//int a = 0;

void router_test(){
	int num = 1000;
	while(num>0){
		num--;
	}
}

void ac_test(){
	ac_match();
	yield_return();
}

void platform_test(){
	for(int i=0;i<600;i++){
		if(i==100) yield_return();
		if(i==400)yield_return();
		//if(i==36)yield_return();
		//if(i==48)yield_return();
		//total_for();
			int num = 800;
		while(num > 0){
			num--;
		}
	}
	yield_return();
}

void test(){
     char src[100];
     char dst[100];
     int len = 64;
     for(int i=0;i<len;i++)src[i] = i;
     router_test();
     aes(src,dst,len,1);
     router_test();
     yield_return();	
     //aes(src,dst,len,1);
     //yield_return();	
}

/*void test_half_aes(){
     char src[100];
     char dst[100];
     int len = 64;
     for(int i=0;i<len;i++)src[i] = i;
     aes_half_return(src,dst,len,1);
     yield_return();	
}*/

void produced_test(){
     //int a = 0;
     char src[100];
     char dst[100];
     int len = 64;
     for(int i=0;i<len;i++)src[i] = i;
     aes(src,dst,len,1);
     //packet_t** pkt_t = pthread_getspecific( g_key );
     //packet_t* pkt = *pkt_t;
     //int b = 50000;
     //for(int i=0;i<10;i++){
	 //b = 1000;
	 //printf("%d\n",b);
	// func(&b);
     //}
     //printf("%d\n",b);
}

void func(int* pb){
     while((*pb) > 0)(*pb)--;
     //printf("in function\n");
}


int for_loop_num = 800;
void total_for(){
	int num = for_loop_num;
	while(num > 0){
		num--;
	}	
}
void half_for(){
	int num = for_loop_num/2;
	while(num > 0){
		num--;
	}	
}
void half_return_for(){
	int num = for_loop_num/2;
	while(num > 0){
		num--;
	}
	yield_return();
	num = for_loop_num/2;
	while(num > 0){
		num--;
	}
	yield_return();	
}



