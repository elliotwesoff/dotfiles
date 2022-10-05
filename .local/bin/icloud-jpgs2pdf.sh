#!/bin/sh
#
# icloud-jpgs2pdf.sh

echo Unzipping $1...

unzip $1
convert -auto-orient $(ls -v iCloud\ Photos) $2
