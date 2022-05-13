#!/bin/sh

mv ~/.config ~/.config.old 2> /dev/null
mv ~/.fonts ~/.fonts.old 2> /dev/null
mv ~/.gitconfig ~/.gitconfig.old 2> /dev/null
mv ~/.agignore ~/.agignore.old 2> /dev/null
mv ~/.tmux.conf ~/.tmux.conf.old 2> /dev/null
mv ~/.zshrc ~/.zshrc.old 2> /dev/null

ln -s ~/dotfiles/.config ~/.config
ln -s ~/dotfiles/.fonts ~/.fonts
ln -s ~/dotfiles/.agignore ~/.agignore
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.config/nvim/init.vim ~/.nvimrc

touch ~/.secrets
chmod 600 ~/.secrets

echo done!

