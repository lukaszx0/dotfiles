source ~/.bash_aliases

export PATH=/usr/local/bin:$HOME/bin:$PATH:/usr/local/Cellar/gems/1.8/bin
export MANPATH=/opt/local/share/man:$MANPATH
export GEM_HOME=/usr/local/Cellar/gems/1.8

export TERM=xterm-color
export LANG=pl_PL.UTF-8

export EDITOR="mate -w"

NM="\[\033[0;38m\]"
HI="\[\033[1;32m\]"
HII="\[\033[0;31m\]"
SI="\[\033[0;33m\]"
IN="\[\033[0m\]"
export PS1="$NM[$HI\u$NM@$HII\h$NM:$SI\w$NM]$ $IN"

shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns
bind "set bell-style none" # No bell, because it's damn annoying


COLOR_YELLOW="\[\033[33m\]"
COLOR_RED="\[\033[31m\]"
COLOR_GREEN="\[\033[32m\]"
COLOR_BLUE="\[\033[34m\]"
COLOR_NONE="\[\033[0m\]"
COLOR_NONEP="\[\033[38m\]"

git_dirty_flag() {
  git status 2> /dev/null | grep -c : | awk '{if ($1 > 0) print "⚡"}'
}

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

prompt_func() {
    previous_return_value=$?;
    prompt="${COLOR_GREEN}\u@${COLOR_RED}\h ${COLOR_BLUE}\w${COLOR_GREEN}$(parse_git_branch)${COLOR_YELLOW}$(git_dirty_flag)${COLOR_NONEP} "
    if [ $previous_return_value -eq 0 ];
    then
        PS1="${prompt}${COLOR_NONEP}➔ ${COLOR_NONE}"
    else
        PS1="${prompt}${COLOR_RED}➔ ${COLOR_NONE}"
    fi
}
PROMPT_COMMAND=prompt_func