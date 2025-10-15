clean:
	rm -rf pkg src *.tar.zst

install: clean
	mkdir -pv ~/.config/systemd/user
	makepkg -csi
	cp -fv bspeww_nodes.service ~/.config/systemd/user
	cp -fv bspeww_desktop.service ~/.config/systemd/user
	systemctl --user enable --now bspeww_nodes
	systemctl --user enable --now bspeww_desktop

uninstall:
	yay -R bspeww
	systemctl --user stop bspeww_nodes
	systemctl --user stop bspeww_desktop
	rm -v ~/.config/systemd/user/bspeww_nodes.service
	rm -v ~/.config/systemd/user/bspeww_desktop.service

reinstall: uninstall install
