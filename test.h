#ifndef TEST
#define TEST

typedef struct thread_local_t{
	packet_t * packet;
	ucontext_t uct;
}thread_local_t;

void router_test();
void test();
void test_half_aes();
void produced_test();
void ac_test();
void platform_test();

void total_for();
void half_return_for();
void half_for();

#endif
