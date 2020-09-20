#!/usr/bin/env bash

RSYNC=rsync -zavh
DEST=/Volumes/ccdata

# photos
$RSYNC ~/Pictures/Photos\ Library.photoslibrary/ $DEST/photos/colin

# devel

# wallpapers
$RSYNC ~/images/wallpaper $DEST/wallpaper
