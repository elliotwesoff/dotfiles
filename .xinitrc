#!/bin/sh
#
# .xinitrc

if [[ $(xrandr -q | grep '^DP-[1-9] connected') ]]
then
  export XORG_DPI=96
  # $HOME/dotfiles/.screenlayout/x1-ext.sh
  # $HOME/dotfiles/.screenlayout/framework-ext.sh
  $HOME/dotfiles/.screenlayout/seo-benq.sh
else
  # only builtin display, no external monitor.
  export XORG_DPI=120
  # $HOME/dotfiles/.screenlayout/x1-int.sh
fi

# use .Xresources and set DPI via xrdb because
# setting DPI via xrandr doesn't work.
xrdb -merge ~/dotfiles/.Xresources
echo Xft.dpi: $XORG_DPI | xrdb

export XORG_COLORSCHEME=$(cat ~/.colorscheme)

# disable energy star savings (screen timeout)
xset -dpms &
xset s off &

$HOME/dotfiles/.fehbg &
$HOME/dotfiles/.config/polybar/launch.sh &
sxhkd -c $HOME/dotfiles/.config/sxhkd/sxhkdrc &
sxhkd -c $HOME/dotfiles/.config/sxhkd/bspwm-sxhkdrc &
picom &
dunst &

# show regular mouse pointer instead of stupid X
# https://github.com/baskerville/bspwm/issues/11#issuecomment-9695402
xsetroot -cursor_name left_ptr

exec bspwm

