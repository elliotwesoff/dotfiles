#!/bin/sh

for item in .config .fonts .gitconfig .agignore .tmux.conf .zshrc
do
  echo "moving\t\t~/$item\t=> ~/$item.old"
  mv ~/$item ~/$item.old 2> /dev/null
  echo "symlinking\t~/$item\t=> ~/dotfiles/$item\n"
  ln -s ~/dotfiles/$item ~/$item
done

ln -s ~/dotfiles/.config/nvim/init.vim ~/.nvimrc

touch ~/.secrets
chmod 600 ~/.secrets

echo done!

