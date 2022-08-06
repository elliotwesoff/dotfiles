#!/bin/sh

for item in .config .local .fonts .gitconfig .agignore .tmux.conf .zshrc .xinitrc
do
  # echo "moving\t\t~/$item\t=> ~/$item.old"
  mv -v ~/$item ~/$item.old 2> /dev/null
  echo "symlinking\t~/$item\t=> ~/dotfiles/$item\n"
  ln -s ~/dotfiles/$item ~/$item
done

echo "symlinking\t~/.nvimrc => ~/dotfiles/.config/nvim/init.vim"
ln -s ~/dotfiles/.config/nvim/init.vim ~/.nvimrc

# mkdir -p ~/.local/bin
# for script in cbright tp
# do
#   chmod +x ~/dotfiles/scripts/$script
#   ln -s ~/dotfiles/scripts/$script ~/.local/bin/$script
# done
# 
touch ~/.secrets
chmod 600 ~/.secrets

echo done!

