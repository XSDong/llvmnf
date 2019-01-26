CC=gcc
 
CFLAGS = -Wall -Werror -std=gnu99 -Wno-missing-braces
 
DEFINE =

INCLUDE = -I.
 
SOURCES = $(wildcard *.c)

RECOMPILED_SOURCE = aes-128.o

OBJS = $(patsubst %.c,%.o,$(SOURCES)) #$(RECOMPILED_SOURCE)

LIBS = -lpthread
 
TARGET = lab 

All:$(OBJS)	
	$(CC) $(OBJS) -o $(TARGET) $(LIBS)
	 
%.o:%.c	
	$(CC) $(CFLAGS) -c $(DEFINE) $(INCLUDE) $< -o $@

#aes-128.o:result.ll
#	/home/dislab/LLVM/build/bin/llc -filetype=obj result.ll -o aes-128.o



clean:		
	rm -f $(OBJS)	
	rm -f $(TARGET)

