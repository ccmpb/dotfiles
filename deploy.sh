#!/bin/sh

DOTFILE_HOME=`pwd`

echo 'updating dotfiles...'

# submodule update
git submodule update --init --recursive
git submodule update --init --remote

# backup originals
mv -vn ~/.bash_profile ~/.bash_profile.bk
mv -vn ~/.vimrc ~/.vimrc.bk
mv -vn ~/.vim ~/.vim.bk
mv -vn ~/.tmux.conf ~/.tmux.conf.bk
mv -vn ~/.gitconfig ~/.gitconfig.bk

# Add sources
printf "source '$DOTFILE_HOME/bash_profile'" > ~/.bash_profile
printf "so $DOTFILE_HOME/vimrc.vim" > ~/.vimrc
printf "source-file $DOTFILE_HOME/tmux.conf" > ~/.tmux.conf
printf "[include]\n\tpath = $DOTFILE_HOME/gitconfig" > ~/.gitconfig 

# links
ln -s $DOTFILE_HOME/vim ~/.vim
