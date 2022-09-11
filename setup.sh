#!/bin/sh

for item in .config .local .fonts .gitconfig .agignore .tmux.conf .zshrc .xinitrc .screenlayout
do
  echo "symlinking\t~/$item\t=> ~/dotfiles/$item\n"
  mv -v ~/$item ~/$item.old 2> /dev/null
  ln -s ~/dotfiles/$item ~/$item
done

touch ~/.secrets
chmod 600 ~/.secrets

echo home dir setup complete. installing programs next
echo installing pacman packages...

sudo pacman -Sy bspwm \
  xorg-server \
  xorg-xinit \
  mesa \
  neovim \
  sxhkd \
  picom \
  vivaldi \
  tmux \
  rofi \
  arandr \
  wget \
  nautilus \
  libnotify \
  xev \
  xorg-xev \
  vulkan-intel \
  pipewire \
  pipewire-docs \
  wireplumber \
  wireplumber-docs \
  alsa-utils \
  alsa-firmware \
  vivaldi-ffmpeg-codecs \
  ffmpeg \
  pavucontrol \
  pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-jack \
  alsa-utils \
  lib32-mesa \
  mesa-utils \
  man-db \
  sway \
  gdb \
  ccls \
  libqalculate qalculate-qt \
  vscode \
  libreoffice-fresh \
  gnome-control-center

echo installing pacman packages...

yay -Sy nvim-packer-git \
  noto-fonts-emoji \
  pulseaudio-control \
  river \
  nvm \
  1password \
  discord \
  codelite

