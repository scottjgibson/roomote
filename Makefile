CC = /usr/bin/gcc
#CFLAGS = -Wall -o2
CFLAGS = -g
COMPILE = $(CC) $(CFLAGS) -c
OBJFILES := $(patsubst %.c,%.o,$(wildcard *.c))

all: roomote

roomote: $(OBJFILES)
	$(CC) -pg -o roomote $(OBJFILES)

%.o: %.c
	$(COMPILE) -pg -o $@ $<

clean:
	rm -f *.o *.exe roomote

