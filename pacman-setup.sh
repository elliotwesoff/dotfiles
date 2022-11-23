#!/bin/sh

# remember to recreate your grub config
# after installing linux-lts with:
# $ sudo grub-mkconfig -o /boot/grub/grub.cfg
#
# you should see an lts option when booting
# in addition to the standard linux boot option.

sudo pacman -S \
  bspwm \
  linux-lts linux-lts-headers \
  neovim \
  git \
  base-devel \
  kitty \
  sxhkd \
  neovim \
  picom \
  vivaldi \
  tmux \
  rofi \
  zsh \
  feh \
  arandr \
  wget \
  deno \
  nautilus \
  polybar \
  ntfs-3g \
  cmus \
  vlc \
  baobab \
  ncdu \
  libnotify \
  xorg-server \
  xorg-xinit \
  mesa \
  xorg-xev \
  vulkan-intel \
  vivaldi-ffmpeg-codecs \
  ffmpeg \
  alsa-utils \
  mesa-utils \
  man-db \
  sway \
  gdb \
  ccls \
  lua-language-server \
  pyright \
  libqalculate qalculate-qt \
  vscode \
  libreoffice-fresh \
  gnome-control-center \
  pipewire pipewire-docs \
  wireplumber wireplumber-docs \
  alsa-utils alsa-firmware \
  pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-jack pavucontrol sof-firmware \
  zathura zathura-cb zathura-djvu zathura-pdf-mupdf \
  ttf-baekmuk \
  deja-dup \
  bluez bluez-utils \
  cups cups-pdf \
  font-manager \
  the_silver_searcher \
  noto-fonts noto-fonts-emoji \
  texlive-core texlab

