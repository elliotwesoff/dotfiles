VERSION := 0.1.5

pkg_name := ellid-$(VERSION)
pkg_dir := build/$(pkg_name)

CC = gcc
CFLAGS = -Wall -g

all: ellid

ellid: ellid.o ellid_bat.o
	$(CC) $(CFLAGS) -o ellid ellid.o ellid_bat.o -ludev

ellid.o: ellid.c ellid_bat.h
	$(CC) $(CFLAGS) -c ellid.c -o ellid.o

ellid_bat.o: ellid_bat.c ellid_bat.h
	$(CC) $(CFLAGS) -c ellid_bat.c -o ellid_bat.o

prepare: clean
	mkdir -p $(pkg_dir)
	cp ellid.c $(pkg_dir)
	cp ellid_bat.c $(pkg_dir)
	cp ellid_bat.h $(pkg_dir)
	cp Makefile $(pkg_dir)
	cp ellid.service $(pkg_dir)
	tar czvf $(pkg_dir).tar.gz \
		$(pkg_dir)/ellid.c \
		$(pkg_dir)/ellid_bat.c \
		$(pkg_dir)/ellid_bat.h \
		$(pkg_dir)/Makefile \
		$(pkg_dir)/ellid.service
	cp $(pkg_dir).tar.gz .

clean:
	rm -rf build pkg src *.tar.gz *tar.zst

install:
	makepkg -csi
