#!/usr/bin/env fish
#
# random_cloud.fish
#
# randomly select a cloud pic, set it to the symlink that
# feh uses to set the background, then have feh set that
# as the new background.

ln -sfv \
  ~/Pictures/wallpapers/clouds/(random choice (ls ~/Pictures/wallpapers/clouds)) \
  ~/Pictures/wallpapers/bg

~/.fehbg
