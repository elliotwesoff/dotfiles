#!/bin/sh
#
# seo-benq.sh

xrandr \
  --output eDP-1 --off \
  --output DP-1 --off \
  --output DP-2 --off \
  --output DP-3 --off \
  --output DP-4 --off \
  --output $1 --primary --mode 1920x1080 --rate "74.97" --rotate normal
