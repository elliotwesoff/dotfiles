#!/bin/sh

# the output name when using the intel video driver and
# the HDMI out is HDMI-1-0, and HDMI-0 when using the
# nvidia drivers. idk man.
if [[ $(xrandr -q | grep -w "HDMI-1-0 connected") ]]
then
  DISPLAYNAME="HDMI-1-0"
elif [[ $(xrandr -q | grep -w "HDMI-0 connected") ]]
then
  DISPLAYNAME="HDMI-0"
else
  # xrandr will ignore outputs that it can't find.
  DISPLAYNAME="NONE"
fi

xrandr \
  --output eDP1 --mode 1920x1080 --rate 144 --pos 2560x360 --rotate normal \
  --output $DISPLAYNAME --primary --mode 2560x1440 --rate 144 --pos 0x0 --rotate normal \
  --output DP-1-4 --off \
  --output DP-1-5 --off \
  --output DP1 --off \
  --output DP2 --off \
  --output VIRTUAL1 --off \
  --output DP-1-0 --off \
  --output DP-1-1 --off \
  --output DP-1-2 --off \
  --output DP-1-3 --off

