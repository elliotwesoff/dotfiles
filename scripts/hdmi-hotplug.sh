#!/bin/sh
#
# hdmi-hotplug.sh
#
# this script is executed via udev rules when an
# HDMI cable is plugged in or unplugged. (maybe 
# also when a USB-C hub with HDMI is hotplugged?)
# udev rule is in /etc/udev/rules.d/95-hdmi-plug.rules.

echo HDMI hotplugged @ $(date) >> /home/elliot/tmp/hdmi-hotplug.log

if [[ $(xrandr -q | grep '^DP-[1-9] connected') ]]
then
  echo switching to external display >> /home/elliot/tmp/hdmi-hotplug.log
  sh /home/elliot/dotfiles/.screenlayout/framework-ext.sh &>> /home/elliot/tmp/hdmi-hotplug.log 
else
  echo switching to internal display >> /home/elliot/tmp/hdmi-hotplug.log
  sh /home/elliot/dotfiles/.screenlayout/framework-int.sh &>> /home/elliot/tmp/hdmi-hotplug.log
fi

# why this no worky?
sh /home/elliot/dotfiles/.fehbg
wmctrl -s 0
