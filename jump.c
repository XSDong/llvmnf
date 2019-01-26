#include "jump.h"
#include "coroutine.h"
#include <stdio.h>

//static int i = 0;

void jump(int total,int i){	
	//printf("in jump %d %d\n",i,total);
	
	if(total == -1)yield_return();
	else if(i == total)yield_return();
}
