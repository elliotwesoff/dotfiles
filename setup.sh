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
# curl, wget, gocryptfs, base-devel
#
# 2. Set up grub
#
# 3. Create users:
#   useradd -m -G wheel /bin/bash [user]
#
# 4. Uncomment wheel line in sudoers:
#   EDITOR=vim visudo
#
# 5. Set up gocryptfs
#
# 6. Clone dots:
#   git clone https://github.com/elliotwesoff/dotfiles.git
#
# Post-setup:
#
# 1. Once in a fish shell, update fish_user_paths
#
#   set -U fish_user_paths $HOME/.local/bin $HOME/.cargo/bin $HOME/.asdf/shims
#
# 2. Add user to video group, set group of backlight file to video, chmod to 664
#
# 3. Add user to wheel group, set group of udev files to wheel, chmod to 664
# 

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

# symlink local scripts that need to be in PATH
for item in bspeww elliot eww-toggle hostname switch-mon sxhkd-reload notify-mon dpi
do
  ln -sfv ~/dotfiles/scripts/$item ~/.local/bin/$item
done

# install udev rules
for item in $(ls ~/dotfiles/udev)
do
  sudo ln -sfv ~/dotfiles/udev/$item /etc/udev/rules.d/$item
done

sudo pacman -S \
  xorg-server xorg-xinit xorg-xinput xorg-xsetroot xorg-xev \
  xsecurelock xss-lock xscreensaver \
  mesa mesa-utils vulkan-intel \
  pipewire pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack pipewire-docs wireplumber wireplumber-docs pulsemixer \
  zathura zathura-cb zathura-djvu zathura-pdf-mupdf \
  noto-fonts noto-fontscjk noto-fonts-emoji ttf-hack-nerd \
  bluez bluez-utils blueman \
  pam_mount \
  libnotify \
  xdg-utils \
  cups cups-pdf \
  bspwm sxhkd \
  neovim \
  ly \
  kitty alacritty \
  picom \
  python-pillow \
  rustup \
  fish fisher \
  pdftk \
  rofi \
  feh \
  arandr \
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
  ccls \
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
  ripgrep \
  unclutter \
  qmk

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
  spotify \
  nordvpn-bin \
  rofi-emoji-git \
  cozette-otb \
  tor-browser-bin

# install ruby and python
asdf plugin add ruby && asdf install ruby 3.4.2
asdf plugin add python && asdf install python 3.9.5
asdf reshim

# build and install local packages
cd ~/dotfiles/scripts/auto_display
make prepare && make install

cd ~/dotfiles/services/ellid
make prepare && make install

cd ~/dotfiles

# enable services
sudo systemctl enable NetworkManager.service
sudo systemctl enable ly.service
systemctl --user enable ellid.service --now

# set fish as default shell
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

# install fisher and plugins
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher update

# allow bitmap fonts
sudo rm 70-no-bitmaps-except-emoji.conf
sudo ln -sfv /usr/share/fontconfig/conf.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/70-yes-bitmaps.conf
