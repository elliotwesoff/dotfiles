#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

sxhkd -c $HOME/.config/sxhkd/sxhkdrc &
$HOME/.config/polybar/launch.sh &
$HOME/.fehbg &

# los angeles
# xflux -z 91016 &

# munich
xflux -l 48 -g 11 &

exec berry

