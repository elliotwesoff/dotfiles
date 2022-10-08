#!/bin/sh
#
# set-backlight-permissions.sh

sudo chmod 664 /sys/class/backlight/intel_backlight/brightness \
&& sudo chgrp video /sys/class/backlight/intel_backlight/brightness
