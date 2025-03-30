#!/usr/bin/env fish

rsync \
  --archive \
  --verbose \
  --delete \
  --no-owner \
  --no-group \
  --dry-run \
  /shared/Music/flac/ /run/media/Music/flac/
