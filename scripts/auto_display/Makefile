VERSION := 0.0.8

pkg_name := auto_display-$(VERSION)
pkg_dir := build/$(pkg_name)

all: prepare install

prepare: clean
	mkdir -p $(pkg_dir)
	cp auto_display.rb $(pkg_dir)
	cp hdmi-hotplug.sh $(pkg_dir)
	cp 95-hdmi-plug.rules $(pkg_dir)
	cp -rv screenlayouts $(pkg_dir)
	cp Makefile $(pkg_dir)
	tar czvf $(pkg_dir).tar.gz -C build $(pkg_name)
	cp $(pkg_dir).tar.gz .

clean:
	rm -rf build pkg src *.tar.gz *tar.zst

install:
	makepkg -csi

