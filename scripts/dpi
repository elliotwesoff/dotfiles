#!/usr/bin/env fish
#
# dpi(.fish)

# set the new DPI in X11
echo Xft.dpi: $argv[1] | xrdb

# restart GUI services
pkill dunst; dunst & disown
pkill -x eww; eww daemon &> /dev/null & disown

# reset wallpaper
~/dotfiles/.fehbg &
