#!/bin/sh
#
# setup.sh
#
# This script should be ran as the *first* thing you do after installing a
# fresh copy of arch and logging into the tty as your non-root user. Don't do
# anything else beforehand!

# setup dots
mkdir -p ~/code
mkdir -p ~/.local/{bin,share,state}
ln -sfv ~/dotfiles/.config ~/.config
ln -sfv ~/dotfiles/scripts/auto_display/screenlayouts ~/.screenlayout

# files in etc
for item in .Xresources .fehbg .gdbinit .gitconfig .mime.types .tool-versions .xinitrc
do
  # back up old files, if any exist
  mv -v ~/$item ~/$item.old 2> /dev/null

  # symlink home folder level dots to home
  ln -sfv ~/dotfiles/$item ~/$item
done

# symlink local scripts that need to be in PATH
for item in bspeww elliot eww-toggle hostname switch-mon sxhkd-reload
do
  ln -sfv ~/dotfiles/scripts/$item ~/.local/bin/$item
done

# install udev rules
for item in $(ls ~/dotfiles/udev/*.rules)
do
  sudo ln -sfv ~/dotfiles/udev/$item /etc/udev/rules.d/$item
done

# install all the things!
sudo pacman -S \
  base-devel \
  linux linux-lts linux-lts-headers \
  xorg-server xorg-xinit xorg-xinput xorg-xsetroot xorg-xev \
  mesa mesa-utils vulkan-intel \
  pipewire pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack pipewire-docs wireplumber wireplumber-docs pulsemixer \
  networkmanager \
  openvpn networkmanager-openvpn \
  libnotify \
  xdg-utils \
  bluez bluez-utils \
  cups cups-pdf \
  noto-fonts noto-fonts-emoji ttf-hack-nerd \
  bspwm sxhkd \
  vim neovim \
  git \
  kitty alacritty \
  fish fisher \
  zathura zathura-cb zathura-djvu zathura-pdf-mupdf \
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
  gdb \
  ccls \
  lua-language-server \
  pyright \
  libqalculate qalculate-qt \
  font-manager \
  playerctl \
  qmk \
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
  traceroute \
  whois \
  bind \
  usbutils usbview \
  xsecurelock xss-lock xscreensaver \
  p7zip \
  blueman \
  ripgrep \
  vala \
  torbrowser-launcher nyx \
  unclutter

# install yay
sudo pacman -S --needed git base-devel \
  && git clone https://aur.archlinux.org/yay.git \
  && cd yay \
  && makepkg -si

# install all the things not in the pacman repos!
yay -S \
  nvm \
  nvim-packer-git \
  1password \
  discord \
  cava \
  xinit-xsession \
  soulseekqt \
  blight \
  nordvpn-bin \
  otf-intel-one-mono \
  asdf-vm \
  vscode-codicons-git \
  spotify \
  postman-bin \
  intel-opencl-runtime \
  gtk-layer-shell-git \
  eww-x11

# enable services
sudo systemctl enable NetworkManager.service
