#!/bin/sh
#
# .xinitrc

export XORG_COLORSCHEME=$(cat ~/.local/state/colorscheme)

if [[ "$(timedatectl show --property=Timezone)" =~ "Europe/Berlin" ]]
then
  # munich
  export LOC_LAT=48.14803580815556
  export LOC_LONG=11.588875333597782
else
  # surf beach
  export LOC_LAT=34.6831139
  export LOC_LONG=-120.6232676
fi

# use .Xresources and set DPI via xrdb because
# setting DPI via xrandr doesn't work.
xrdb -merge ~/dotfiles/etc/.Xresources

# select monitor to use based on our super smart ruby script
ruby $HOME/dotfiles/scripts/activate_display.rb

# disable energy star savings (screen timeout)
xset -dpms &
xset s off &
xset r rate 250 75

env XSECURELOCK_PASSWORD_PROMPT=time_hex \
    XSECURELOCK_SAVER=saver_xscreensaver \
    XSECURELOCK_SHOW_DATETIME=1 \
    XSECURELOCK_SHOW_KEYBOARD_LAYOUT=0 \
    XSECURELOCK_SHOW_HOSTNAME=1 \
    XSECURELOCK_SHOW_USERNAME=1 \
    xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock &

# always show regular mouse pointer instead of stupid X
# https://github.com/baskerville/bspwm/issues/11#issuecomment-9695402
xsetroot -cursor_name left_ptr

# start background services
sxhkd -c $HOME/dotfiles/.config/sxhkd/sxhkdrc &
sxhkd -c $HOME/dotfiles/.config/sxhkd/bspwm-sxhkdrc &
redshift -P -l $LOC_LAT:$LOC_LONG -t 6500:4750 &
dunst &
eww daemon &
~/dotfiles/services/bin/ellimon &
# picom &
# oneko &

$HOME/.fehbg &
elliot setvol &
bspeww &

exec bspwm

