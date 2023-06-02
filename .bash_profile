alias dot="/usr/bin/git --git-dir=$HOME/.$cloneDir/ --work-tree=$HOME"

alias ls='ls -hBG'
alias ll='ls -lhF'

alias grep="grep --color"
alias rg="rg --type-add 'proto:*.proto'"

# Git prompt
source $HOME/.myconfig/bash/git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1

# Bash prompt
clear='\[\e[0m\]'
bright='\[\e[1m\]'

red='\[\e[31m\]'
green='\[\e[32m\]'
yellow='\[\e[33m\]'
blue='\[\e[34m\]'
magenta='\[\e[35m\]'

contextColor=$green

prompt="\A $bright\w$clear"

bullet='\$'

# Are bash-completion & git available?
declare -f __git_ps1 > /dev/null
if [ $? -eq 0 ]; then
  prompt="$prompt\$(__git_ps1 \" ($bright$magenta%s$clear)\")"
fi

export PS1="$prompt$bright $bullet$clear "

# Custom scripts
export PATH="$HOME/.bin:$PATH"

# Golang
export GOPATH="$HOME/Development/go"
export CGO_CFLAGS_ALLOW="-Xpreprocessor"
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
