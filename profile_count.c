#include "profile_count.h"

#include <stdio.h>  
#include <stdlib.h>  
#include <malloc.h>

static int* profile_count;
static int num;
char output_file_name[1000];

const int CountNum = 100;

extern long long count_send;
extern long long count_recv;

void profile_packet_sender(node* tp){
	int count_num = CountNum;
	while(1){
		if(count_num > 0){
			//for(int i=0;i<tp->len_output;i++){
				packet_t * p = instantiate_packet();
			//cal_time_start(p);
				node_write(tp->sock_output[0],(char*)&p,sizeof(p)); 
			//node_write(tp->sock_output[i],(char*)&p,sizeof(p)); 
			//count_send ++;
			//}
			count_num --;
		}
	}
}

void profile_packet_receiver(node* tp){
	int count_num = CountNum;
	while(1){
		if(count_num > 0){
			//for(int i=0;i<tp->len_input;i++){
				packet_t * p;
				node_read(tp->sock_input[0],(char*)&p,sizeof(p));
			//node_read(tp->sock_input[i],(char*)&p,sizeof(p));
			//cal_time_end(p);
				destroy_packet(p);
			//count_recv ++;
			//}
			count_num --;
		}
		else{
			output_profile_result(output_file_name);
			exit(0);	
		}		
	}
}

void profile_thread_initial(char* metadata_path,
		const char* _output_file_name,void (*func)(node*)){
	init_profile(metadata_path,_output_file_name);

	node* sender = create_node(profile_packet_sender);
	node* receiver = create_node(profile_packet_receiver);
	node* content = create_node(func);

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


void init_profile(char* metadata_path,const char*_output_file_name){
	FILE *fp; 
	fp = fopen(metadata_path,"r");
	if(fp==NULL)  
    	{  
        	printf("File cannot open! " );  
        	exit(0);  
    	}  
	fscanf(fp,"%d",&num);
	//printf("num is %d:\n",num);
	profile_count = (int*)malloc(sizeof(int)*num);
	for(int i=0;i<num;i++){
		profile_count[i] = 0;
	}

	strcpy(output_file_name,_output_file_name);
}

void close_profile(){
	free(profile_count);
}

void profile_count_num(int index){
	profile_count[index] ++;
}

void output_profile_result(char* ptr){
	FILE *fp; 
	fp = fopen(ptr,"w");
	if(fp==NULL)  
    	{  
        	printf("File cannot open! " );  
        	exit(0);  
    	}  
	for(int i=0;i<num;i++){
		fprintf(fp,"%d\n",profile_count[i]); 
	}
	fclose(fp);
}
