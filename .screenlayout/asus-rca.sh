#!/bin/sh

xrandr \
  --output eDP-1 --off \
  --output DP-1 --mode 1680x1050 --pos 2560x0 --rotate normal \
  --output DP-2 --off \
  --output DP-3 --off \
  --output DP-4 --primary --mode 2560x1440 --pos 0x0 --rotate normal --rate 144.01
