#include "profile_count.h"

#include <stdio.h>  
#include <stdlib.h>  
#include <malloc.h>

static int* profile_count;
static int num;

void init_profile(char* metadata_path){
	FILE *fp; 
	fp = fopen(metadata_path,"r");
	if(fp==NULL)  
    	{  
        	printf("File cannot open! " );  
        	exit(0);  
    	}  
	fscanf(fp,"%d",&num);
	profile_count = (int*)malloc(sizeof(int)*num);
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
