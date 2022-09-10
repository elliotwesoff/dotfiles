#!/bin/sh

# the output name when using the intel video driver and
# the HDMI out is HDMI-1-0, and HDMI-0 when using the
# nvidia drivers. idk man.
if [[ $(xrandr -q | grep -w "HDMI1 connected") ]]
then
  DISPLAYNAME="HDMI1"
elif [[ $(xrandr -q | grep -w "HDMI-0 connected") ]]
then
  DISPLAYNAME="HDMI-0"
else
  # xrandr will ignore outputs that it can't find.
  DISPLAYNAME="NONE"
fi

xrandr \
  --output eDP-1 --mode 1920x1080 --rate 60 --pos 2560x360 --rotate normal \
  --output $DISPLAYNAME --primary --auto --rate 60 --pos 0x0 --rotate normal

