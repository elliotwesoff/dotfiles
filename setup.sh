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

echo Applying dark theme as default
$HOME/dotfiles/.local/bin/theme dark

echo home setup complete.

