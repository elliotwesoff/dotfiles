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

# set blue light dimming according to location
redshift -P -l $LOC_LAT:$LOC_LONG -t 6500:4750 &

start-xss-lock &
config_peripherals &
sxhkd -c ~/dotfiles/.config/sxhkd/bspwm-sxhkdrc &
dunst &
eww daemon &
bspeww &
picom &
nohup unclutter -idle 2 > /dev/shm/nohup.out &
notify-mon /dev/shm/udev-blk.log udev &

# set wallpaper
~/.fehbg &

exec bspwm
