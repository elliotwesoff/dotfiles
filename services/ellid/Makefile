VERSION := 0.1.1

CC = gcc
CFLAGS = -Wall -g

build_dir := ellid-$(VERSION)

all: ellid ellid_bat

ellid: ellid.c 
	$(CC) $(CFLAGS) -o ellid ellid.c

ellid_bat: ellid_bat.c
	$(CC) $(CFLAGS) -o ellid_bat ellid_bat.c -ludev

clean:
	rm -rf ellid $(build_dir) $(build_dir).tar.gz src pkg *.o

install:
	install -Dm755 ellid /usr/bin/ellid
	install -Dm755 ellid_bat /usr/bin/ellid_bat

compress: clean
	mkdir $(build_dir)
	cp ellid.c $(build_dir)
	cp ellid_bat.c $(build_dir)
	cp Makefile $(build_dir)
	tar czvf $(build_dir).tar.gz $(build_dir)/ellid.c $(build_dir)/ellid_bat.c $(build_dir)/Makefile

