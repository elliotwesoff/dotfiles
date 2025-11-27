clean:
	rm -rf pkg src *.tar.zst

install: clean
	makepkg -csi

uninstall:
	yay -R bspeww

reinstall: uninstall install
