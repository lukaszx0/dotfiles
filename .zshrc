skip_global_compinit=true
autoload -U compinit colors
compinit
colors

unsetopt correct_all

# Aliases
alias cfg="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls='ls -hBG'
alias ll='ls -lhF'
alias grep="grep --color"
alias rg="rg --type-add 'proto:*.proto'"

# Path
# - Custom scripts
export PATH="$HOME/.bin:$PATH"
# - Golang
export GOPATH="$HOME/Development/go"
export PATH="$PATH:$GOPATH/bin"
# - Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Rbenv
eval "$(rbenv init -)"

# gcloud (assumes /usr/local/lib/google-cloud-sdk)
if [ -f '/usr/local/lib/google-cloud-sdk/path.bash.inc' ]; then
  source '/usr/local/lib/google-cloud-sdk/path.zsh.inc';
fi

if [ -f '/usr/local/lib/google-cloud-sdk/completion.bash.inc' ]; then
  source '/usr/local/lib/google-cloud-sdk/completion.zsh.inc';
fi

# FZF
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse"
