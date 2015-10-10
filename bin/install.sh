#!/usr/bin/env bash

case "$1" in
    tmux) 
        cp ~/.tmux.conf ~/.tmux.conf.last 
        cp ../.tmux.conf ~/.tmux.conf
    ;;
    vim) 
        cp -r ~/.vim ~/.vim.last
        cp -r ../vim ~/.vim

        cp ~/.vimrc ~/.vimrc.last
        cp .vimrc ~/.vimrc
    ;;
    bash) 
        cp ~/.bashrc ~/.bashrc.last
        cp ../.bashrc ~/.bashrc
    ;;
esac
