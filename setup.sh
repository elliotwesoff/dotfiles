#!/bin/sh

for item in .config .local .fonts .gitconfig .agignore .tmux.conf .zshrc .xinitrc .screenlayout
do
  echo "symlinking\t~/$item\t=> ~/dotfiles/$item\n"
  mv -v ~/$item ~/$item.old 2> /dev/null
  ln -s ~/dotfiles/$item ~/$item
done

touch ~/.secrets
chmod 600 ~/.secrets

echo home dir setup complete. installing programs next!

echo 3
sleep 1
echo 2
sleep 1
echo 1

echo installing pacman packages...

sudo pacman -Sy bspwm \
  xorg-server xorg-xinit xorg-xev \
  libxcursor xcursor-themes xdotool \
  mesa lib32-mesa \
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
  vulkan-intel \
  pipewire pipewire-docs \
  wireplumber wireplumber-docs \
  alsa-utils alsa-firmware \
  vivaldi-ffmpeg-codecs \
  ffmpeg \
  pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-jack pavucontrol \
  mesa-utils \
  man-db \
  gdb \
  ccls \
  libqalculate qalculate-qt \
  vscode \
  libreoffice-fresh \
  gnome-control-center \
  maim \
  zathura zathura-cb zathura-djvu zathura-pdf-mupdf \
  sof-firmware \
  imagemagick \
  cmus \
  unzip \
  bpytop

echo installing pacman packages...

echo 3
sleep 1
echo 2
sleep 1
echo 1

yay -Sy nvim-packer-git \
  nvim-packer-git \
  noto-fonts-emoji \
  pulseaudio-control \
  river \
  nvm \
  1password \
  discord \
  codelite \
  spotify

