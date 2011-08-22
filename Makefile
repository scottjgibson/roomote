CFLAGS:=-O2 -Wall $(shell pkg-config --cflags openssl)
LDFLAGS:=-lm -lpthread $(shell pkg-config --libs openssl)
OBJS=socketlib.o roomote.o
all: roomote

roomote: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LDFLAGS)

clean:
	-@rm -rf roomote $(OBJS)


%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@


prefix=/usr/local
install: roomote
	install -D -m 0755 roomote $(DESTDIR)$(prefix)/bin/roomote

.PTHONY: all clean install

.SILENT: clean

