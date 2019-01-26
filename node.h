#ifndef NODE_H
#define NODE_H

struct node;
typedef void (*Func)(struct node*);

typedef struct node{
	int sock_input[10];
	int len_input;
	int sock_output[10];
	int len_output;
	Func fp;
}node;

node* create_node(Func fp);
void create_pipe(node* a,node *b);
int node_read(int sockfd,char* buf,int len);
int node_write(int sockfd,char* buf,int len);

#endif
