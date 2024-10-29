#!/bin/sh
#
# framework-int.sh

xrandr \
  --dpi 120 \
  --output eDP-1 --primary --mode 2256x1504 \
  --output DP-1 --off \
  --output DP-2 --off \
  --output DP-3 --off \
  --output DP-4 --off
