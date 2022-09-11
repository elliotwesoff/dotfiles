#!/bin/sh
xrandr --output eDP-1 --mode 2880x1800 --pos 2560x327 --rotate normal \
  --output HDMI-1 --off \
  --output DP-1 --off \
  --output DP-2 --off \
  --output DP-3 --primary --mode 2560x1440 --pos 0x0 --rotate normal --rate 100 \
  --output DP-4 --off
