#!/bin/sh
#
# hdmi-hotplug.sh
#
# this script is executed via udev rules when an HDMI cable is plugged in or
# unplugged. (maybe also when a USB-C hub with HDMI is hotplugged?) udev rule
# is in /etc/udev/rules.d/95-hdmi-plug.rules.
#
# in case the udev rule is ever lost, the rule is:
# KERNEL=="card0", ACTION=="change", SUBSYSTEMS=="drm", ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/elliot/.Xauthority", RUN+="/home/elliot/dotfiles/scripts/hdmi-hotplug.sh"

echo HDMI hotplugged @ $(date) >> /home/elliot/tmp/hdmi-hotplug.log

if [[ $(xrandr -q | grep '^DP-[1-9] connected') ]]
then
  echo switching to external display >> /home/elliot/tmp/hdmi-hotplug.log
  export XORG_DPI=96
  CONNECTED_DISPLAY="$(xrandr -q | grep '^DP-[1-9] connected' | cut -d ' ' -f 1)"
  echo connected display: $CONNECTED_DISPLAY

  # i think &>> redirects stderr to stdout, and appends to the file. i don't remember :(
  sh /home/elliot/dotfiles/.screenlayout/current $CONNECTED_DISPLAY &>> /home/elliot/tmp/hdmi-hotplug.log 
else
  echo switching to internal display >> /home/elliot/tmp/hdmi-hotplug.log
  export XORG_DPI=140
  sh /home/elliot/dotfiles/.screenlayout/framework-int.sh &>> /home/elliot/tmp/hdmi-hotplug.log
fi

echo Xft.dpi: $XORG_DPI | xrdb

sh /home/elliot/dotfiles/.fehbg
