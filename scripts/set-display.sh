#!/bin/sh
#
# set-display.sh

echo '~/dotfiles/scripts/set-display.sh is DEPRECATED. bye' > /dev/shm/hdmi-hotplug.log
exit 1

echo 'printing from set-display.sh' > /dev/shm/hdmi-hotplug.log

if [[ $(xrandr -q | grep '^DP-[1-9] connected') ]]
then
  echo $(date) - switching to $(xrandr -q | grep '^DP-[1-9] connected' | cut -d ' ' -f 1) >> /dev/shm/hdmi-hotplug.log
  export XORG_DPI=96
  # i think &>> redirects stderr to stdout, and appends to the file. i don't remember :(
  sh /home/elliot/dotfiles/.screenlayout/current
else
  echo $(date) switching to eDP-1 >> /dev/shm/hdmi-hotplug.log
  export XORG_DPI=140
  xrandr --auto
fi

sleep 1
echo Xft.dpi: $XORG_DPI | xrdb

sh /home/elliot/dotfiles/.fehbg

