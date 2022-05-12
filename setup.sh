#!/bin/sh

SCRIPT_DIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)

mv ~/.config ~/.config.old 2> /dev/null
mv ~/.fonts ~/.fonts.old 2> /dev/null
mv ~/.gitconfig ~/.gitconfig.old 2> /dev/null
mv ~/.agignore ~/.agignore.old 2> /dev/null
mv ~/.tmux.conf ~/.tmux.conf.old 2> /dev/null
mv ~/.zshrc ~/.zshrc.old 2> /dev/null

ln -s $SCRIPT_DIR/.config ~/.config
ln -s $SCRIPT_DIR/.fonts ~/.fonts
ln -s $SCRIPT_DIR/.agignore ~/.agignore
ln -s $SCRIPT_DIR/.gitconfig ~/.gitconfig
ln -s $SCRIPT_DIR/.tmux.conf ~/.tmux.conf
ln -s $SCRIPT_DIR/.zshrc ~/.zshrc

touch ~/.env-vars
chmod 600 ~/.env-vars

echo done!

