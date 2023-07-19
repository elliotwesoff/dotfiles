#!/bin/bash
#
# pactl-volume-listener.sh

pactl subscribe | grep --line-buffered "Event 'new'" | while read line
do
  pactl -f json list \
    | jq -c '.sinks[0] | .volume | { volume_left: .["front-left"].value_percent, volume_right: .["front-right"].value_percent }' \
    &>> ~/.local/state/eww/volumes.json
done
