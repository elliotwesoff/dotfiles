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

echo ----- HDMI hotplugged @ $(date) ----- >> /tmp/hdmi-hotplug.log
# sh /home/elliot/dotfiles/scripts/set-display.sh &>> /tmp/hdmi-hotplug.log
# ruby /home/elliot/dotfiles/scripts/activate_display.rb &>> /tmp/hdmi-hotplug.log
/home/elliot/dotfiles/scripts/bin/auto_display &>> /tmp/hdmi-hotplug.log
