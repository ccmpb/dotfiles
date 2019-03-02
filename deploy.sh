#!/bin/sh

DOTFILE_HOME=`pwd`

echo 'updating dotfiles...'

# backup originals
mv -vn ~/.bash_profile ~/.bash_profile.bk
mv -vn ~/.vimrc ~/.vimrc.bk
mv -vn ~/.tmux.conf ~/.tmux.conf.bk

printf "source '$DOTFILE_HOME/bash_profile" > ~/.bash_profile
printf "so $DOTFILE_HOME/vimrc.vim" > ~/.vimrc
printf "source-file $DOTFILE_HOME/tmux.conf" > ~/.tmux.conf
