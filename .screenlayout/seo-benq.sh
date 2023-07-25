#!/bin/sh
  # --output eDP-1 --mode 2256x1504 --pos 0x0 --rotate normal \
  # --output DP-4 --primary --mode 1920x1080 --right-of eDP-1 --rotate normal
xrandr \
  --output eDP-1 --off \
  --output DP-1 --off \
  --output DP-2 --off \
  --output DP-3 --primary --mode 1920x1080 --rate "74.97" --rotate normal \
  --output DP-4 --off
  # --output DP-4 --primary --mode 1920x1080 --rotate normal
