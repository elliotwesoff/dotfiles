#!/bin/sh

if [[ $(xrandr -q | grep -w "DP-3 connected") ]]
then
  $HOME/.screenlayout/x1-ext.sh
else
  # only builtin display,
  # no external monitor.
  $HOME/.screenlayout/x1.sh
fi

xrdb -merge ~/.Xresources

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
randr
