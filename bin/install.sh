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
        cp ../.tmux.conf ~/.tmux.conf
    ;;
    vim) 
        backup $VIMHOME
        cp -r ../vim/* $VIMHOME 
        
        backup $VIMRC
        cp ../.vimrc $VIMRC 
    ;;
    bash) 
        backup $BASHRC
        cp ../.bashrc ~/.bashrc
    ;;
    config)
        backup $CONFIG
        cp -r ../confg ~/.config
    ;;
    fonts)
        backup $FONTS
        cp -r ../fonts ~/.fonts
        fc-cache -vf ~/.fonts
    ;;
esac

