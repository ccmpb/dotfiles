#!/usr/bin/env bash
#
#  _                _
# | |__   __ _  ___| | ___   _ _ __
# | '_ \ / _` |/ __| |/ / | | | '_ \
# | |_) | (_| | (__|   <| |_| | |_) |
# |_.__/ \__,_|\___|_|\_\\__,_| .__/
#                             |_|
#

DEST=/Volumes/ccdata/mbp
BKLIST=(~/bin ~/devel ~/images ~/docs ~/Documents ~/Library/Thunderbird) 

if [ ! -d "$DEST" ];
then
    echo "$DEST not found. Did you forget to attach your external drive?"
    exit 1
fi

for i in "${BKLIST[@]}"
do
    rsync -avh \
        --dry-run \
        --exclude="node_modules" \
        --exclude="env" \
        --exclude="venv" \
        --exclude=".DS_Store" \
        --exclude="__pycache__" \
        --exclude=".cache" \
        $i \
        $DEST${i}
done
