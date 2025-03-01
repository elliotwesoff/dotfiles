#!/usr/bin/env fish
#
# udev-blk.fish

set action $argv[1]
set blkdev $argv[2]
set output /dev/shm/udev-blk.log

echo "block device $action: $blkdev" | tee -a $output
