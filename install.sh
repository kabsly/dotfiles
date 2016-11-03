#!/bin/bash

PACKAGES="vim tmux mutt zsh zsh-completions htop"

read -p "Please enter the package manager that you use: " PACKMANAGER

sudo ${PACKMANAGER} ${PACKAGES}

# vim
ln -sf vimrc ~/.vimrc
ln -sf vim ~/.vim

# zsh
ln -sf zshrc ~/.zshrc
ln -sf oh-my-zsh ~/.oh-my-zsh

# tmux
ln -sf tmux.conf ~/.tmux.conf
