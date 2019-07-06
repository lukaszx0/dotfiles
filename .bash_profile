alias cfg="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

alias ls='ls -hBG'
alias ll='ls -lhF'

alias grep="grep --color"
alias rg="rg --type-add 'proto:*.proto'"

source $HOME/.myconfig/bash/git-prompt.sh
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWDIRTYSTATE=1
export PS1="\\w \$(__git_ps1 '%s')\$ "

# Custom scripts
export PATH="$HOME/.bin:$PATH"

# Golang
export GOPATH="$HOME/Development/go"
export PATH="$PATH:$GOPATH/bin"

# Rbenv
eval "$(rbenv init -)"

# gcloud (assumes /usr/local/lib/google-cloud-sdk)
if [ -f '/usr/local/lib/google-cloud-sdk/path.bash.inc' ]; then
  source '/usr/local/lib/google-cloud-sdk/path.bash.inc';
fi

if [ -f '/usr/local/lib/google-cloud-sdk/completion.bash.inc' ]; then
  source '/usr/local/lib/google-cloud-sdk/completion.bash.inc';
fi

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# FZF
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse"
