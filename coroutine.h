#ifndef COROUTINE
#define COROUTINE

#include <ucontext.h>

void init_ucp(ucontext_t *ucp,char* stack_p,void (*func)());
void co_call(ucontext_t *ucp);
void yield_return();

#endif
