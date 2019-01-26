
#include<stdlib.h>
#include<stdio.h>  
#include<string.h>  
#include<sys/types.h>  
#include<stdlib.h>  
#include<unistd.h>  
#include<sys/socket.h> 
#include <errno.h> 
#include <pthread.h>
#include "node.h"


node* create_node(Func fp){
	node* nd = (node*)malloc(sizeof(node));
	nd->fp = fp;
	nd->len_input = 0;
	nd->len_output = 0;
	return nd;
}

void create_pipe(node* a,node *b){
	int sv[2];    
    	if(socketpair(AF_UNIX,SOCK_STREAM,0,sv) < 0)   
    	{  
    		perror("socketpair");  
    		return;  
    	}
	a->sock_output[a->len_output] = sv[0];
	a->len_output ++;
	b->sock_input[b->len_input] = sv[1];
	b->len_input ++;  
}

int node_read(int sockfd,char* buf,int len)
{
     ssize_t nread;
     size_t  nleft = len;
     char    *bp = (char *)buf;

     while(nleft > 0)
     {
         if((nread = read(sockfd, bp, nleft)) < 0)
         {
             if(errno == EINTR){
		 printf("in EINTR\n");
                 nread = 0;
	     }
	     else if(errno == EAGAIN ){ //nonblock 下 EAGAIN不是错误
		 nread = 0;
	     }
             else{
		 printf("read fail error:%s,errno:%d\n",strerror(errno),errno);
                 return -1;
	     }
         }
         else if(nread == 0)
             break;
         nleft -= nread;
         bp    += nread;
	//printf("read left %lu\n",nleft);
	// if(nleft == 0)break;
     }
     return (len - nleft);
}

int node_write(int sockfd,char* buf,int len)
{
     ssize_t nwrite;
     size_t  nleft = len;
     char    *bp = (char *)buf;

     while(nleft > 0)
     {
         if((nwrite = write(sockfd, bp, nleft)) < 0)
         {
             if(errno == EINTR)
                 nwrite = 0;
	     else if(errno == EAGAIN){ //nonblock 下 EAGAIN不是错误
		 nwrite = 0;
	     }
             else{
		 printf("write fail %s : %ld\n",strerror(errno),pthread_self());
                 return -1;
	     }
         }
         else if(nwrite == 0)
             break;
         nleft -= nwrite;
         bp    += nwrite;
	 //printf("write left %lu\n",nleft);
	 //if(nleft == 0)break;
     }
     
     return (len - nleft);
}
