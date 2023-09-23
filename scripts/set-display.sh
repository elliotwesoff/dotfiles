#!/bin/sh
#
# set-display.sh

if [[ $(xrandr -q | grep '^DP-[1-9] connected') ]]
then
  echo $(date) - switching to $(xrandr -q | grep '^DP-[1-9] connected' | cut -d ' ' -f 1) >> /tmp/hdmi-hotplug.log
  export XORG_DPI=96
  # i think &>> redirects stderr to stdout, and appends to the file. i don't remember :(
  sh /home/elliot/dotfiles/.screenlayout/current
else
  echo $(date) switching to eDP-1 >> /tmp/hdmi-hotplug.log
  export XORG_DPI=140
  xrandr --auto
fi

sleep 1
echo Xft.dpi: $XORG_DPI | xrdb

sh /home/elliot/dotfiles/.fehbg

