#!/usr/bin/env sh
#
# hdmi-hotplug.sh

# this script is executed via udev rules when an HDMI cable is plugged in or unplugged.
echo ----- HDMI hotplugged @ $(date) ----- >> /dev/shm/hdmi-hotplug.log
echo running as: $(whoami) >> /dev/shm/hdmi-hotplug.log
echo current PATH: $PATH >> /dev/shm/hdmi-hotplug.log
/usr/local/bin/auto_display &>> /dev/shm/hdmi-hotplug.log
echo ---------------------------------------------------------- >> /dev/shm/hdmi-hotplug.log

