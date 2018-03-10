alias cfg="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

alias ls='ls -hBG'
alias ll='ls -lhF'

alias grep="grep --color"
alias rg="rg --type-add 'proto:*.proto'"

source $HOME/.myconfig/bash/git-prompt.sh
export PS1="\\w \$(__git_ps1 '%s')\$ "

# Golang
export GOPATH="$HOME/Development/go"
export PATH="$PATH:$GOPATH/bin"

# gcloud (assumes /usr/local/lib/google-cloud-sdk)
if [ -f '/usr/local/lib/google-cloud-sdk/path.bash.inc' ]; then source '/usr/local/lib/google-cloud-sdk/path.bash.inc'; fi
if [ -f '/usr/local/lib/google-cloud-sdk/completion.bash.inc' ]; then source '/usr/local/lib/google-cloud-sdk/completion.bash.inc'; fi
