#!/bin/bash
set -euf -o pipefail

cloneDir=myconfig
git clone --bare git@github.com:lukaszx0/dotfiles.git $HOME/.$cloneDir
alias cfg="/usr/bin/git --git-dir=$HOME/.$cloneDir/ --work-tree=$HOME"
cfg checkout

# mkdir -p .config-backup && \
# config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
# xargs -I{} mv {} .config-backup/{}

cfg config --local status.showUntrackedFiles no
