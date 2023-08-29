#!/bin/sh

for item in .config .local .fonts .gitconfig .agignore .tmux.conf .zshrc .xinitrc .screenlayout
do
  echo "symlinking\t~/$item\t=> ~/dotfiles/$item\n"
  mv -v ~/$item ~/$item.old 2> /dev/null
  ln -s ~/dotfiles/$item ~/$item
done

touch ~/.secrets
chmod 600 ~/.secrets

mkdir -p ~/.local/state
mkdir -p ~/code

# symlink ~/tmp to the linux-provided in-memory filesystem.
ln -sf /dev/shm ~/tmp

ln -sf ~/dotfiles/.fehbg ~/.fehbg

# install all the things!
sh ./pacman-setup.sh

# install yay
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# install all the things not in the pacman repos!
sh ./yay-setup.sh

# install eww
cd ~/code
git clone https://github.com/elkowar/eww
cd eww
cargo build --release --no-default-features --features x11
chmod +x target/release/eww
ln -sf ~/code/eww/target/release/eww ~/.local/bin/eww
