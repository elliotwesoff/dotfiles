#!/bin/sh

# remember to recreate your grub config
# after installing linux-lts with:
# $ sudo grub-mkconfig -o /boot/grub/grub.cfg
#
# you should see an lts option when booting
# in addition to the standard linux boot option.

# plasma-meta kde-applications-meta kwin plasma-wayland-session \

sudo pacman -S bspwm \
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
  font-manager

