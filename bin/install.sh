#!/usr/bin/env bash

# get scritpath
SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

# tmux
TMUXCONF=~/.tmux.conf

# vim
VIMHOME=~/.vim
VIMRC=~/.vimrc

# bash
BASHRC=~/.bashrc

# config
CONFIG=~/.config

# fonts
FONTS=~/.fonts

# Make a backup of a file (if it exists)
backup () {
    if [ -f $1 ];
    then
        cp $1 $1.last 
    fi
}

case "$1" in
    tmux) 
        backup $TMUXCONF
        cp $SCRIPTPATH/../.tmux.conf $TMUXCONF
    ;;
    vim) 
        backup $VIMHOME
        cp -r $SCRIPTPATH/../vim/* $VIMHOME 
        
        backup $VIMRC
        cp $SCRIPTPATH/../.vimrc $VIMRC 
    ;;
    bash) 
        backup $BASHRC
        cp $SCRIPTPATH/../.bashrc ~/.bashrc
    ;;
    config)
        backup $CONFIG
        cp -r $SCRIPTPATH/../confg ~/.config
    ;;
    fonts)
        backup $FONTS
        cp -r $SCRIPTPATH/../fonts ~/.fonts
        fc-cache -vf ~/.fonts
    ;;
esac

