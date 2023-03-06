#!/bin/sh

# remember to recreate your grub config
# after installing linux-lts with:
# $ sudo grub-mkconfig -o /boot/grub/grub.cfg
#
# you should see an lts option when booting
# in addition to the standard linux boot option.

sudo pacman -S \
  linux-lts \
  linux-lts-headers \
  base-devel \
  libnotify \
  xorg-server \
  xorg-xinit \
  mesa \
  mesa-utils \
  pipewire pipewire-docs \
  wireplumber wireplumber-docs \
  alsa-utils alsa-firmware \
  pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-jack pavucontrol sof-firmware \
  bluez bluez-utils \
  cups cups-pdf \
  noto-fonts noto-fonts-emoji \
  bspwm \
  xorg-xev \
  vulkan-intel \
  vim \
  neovim \
  git \
  kitty \
  sxhkd \
  picom \
  vivaldi \
  vivaldi-ffmpeg-codecs \
  zathura zathura-cb zathura-djvu zathura-pdf-mupdf \
  pdftk \
  tmux \
  rofi \
  zsh \
  feh \
  arandr \
  wget \
  deno \
  thunar \
  polybar \
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
  vscode \
  libreoffice-fresh \
  ttf-baekmuk \
  deja-dup \
  font-manager \
  texlive-core texlab \
  pinta \
  playerctl \
  unrar

