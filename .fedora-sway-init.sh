#!/bin/bash

set -e

sudo dnf install -y zsh tmux vim htop util-linux-user wofi NetworkManager-tui git clang
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
chsh --shell /bin/zsh
swaymsg reload
