#!/usr/bin/env fish
#
# setup.fish

# This script should be ran as the *first* thing you do after installing a
# fresh copy of arch and logging into the tty as your non-root user. Don't do
# anything else beforehand!
#
# Pre-script tasks:
#
# 1. When running the pacstrap command, in addition
# to the minimum recommended packages, also install:
# 
# 	vim, git, ranger, fish, sudo, networkmanager, grub,
# 	efibootmgr, intel-ucode, curl, wget, gocryptfs,
# 	base-devel
#
# 2. Set up grub
#
# 3. Create users:
#
#	$ useradd -m -G wheel /bin/bash [user]
#
# 4. Uncomment wheel line in sudoers:
#
#	$ EDITOR=vim visudo
#
# 5. Set up gocryptfs
#
# 6. Clone dots:
#
#	$ git clone https://github.com/elliotwesoff/dotfiles.git
#
# 7. Set fish as default shell and configure:
#   
#	$ chsh -s $(which fish)
#	$ set -U fish_user_paths $HOME/.local/bin $HOME/.cargo/bin $HOME/.asdf/shims
#
# Post-setup:
#
# 1. Add user to video group, set group of backlight file to video, chmod to 664
#
# 2. Add user to wheel group, set group of udev files to wheel, chmod to 664
#

set user_id (id -u)

if test $user_id -eq 0
	echo "don't run this as root! it's dangerous!!! bye."
	exit 1
end

sudo pacman -S \
	xorg-server xorg-xinit xorg-xinput xorg-xsetroot xorg-xev \
	xsecurelock xss-lock xscreensaver \
	mesa mesa-utils vulkan-intel \
	pipewire pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack pipewire-docs wireplumber wireplumber-docs pulsemixer \
	zathura zathura-cb zathura-djvu zathura-pdf-mupdf \
	noto-fonts noto-fonts-emoji ttf-hack-nerd \
	bluez bluez-utils blueman \
	pam_mount \
	libnotify \
	xdg-utils \
	bspwm sxhkd wmctrl \
	kitty alacritty \
	fish fisher \
	neovim tree-sitter-cli xclip \
	picom \
	rustup \
	pdftk \
	rofi \
	feh \
	arandr \
	ntfs-3g \
	ffmpeg \
	man-db \
	gdb gef \
	libqalculate qalculate-qt \
	btop \
	firefox \
	redshift \
	dunst \
	sxiv \
	flameshot \
	jq \
	usbutils usbview \
	7zip \
	ripgrep \
	unclutter

# install yay
sudo pacman -S --needed git base-devel \
	&& git clone https://aur.archlinux.org/yay.git \
	&& cd yay \
	&& makepkg -si

# install aur packages
yay -S \
	nvm \
	1password \
	discord \
	soulseekqt \
	qbittorrent \
	blight \
	asdf-vm \
	rofi-emoji-git \
	cozette-otb \
	tor-browser-bin

# install ruby and python
asdf plugin add ruby && asdf install ruby latest
asdf plugin add python && asdf install python latest
asdf reshim

# build and install local packages
cd ~/code/dotfiles/scripts/auto_display && make prepare && make install
cd ~/code/dotfiles/services/ellid && make prepare && make install
cd ~/code/dotfiles/services/bspeww && make install
cd ~/code/dotfiles

# enable services
systemctl --user enable ellid.service --now

# allow bitmap fonts
sudo rm /etc/fonts/conf.d/70-no-bitmaps-except-emoji.conf
sudo ln -sfv /usr/share/fontconfig/conf.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/70-yes-bitmaps.conf
