#ifndef NF_SOCKET
#define NF_SOCKET


typedef struct nfsocket{
	int sock_input;
	int sock_output;
	char* prev_server_name;
	char* cur_server_name;
}nfsocket;

void nf_initial(struct nfsocket* s,char* _prev_server_name,char* _cur_server_name);
void nf_connect_and_accept(struct nfsocket* s);
void nf_connect(struct nfsocket* s);
void nf_accept(struct nfsocket* s);

int nf_write(struct nfsocket*s,char* buf,int len);
int nf_read(struct nfsocket*s,char* buf,int len);


#endif
