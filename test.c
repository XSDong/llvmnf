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
//#include "aes-128.h"
int aes(char* source_path, char* des_path, int len,int method);
void func();
//int a = 0;

void test(){
     char src[100];
     char dst[100];
     int len = 64;
     for(int i=0;i<len;i++)src[i] = i;
     aes(src,dst,len,1);
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


