#!/usr/bin/env bash
#
#  _                _
# | |__   __ _  ___| | ___   _ _ __
# | '_ \ / _` |/ __| |/ / | | | '_ \
# | |_) | (_| | (__|   <| |_| | |_) |
# |_.__/ \__,_|\___|_|\_\\__,_| .__/
#                             |_|
#

set -eo pipefail
# macbook backup volume
# DEST=/Volumes/ccdata/mbp

# local test volume
DEST=/tmp/bk
SOURCE=~
DATETIME="$(date '+%Y-%m-%d_%H:%M:%S')"
BACKUP_PATH=$DEST/$DATETIME
LATEST=$DEST/latest

if [ ! -d "$DEST" ];
then
    echo "$DEST not found. Did you forget to attach your external drive?"
    exit 1
fi

rsync -avh --dry-run --exclude-from=".rsyncignore" --link-dest $LATEST $SOURCE $BACKUP_PATH
rm -rf $LATEST 
ln -s $BACKUP_PATH $LATEST
