#include "packet.h"
#include "coroutine.h"
#include <pthread.h>
#include <ucontext.h>
#include <stdio.h>


static __thread ucontext_t thread_local_uc;
static __thread ucontext_t* co_ucp;

void init_ucp(ucontext_t *ucp,char* stack_p,void (*func)()){
	getcontext(ucp);
	ucp->uc_stack.ss_sp = stack_p;
	ucp->uc_stack.ss_size = STACK_SIZE;
	makecontext(ucp, func, 0);	
}

void co_call(ucontext_t *ucp){
	co_ucp = ucp;
	if(swapcontext(&thread_local_uc, co_ucp) <0)printf("dive into fail\n ");
}

void yield_return(){
	if(swapcontext(co_ucp, &thread_local_uc) <0)printf("yield return fail\n ");
}

