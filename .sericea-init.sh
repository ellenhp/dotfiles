#!/bin/bash

set -e

toolbox create
rpm-ostree install --apply-live zsh tmux vim htop util-linux-user wofi NetworkManager-tui
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
chsh --shell /bin/zsh
swaymsg reload
