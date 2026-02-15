#!/usr/bin/env fish
#
# .xinitrc

# use .Xresources and set DPI via xrdb because
# setting DPI via xrandr doesn't work.
xrdb -merge ~/dotfiles/.Xresources

# select monitor to use based on our super smart ruby script
auto_display

# disable energy star savings (screen timeout)
xset -dpms
xset s off

# always show regular mouse pointer instead of stupid X
# https://github.com/baskerville/bspwm/issues/11#issuecomment-9695402
xsetroot -cursor_name left_ptr

# start background services
sxhkd -c ~/.config/sxhkd/sxhkdrc &
sxhkd -c ~/dotfiles/.config/sxhkd/bspwm-sxhkdrc &
nohup unclutter --timeout 2 --ignore-scrolling > /dev/shm/nohup_unclutter.log &
notify-mon /dev/shm/udev-blk.log udev &
redshift -P -l $LOC_LAT:$LOC_LONG -t 6500:4750 &
config_peripherals &
eww daemon &
dunst &
bspeww &
picom &

# set wallpaper
~/.fehbg &

exec bspwm
