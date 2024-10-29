#!/bin/sh
xrandr \
  --output eDP-1 --off \
  --output DP-1 --off \
  --output DP-2 --off \
  --output DP-3 --off \
  --output DP-4 --off \
  --output DP-1-5 --off \
  --output DP-1-6 --off \
  --output DP-1-7 --off \
  --output HDMI-1-1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --rate 144 \
  --output DVI-D-1-1 --off
