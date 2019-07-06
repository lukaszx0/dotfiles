# ZSH
skip_global_compinit=true
autoload -U compinit colors
compinit
colors

unsetopt correct_all

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt SHARE_HISTORY # share history between sessions
setopt INC_APPEND_HISTORY # incrementally append cmds to history before execution
setopt EXTENDED_HISTORY # add timestamps to history
setopt HIST_EXPIRE_DUPS_FIRST # clean up dups first when GCing history
setopt HIST_REDUCE_BLANKS # clean up superfluous whitespace
setopt PROMPT_SUBST # the prompt string is first subjected to parameter expansion, command substitution and arithmetic expansion.

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

# Prompt
source $HOME/.myconfig/bash/git-prompt.sh
export GIT_PS1_SHOWUPSTREAM="verbose"
export GIT_PS1_DESCRIBE_STYLE="branch"
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1
PROMPT="%* %{$fg_bold[green]%}%~%{$fg_bold[blue]%}$(__git_ps1)%{$reset_color%} $ "

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
