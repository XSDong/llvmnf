#ifndef TEST
#define TEST

typedef struct thread_local_t{
	packet_t * packet;
	ucontext_t uct;
}thread_local_t;

void test();
void test_half_aes();
void produced_test();

#endif
