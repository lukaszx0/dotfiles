alias cfg="/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME"

alias ls='ls -hBG'
alias ll='ls -lhF'

alias grep="grep --color"

# Golang
export GOPATH="$HOME/Development/go"
export PATH="$PATH:$GOPATH/bin"

# gcloud (assumes /usr/local/lib/google-cloud-sdk)
if [ -f '/usr/local/lib/google-cloud-sdk/path.bash.inc' ]; then source '/usr/local/lib/google-cloud-sdk/path.bash.inc'; fi
if [ -f '/usr/local/lib/google-cloud-sdk/completion.bash.inc' ]; then source '/usr/local/lib/google-cloud-sdk/completion.bash.inc'; fi
