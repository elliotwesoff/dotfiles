#!/usr/bin/env fish
#
# udev-blk.fish

set identifier $argv[1]
set action $argv[2]
set args $argv[3..]
set output "$type $action: $args"

systemd-cat --identifier=$identifier echo $output
