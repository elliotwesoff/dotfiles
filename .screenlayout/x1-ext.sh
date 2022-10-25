#!/bin/sh
#
# x1-ext.sh

export XORG_DPI=96
xrandr \
  --output DP-3 --primary --mode 2560x1440 --rate 120 \
  --output eDP-1 --off

