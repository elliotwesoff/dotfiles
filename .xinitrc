#!/bin/sh
#
# .xinitrc

# use .Xresources and set DPI via xrdb because
# setting DPI via xrandr doesn't work.
xrdb -merge ~/dotfiles/.Xresources
$HOME/dotfiles/scripts/hdmi-hotplug.sh

export XORG_COLORSCHEME=$(cat ~/.local/state/colorscheme)

# disable energy star savings (screen timeout)
xset -dpms &
xset s off &

$HOME/dotfiles/.fehbg &
sxhkd -c $HOME/dotfiles/.config/sxhkd/sxhkdrc &
sxhkd -c $HOME/dotfiles/.config/sxhkd/bspwm-sxhkdrc &
dunst &
xscreensaver --no-splash &
# oneko &

# surf beach, ca
redshift -P -l 34.6831139:-120.6232676 -t 6500:4750 &
# munich, de
# redshift -P -l 48.14803580815556:11.588875333597782 -t 6500:4750 &

# show regular mouse pointer instead of stupid X
# https://github.com/baskerville/bspwm/issues/11#issuecomment-9695402
xsetroot -cursor_name left_ptr

# increase repeat speed when key is held,
# and decrease delay before repeat.
# xset r rate [delay] [repeat rate]
# xset r rate 200 55
# wwwwwwwwwweeeeeeeeeeeeeeeeeeeeeee!!!!!
xset r rate 250 75

# write the current volume values for eww
elliot setvol &

exec bspwm

