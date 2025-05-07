#!/usr/bin/env sh
#
# hdmi-hotplug.sh

# this script is executed via udev rules when an HDMI cable is plugged in or unplugged.
OUT=/tmp/hdmi-hotplug.log
echo ----- HDMI hotplugged @ $(date) ----- | tee -a $OUT
echo running as: $(whoami) | tee -a $OUT
echo current PATH: $PATH | tee -a $OUT
/usr/local/bin/auto_display | tee -a $OUT
echo ---------------------------------------------------------- | tee -a $OUT

