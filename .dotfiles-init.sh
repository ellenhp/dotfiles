#!/bin/bash

set -e

eval $(ssh-agent)
ssh-add -K
git --git-dir=$HOME/.cfg/ --work-tree=$HOME clone --bare git@github.com:ellenhp/dotfiles.git $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
git --git-dir=$HOME/.cfg/ --work-tree=$HOME config user.name "Ellen Poe"
git --git-dir=$HOME/.cfg/ --work-tree=$HOME config user.email "ellen@ellenhp.me"
swaymsg reload

