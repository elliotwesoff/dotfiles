#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mv ~/.config ~/.config.old 2> /dev/null
mv ~/.fonts ~/.fonts.old 2> /dev/null
mv ~/.gitconfig ~/.gitconfig.old 2> /dev/null
mv ~/.tmux.conf ~/.tmux.conf.old 2> /dev/null
mv ~/.zshrc ~/.zshrc.old 2> /dev/null

ln -s $SCRIPT_DIR/.config ~/.config
ln -s $SCRIPT_DIR/.fonts ~/.fonts
ln $SCRIPT_DIR/.gitconfig ~/.gitconfig
ln $SCRIPT_DIR/.tmux.conf ~/.tmux.conf
ln $SCRIPT_DIR/.zshrc ~/.zshrc
ln -s $SCRIPT_DIR/.config/nvim/init.vim ~/.nvimrc 

echo done!
