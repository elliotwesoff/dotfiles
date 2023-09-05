#!/bin/sh

for item in .config .local .fonts .gitconfig .agignore \
            .tmux.conf .zshrc .xinitrc .screenlayout \
            .mime.types .fehbg .tool-versions
do
  mv -v ~/$item ~/$item.old 2> /dev/null
  ln -sfv ~/dotfiles/$item ~/$item
done

# symlink ~/tmp to the linux-provided in-memory filesystem.
ln -sfv /dev/shm ~/tmp

mkdir -p ~/.local/state
mkdir -p ~/code

# install all the things!
sh ./pacman-setup.sh

# install yay
sudo pacman -S --needed git base-devel \
  && git clone https://aur.archlinux.org/yay.git \
  && cd yay \
  && makepkg -si

# install all the things not in the pacman repos!
sh ./yay-setup.sh

# install eww
cd ~/code \
  && git clone https://github.com/elkowar/eww \
  && cd eww \
  && cargo build --release --no-default-features --features x11 \
  && chmod +x target/release/eww \
  && ln -sf ~/code/eww/target/release/eww ~/.local/bin/eww
