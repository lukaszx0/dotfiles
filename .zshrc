# ZSH
skip_global_compinit=true
autoload -U compinit colors
compinit
colors

unsetopt CORRECT_ALL # turn off autocorrect
unsetopt BEEP # turn off all beeps

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt SHARE_HISTORY # share history between sessions
setopt INC_APPEND_HISTORY # incrementally append cmds to history before execution
setopt EXTENDED_HISTORY # add timestamps to history
setopt HIST_EXPIRE_DUPS_FIRST # clean up dups first when GCing history
setopt HIST_REDUCE_BLANKS # clean up superfluous whitespace
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP
setopt PROMPT_SUBST # the prompt string is first subjected to parameter expansion, command substitution and arithmetic expansion.

zstyle ':completion:*' completer _complete _correct _approximate

# Aliases
alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls='ls -hBG'
alias ll='ls -lhF'
alias grep="grep --color"
alias rg="rg --type-add 'proto:*.proto'"
alias k="kubectl"

# Path
# - Custom scripts
export PATH="$HOME/.bin:$PATH"
# - Golang
export GOPATH="$HOME/Development/go"
export PATH="$PATH:$GOPATH/bin"
# - Rust
export PATH="$HOME/.cargo/bin:$PATH"
# - GNU Sed (brew install gnu-sed)
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# System
ulimit -n 4096 # increase limit of open files

# Prompt
source ~/.zsh/functions/git-prompt
export GIT_PS1_SHOWUPSTREAM="verbose"
export GIT_PS1_DESCRIBE_STYLE="branch"
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1
PROMPT='%* %{$fg_bold[green]%}%~%{$fg_bold[blue]%}%{$reset_color%} $ '

git_prompt_precmd() {
  PROMPT='%* %{$fg_bold[green]%}%~%{$fg_bold[blue]%}$(__git_ps1)%{$reset_color%} $ '
}

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Rbenv
if [ -x "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
fi

# gcloud (assumes /usr/local/lib/google-cloud-sdk)
if [ -f '/usr/local/lib/google-cloud-sdk/path.zsh.inc' ]; then
  source '/usr/local/lib/google-cloud-sdk/path.zsh.inc';
fi

if [ -f '/usr/local/lib/google-cloud-sdk/completion.zsh.inc' ]; then
  source '/usr/local/lib/google-cloud-sdk/completion.zsh.inc';
fi

# FZF
export FZF_DEFAULT_OPTS="--height 20% --layout=reverse"
source <(fzf --zsh)

# Homebrew
# https://docs.brew.sh/Analytics
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

# Histdb
# source ~/.zsh/functions/histdb
#__histdb_init

# Z (https://github.com/rupa/z)
export _Z_NO_PROMPT_COMMAND=1
source ~/.zsh/functions/z

# Load all other functions
source ~/.zsh/functions/g # git alias
source ~/.zsh/functions/dotenv # dotenv hook
source ~/.zsh/functions/godev # go with dev flags
source ~/.zsh/functions/grep1

# Enhance JQ
source ~/.zsh/functions/jqless
alias _jq=jq
alias jq=jqless

# Hooks
chpwd_functions=(__dotenv_chpwd)
precmd_functions=(git_prompt_precmd)

# Local customizations that we don't want to check in and version
if [[ -a ~/.localrc ]]; then
  source ~/.localrc
fi
