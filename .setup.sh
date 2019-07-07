#!/bin/bash
set -euf -o pipefail

cloneDir=.dotfiles
git clone --bare git@github.com:lukaszx0/dotfiles.git $HOME/.$cloneDir
alias dot="/usr/bin/git --git-dir=$HOME/.$cloneDir/ --work-tree=$HOME"
dot checkout

# mkdir -p .config-backup && \
# config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
# xargs -I{} mv {} .config-backup/{}

dot config --local status.showUntrackedFiles no
