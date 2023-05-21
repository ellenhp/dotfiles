#!/bin/bash

set -e

mkdir -p $HOME/.ssh
chmod 700 $HOME/.ssh
curl --proto '=https' --tlsv1.2 -sSf 'https://github.com/ellenhp.keys' > $HOME/.ssh/authorized_keys
chmod 644 $HOME/.ssh/authorized_keys
