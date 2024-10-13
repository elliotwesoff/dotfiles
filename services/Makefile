VERSION := 0.0.1

build_dir := ellid-$(VERSION)

ellid:
	gcc -g ellid.c -o ellid

clean:
	rm -rf $(build_dir) $(build_dir).tar.gz src pkg

install:
	install -Dm755 ellid /usr/bin/ellid

compress: clean
	mkdir $(build_dir)
	cp ellid.c $(build_dir)
	cp Makefile $(build_dir)
	tar czvf $(build_dir).tar.gz $(build_dir)/ellid.c $(build_dir)/Makefile

