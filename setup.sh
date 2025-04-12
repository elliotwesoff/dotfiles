#!/bin/sh
#
# setup.sh
#
# This script should be ran as the *first* thing you do after installing a
# fresh copy of arch and logging into the tty as your non-root user. Don't do
# anything else beforehand!
#
# Pre-script tasks:
#
# 1. When running the pacstrap command, in addition
# to the minimum recommended packages, also install: vim, git,
# ranger, sudo, networkmanager, grub, efibootmgr, intel-ucode,
# curl, wget
#
# for virtualbox, also: openssh, ufw
#
# 2. Set up grub!
#
# 3. Create users:
#   useradd -m -G wheel /bin/bash [user]
#
# 4. Uncomment wheel line in sudoers:
#   EDITOR=vim visudo
#
# 5. Clone dots:
#   git clone https://github.com/elliotwesoff/dotfiles.git

if [ "$(id -u)" -eq 0 ]; then
    echo "don't run this as root! it's dangerous!!! bye."
    exit 1
fi

# files in etc
for item in .Xresources .fehbg .gitconfig .mime.types .tool-versions .xinitrc .config
do
  # back up old files, if any exist
  mv -v ~/$item ~/$item.old 2> /dev/null

  # symlink home folder level dots to home
  ln -sfv ~/dotfiles/$item ~/$item
done

# setup dots
mkdir -p ~/code
mkdir -p ~/.local/{bin,share,state}
ln -sfv ~/dotfiles/scripts/auto_display/screenlayouts ~/.screenlayout
echo "#!/usr/bin/env fish" > ~/.secrets

# symlink local scripts that need to be in PATH
for item in bspeww elliot eww-toggle hostname switch-mon sxhkd-reload notify-mon
do
  ln -sfv ~/dotfiles/scripts/$item ~/.local/bin/$item
done

# install udev rules
for item in $(ls ~/dotfiles/udev)
do
  sudo ln -sfv ~/dotfiles/udev/$item /etc/udev/rules.d/$item
done

sudo pacman -S \
  base-devel \
  linux linux-lts linux-lts-headers \
  xorg-server xorg-xinit xorg-xinput xorg-xsetroot xorg-xev \
  xsecurelock xss-lock xscreensaver \
  mesa mesa-utils vulkan-intel \
  pipewire pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack pipewire-docs wireplumber wireplumber-docs pulsemixer \
  openvpn networkmanager-openvpn \
  zathura zathura-cb zathura-djvu zathura-pdf-mupdf \
  noto-fonts noto-fonts-emoji ttf-hack-nerd \
  networkmanager \
  libnotify \
  xdg-utils \
  bluez bluez-utils \
  cups cups-pdf \
  bspwm sxhkd \
  vim neovim \
  ly \
  git \
  kitty alacritty \
  fish fisher \
  pdftk \
  rofi \
  feh \
  arandr \
  wget \
  deno \
  thunar gvfs \
  ntfs-3g \
  cmus \
  vlc \
  baobab \
  ffmpeg \
  man-db \
  gdb gef \
  libqalculate qalculate-qt \
  font-manager \
  playerctl \
  btop \
  firefox \
  rustup \
  rclone \
  xclip \
  redshift \
  dunst \
  sxiv \
  wmctrl \
  flameshot \
  jq \
  usbutils usbview \
  7zip \
  blueman \
  ripgrep \
  unclutter

# install yay
sudo pacman -S --needed git base-devel \
  && git clone https://aur.archlinux.org/yay.git \
  && cd yay \
  && makepkg -si

yay -S \
  nvm \
  1password \
  discord \
  soulseekqt \
  blight \
  asdf-vm \
  spotify \
  eww-x11 \
  nordvpn-bin

# enable services
sudo systemctl enable NetworkManager.service
sudo systemctl enable ly.service

# set fish as default shell
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
