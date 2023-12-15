#!/bin/sh
#
# .xinitrc

# use .Xresources and set DPI via xrdb because
# setting DPI via xrandr doesn't work.
xrdb -merge ~/dotfiles/etc/.Xresources
ruby $HOME/dotfiles/scripts/activate_display.rb

export XORG_COLORSCHEME=$(cat ~/.local/state/colorscheme)

# disable energy star savings (screen timeout)
xset -dpms &
xset s off &
xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock &

# set background image
$HOME/dotfiles/scripts/fehbg &

# start background services
sxhkd -c $HOME/dotfiles/.config/sxhkd/sxhkdrc &
sxhkd -c $HOME/dotfiles/.config/sxhkd/bspwm-sxhkdrc &
dunst &
eww daemon &
picom &
# oneko &

# surf beach, ca
redshift -P -l 34.6831139:-120.6232676 -t 6500:4750 &

# munich, de
# redshift -P -l 48.14803580815556:11.588875333597782 -t 6500:4750 &

# always show regular mouse pointer instead of stupid X
# https://github.com/baskerville/bspwm/issues/11#issuecomment-9695402
xsetroot -cursor_name left_ptr

# increase repeat speed when key is held,
# and decrease delay before repeat.
# xset r rate [delay] [repeat rate]
# wwwwwwwwwweeeeeeeeeeeeeeeeeeeeeee!!!!!
xset r rate 250 75

# write the current volume values for eww
elliot setvol &

bspeww &

exec bspwm

