#!/usr/bin/env bash

VIMHOME=~/.vim
VIMRC=~/.vimrc

case "$1" in
    tmux) 
        cp ~/.tmux.conf ~/.tmux.conf.last 
        cp ../.tmux.conf ~/.tmux.conf
    ;;
    vim) 
	if [ -f $VIMHOME ]; 
	then 
		cp -r $VIMHOME $VIMHOME.last
	fi
        cp -r ../vim/* $VIMHOME 

	if [ -f $VIMRC ];
	then
		cp $VIMRC $VIMRC.last 
	fi
        cp ../.vimrc $VIMRC 
    ;;
    bash) 
        cp ~/.bashrc ~/.bashrc.last
        cp ../.bashrc ~/.bashrc
    ;;
    config)
        cp ~/.config ~/.config.last
        cp -r ../confg ~/.config
    ;;
    fonts)
        cp -r ~/.fonts ~/.fonts.last
        cp -r ../fonts ~/.fonts
        fc-cache -vf ~/.fonts
    ;;
esac
