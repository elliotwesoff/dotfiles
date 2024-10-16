#!/bin/sh

# setup dots
mkdir -p ~/code
mkdir -p ~/.local/{bin,share,state}
ln -sfv ~/dotfiles/.config ~/.config
ln -sfv ~/dotfiles/.screenlayout ~/.screenlayout

# files in etc
for item in \
  .Xresources \
  .fehbg \
  .gdbinit \
  .gitconfig \
  .mime.types \
  .tool-versions \
  .xinitrc
do
  # back up old files, if any exist
  mv -v ~/$item ~/$item.old 2> /dev/null

  # symlink home folder level dots to home
  ln -sfv ~/dotfiles/$item ~/$item
done

# symlink local scripts that need to be in PATH
for item in bspeww \
  elliot \
  eww-toggle hostname \
  switch-mon \
  sxhkd-reload \
  take-snapshots \
  theme \
  tp  \
  dpi
do
  ln -sfv ~/dotfiles/scripts/$item ~/.local/bin/$item
done

# install all the things!
sudo pacman -S \
  base-devel \
  linux-lts linux-lts-headers \
  xorg-server xorg-xinit xorg-xinput xorg-xsetroot xorg-xev \
  libnotify \
  xdg-utils \
  mesa mesa-utils \
  pipewire pipewire-docs \
  wireplumber wireplumber-docs \
  alsa-utils alsa-firmware \
  pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-jack pavucontrol sof-firmware \
  bluez bluez-utils \
  cups cups-pdf \
  noto-fonts noto-fonts-emoji ttf-hack-nerd \
  bspwm \
  vulkan-intel \
  vim \
  neovim \
  git \
  kitty \
  alacritty \
  fish fisher \
  sxhkd \
  pulsemixer \
  zathura zathura-cb zathura-djvu zathura-pdf-mupdf \
  pdftk \
  tmux \
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
  ncdu \
  ffmpeg \
  man-db \
  gdb \
  ccls \
  lua-language-server \
  pyright \
  libqalculate qalculate-qt \
  font-manager \
  playerctl \
  unrar \
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
  usbutils \
  usbview \
  xsecurelock \
  xss-lock \
  xscreensaver \
  p7zip \
  blueman \
  ripgrep \
  vala \
  openvpn networkmanager-openvpn \
  torbrowser-launcher nyx

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
