VERSION := 0.1.4

CC = gcc
CFLAGS = -Wall -g

build_dir := ellid-$(VERSION)

all: ellid

ellid: ellid.o ellid_bat.o
	$(CC) $(CFLAGS) -o ellid ellid.o ellid_bat.o -ludev

ellid.o: ellid.c ellid_bat.h
	$(CC) $(CFLAGS) -c ellid.c -o ellid.o

ellid_bat.o: ellid_bat.c ellid_bat.h
	$(CC) $(CFLAGS) -c ellid_bat.c -o ellid_bat.o

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
	cp ellid_bat.h $(build_dir)
	cp Makefile $(build_dir)
	cp ellid.service $(build_dir)
	tar czvf $(build_dir).tar.gz \
		$(build_dir)/ellid.c \
		$(build_dir)/ellid_bat.c \
		$(build_dir)/ellid_bat.h \
		$(build_dir)/Makefile \
		$(build_dir)/ellid.service

install:
	makepkg -csi
