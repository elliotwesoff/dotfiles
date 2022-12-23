#!/bin/sh
xrandr \
  --output eDP-1 --mode 2256x1504 --pos 1920x0 --rotate normal \
  --output DP-1 --off \
  --output DP-2 --off \
  --output DP-3 --off \
  --output DP-4 --primary --mode 1920x1080 --pos 0x203 --rotate normal
