VERSION := 0.1.3

CC = gcc
CFLAGS = -Wall -g

build_dir := ellid-$(VERSION)

all: ellid ellid_bat

ellid: ellid.c 
	$(CC) $(CFLAGS) -o ellid ellid.c

ellid_bat: ellid_bat.c
	$(CC) $(CFLAGS) -o ellid_bat ellid_bat.c -ludev

clean:
	rm -rf \
		ellid \
		ellid_bat \
		src \
		pkg \
		*.o \
		*.out \
		$(build_dir) \
		$(build_dir).tar.gz

prepare: clean
	mkdir $(build_dir)
	cp ellid.c $(build_dir)
	cp ellid_bat.c $(build_dir)
	cp Makefile $(build_dir)
	cp ellid.service $(build_dir)
	tar czvf $(build_dir).tar.gz \
		$(build_dir)/ellid.c \
		$(build_dir)/ellid_bat.c \
		$(build_dir)/Makefile \
		$(build_dir)/ellid.service

install:
	makepkg -csi
