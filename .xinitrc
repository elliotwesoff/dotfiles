#!/bin/sh

$HOME/.screenlayout/x1.sh
$HOME/.fehbg &
$HOME/.config/polybar/launch.sh &
sxhkd -c $HOME/.config/sxhkd/sxhkdrc &
sxhkd -c $HOME/.config/sxhkd/bspwm-sxhkdrc &
picom &
dunst &

# show regular mouse pointer instead of stupid X
# https://github.com/baskerville/bspwm/issues/11#issuecomment-9695402
xsetroot -cursor_name left_ptr

# exec berry
exec bspwm

