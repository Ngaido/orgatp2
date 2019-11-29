CFLAGS := -m32 -g -Og -std=c99 -Wall -Wextra
CFLAGS += -fno-pic -fno-omit-frame-pointer -no-pie
ASFLAGS = $(CFLAGS)

ASMS := $(wildcard *.S)
SRCS := $(wildcard *.c)

PROG := $(ASMS:%.S=%)
PROG += $(ASMS:%.c=%)



all: $(PROG)
sys_%: sys_%.S
	$(CC) $(ASFLAGS) $(CPPFLAGS) -nostartfiles $< -o $@

clean:
	rm -f $(PROG) *.o core

hello: hello.c lib_exit.c

.PHONY: clean all