CC=../build/bin/clang
 
CFLAGS = -Wall -Werror -Wno-missing-braces
 
DEFINE =

INCLUDE = -I.
 
SOURCES = $(wildcard *.c)

RECOMPILED_SOURCE = aes-128.o ac.o

OBJS = $(patsubst %.c,%.o,$(SOURCES)) $(RECOMPILED_SOURCE)

LIBS = -lpthread
 
TARGET = lab 

All:$(OBJS)	
	$(CC) $(OBJS) -o $(TARGET) $(LIBS)
	 
%.o:%.c	
	$(CC) $(CFLAGS) -c $(DEFINE) $(INCLUDE) $< -o $@

#aes-128.o:result.ll
#	/home/dislab/LLVM/build/bin/llc -filetype=obj result.ll -o aes-128.o

aes-128.o:./temp/aes-128.c
	$(CC) $(CFLAGS) -c $(DEFINE) $(INCLUDE) ./temp/aes-128.c -o aes-128.o

#ac.o:./temp/ac.c
#	$(CC) $(CFLAGS) -c $(DEFINE) $(INCLUDE) ./temp/ac.c -o ac.o

#ac.o:ac_profile.ll
#	/home/dislab/LLVM/build/bin/llc -filetype=obj ac_profile.ll -o ac.o

ac.o:ac_result.ll
	/home/dislab/LLVM/build/bin/llc -filetype=obj ac_result.ll -o ac.o

clean:		
	rm -f $(OBJS)	
	rm -f $(TARGET)

