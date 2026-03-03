#!/usr/bin/env fish
#
# notify-mon

# udev can't directly call notify-send (likely because root
# doesn't have a handle on the x11 server), so we tail a
# file from our user session and pass each appended line
# to notify-send as they come in.

set file $argv[1]
set title $argv[2]

# make sure required argument was supplied
if test -z $file
  echo "usage: \$ notify-mon /file/to/tail [title]"
  exit 1
end

tail --lines=0 -F $file | while read --list line
  if test -n $title
    notify-send --urgency=normal "$title" "$line"
  else
    notify-send --urgency=normal "$line"
  end
end
