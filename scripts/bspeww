#!/bin/sh
#
# bspeww.sh

function node_callback() {
  echo $1 >> ~/tmp/bspeww/node-change.log
 
  # dump the bspwm world state and pipe it to jq.
  # recursively grab all node names (open programs)
  # for each desktop, concatenate them, and assign
  # them to an array. honestly i don't know how the
  # jq functions work. chatgpt is the real hero here.
  bspc wm -d \
    | jq -c '.monitors[0].desktops[] | .root // {} | [.[] | recurse | select(.instanceName?) | .instanceName] | join("; ")' \
    | jq -c -s . \
    >> ~/tmp/bspeww/desktops/data
}

function desktop_callback() {
  echo $1 >> ~/tmp/bspeww/node-change.log

  # parse the currently selected desktop node from wmtrl -d and write to disk.
  wmctrl -d | grep -F '*' | rev | cut -d ' ' -f 1 | rev >> ~/tmp/bspeww/desktops/selected
}

# kill any prior running services
pkill --echo --full "^bspc\s+subscribe(\s+node_(add|remove|transfer)){3,}"
pkill --echo --full "^bspc\s+subscribe\s+desktop_focus"

mkdir -p ~/tmp/bspeww/desktops

# wait for bspwm to start
sleep 3

bspc subscribe node_add node_remove node_transfer | while read line
do
  node_callback "$line"
done &

bspc subscribe desktop_focus | while read line
do
  desktop_callback "$line"
done &

node_callback "bspeww init"
desktop_callback "bspeww init"
