#!/usr/bin/env fish
#
# udev-blk.fish
#
# this script is called from /etc/udev/rules.d/50-usb.rules
# with `action` as one of `[add|remove|change]` and blkdev as
# the name/id of the block device. it appends to the output file
# so that any `notify-mon` instance watching the output file
# can pick up on the changes and show a dunst notification.

set action $argv[1]
set blkdev $argv[2]
set output /tmp/udev-blk.log

echo "block device $action: $blkdev" | tee -a $output
