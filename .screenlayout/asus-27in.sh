#!/bin/sh
#
# framework-ext.sh
xrandr \
  --output eDP-1 --off \
  --output DP-1 --off \
  --output DP-2 --off \
  --output DP-3 --off \
  --output DP-4 --primary --mode 2560x1440 --pos 0x0 --rotate normal --rate 120
