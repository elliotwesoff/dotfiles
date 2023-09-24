#!/bin/sh
#
# external-auto.sh

xrandr \
  --output eDP-1 --off \
  --output DP-1 --auto \
  --output DP-2 --auto \
  --output DP-3 --auto \
  --output DP-4 --auto

