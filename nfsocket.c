#define _GNU_SOURCE
#include <sched.h>  //这个头文件以及上面这一行一定要在最前面！！！s

#include <sys/types.h>  
#include <sys/socket.h>  
#include <sys/un.h>  
#include <unistd.h>  
#include <stdlib.h>  
#include <stdio.h>  
#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/times.h>
#include <signal.h>
 
#include <pthread.h>
#include <stdint.h>  
#include <sys/syscall.h>
#include <string.h>
#include <errno.h>
#include "nfsocket.h"




void nf_initial(struct nfsocket* s,char* _prev_server_name,char* _cur_server_name){
	s->prev_server_name = _prev_server_name;
	s->cur_server_name = _cur_server_name;
}

void nf_connect_and_accept(struct nfsocket* s){
	if(s->prev_server_name != NULL){
		nf_connect(s);
	}
	if(s->cur_server_name != NULL){
		nf_accept(s);
	}
}

void nf_connect(struct nfsocket* s){
	s->sock_input = socket(AF_UNIX, SOCK_STREAM | SOCK_NONBLOCK, 0); 
	struct sockaddr_un address;  
	address.sun_family = AF_UNIX;  
	strcpy(address.sun_path, s->prev_server_name); 
	/* connect to the server */  
	int result = connect(s->sock_input, (struct sockaddr *)&address, sizeof(address));  
	if(result == -1)  
	{  
	   perror("connect failed: ");  
	   exit(1);  
	}
}

void nf_accept(struct nfsocket* s){
	unlink(s->cur_server_name); 
	int cur_server_fd = socket(AF_UNIX, SOCK_STREAM, 0); 
	struct sockaddr_un server_addr;  
  	server_addr.sun_family = AF_UNIX;  
  	strcpy(server_addr.sun_path, s->cur_server_name);  
  	/* bind with the local file */  
  	bind(cur_server_fd, (struct sockaddr *)&server_addr, sizeof(server_addr));
 
	listen(cur_server_fd, 5);  
     
  	struct sockaddr_un client_addr;  
  	socklen_t len = sizeof(client_addr);
	
	s->sock_output = accept4(cur_server_fd, (struct sockaddr *)&client_addr, &len,SOCK_NONBLOCK);
}

int nf_read(struct nfsocket*s,char* buf,int len)
{
     ssize_t nread;
     size_t  nleft = len;
     char    *bp = (char *)buf;

     while(nleft > 0)
     {
         if((nread = read(s->sock_input, bp, nleft)) < 0)
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

int nf_write(struct nfsocket*s,char* buf,int len)
{
     ssize_t nwrite;
     size_t  nleft = len;
     char    *bp = (char *)buf;

     while(nleft > 0)
     {
         if((nwrite = write(s->sock_output, bp, nleft)) < 0)
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



