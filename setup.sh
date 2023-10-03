#!/bin/sh

mkdir -p ~/code
mkdir -p ~/.local/{bin,share,state}

# backup the loop items and create symlinks to files
# in this repository.
for item in .config .fonts .gitconfig .agignore \
            .tmux.conf .zshrc .xinitrc .screenlayout \
            .mime.types .fehbg .tool-versions
do
  mv -v ~/$item ~/$item.old 2> /dev/null
  ln -sfv ~/dotfiles/$item ~/$item
done

# symlink scripts that need to be in PATH
for item in bspeww elliot eww-toggle hostname \
            switch-mon sxhkd-reload take-snapshots \
            theme tp
do
  ln -sfv ~/dotfiles/scripts/$item ~/.local/bin/$item
done

# symlink ~/tmp to the linux-provided in-memory filesystem.
ln -sfv /dev/shm ~/tmp

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
  noto-fonts noto-fonts-emoji \
  bspwm \
  vulkan-intel \
  vim \
  neovim \
  git \
  kitty \
  zsh \
  fish \
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
  thunar \
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
  texlive-core texlab \
  pinta \
  playerctl \
  unrar \
  qmk \
  htop \
  btop \
  firefox \
  rustup \
  rclone \
  xclip \
  redshift \
  dunst \
  sxiv \
  wmctrl \
  dunst \
  flameshot \
  jq \
  traceroute \
  whois \
  bind \
  usbutils \
  usbview \
  xsecurelock \
  xss-lock \
  p7zip \
  blueman \
  ripgrep

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
  intel-opencl-runtime

# install eww
cd ~/code \
  && git clone https://github.com/elkowar/eww \
  && cd eww \
  && cargo build --release --no-default-features --features x11 \
  && chmod +x target/release/eww \
  && ln -sf ~/code/eww/target/release/eww ~/.local/bin/eww
