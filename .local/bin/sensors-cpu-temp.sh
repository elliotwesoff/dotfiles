#!/bin/sh
#
# sensors-cpu-temp.sh

temperature=$(sensors | head --lines=3 | tail --lines=1 | cut -d " " -f 5 | cut -c 2-)

echo $temperature

