#!/bin/sh

# $HOME/.screenlayout/thunderbolt.sh &
$HOME/.fehbg &
$HOME/.config/polybar/launch.sh &
sxhkd -c $HOME/.config/sxhkd/bspwm-sxhkdrc &
picom &
dunst &

#
# f.lux locations
#

# los angeles
# xflux -z 91016 &

# munich
xflux -l 48 -g 11 &

# show regular mouse pointer instead of stupid X
# https://github.com/baskerville/bspwm/issues/11#issuecomment-9695402
xsetroot -cursor_name left_ptr

# exec berry
exec bspwm

