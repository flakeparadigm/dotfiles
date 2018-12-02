#!/usr/bin/env zsh
ZSH=~/.oh-my-zsh

unlink $ZSH/custom
env ZSH=$ZSH sh $ZSH/tools/upgrade.sh

cd ~/.dotfiles
./install
