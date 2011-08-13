source ~/.bash_aliases
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
PATH="/usr/local/bin:$PATH"
test -d "$HOME/bin" &&
PATH="$HOME/bin:$PATH"

export MANPATH=/opt/local/share/man:$MANPATH
export TERM=xterm-color
export LANG=pl_PL.UTF-8

export EDITOR="mate -w"

#Go lang
export GOROOT=`brew --prefix go`
export GOBIN=/usr/local/bin
export GOARCH=amd64
export GOOS=darwin

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

ruby_version() {
  rvm-prompt i v p g
}

prompt_func() {
  previous_return_value=$?;
  prompt="${COLOR_GREEN}\u@${COLOR_RED}\h${COLOR_GREEN}#$(ruby_version) ${COLOR_BLUE}\w${COLOR_GREEN}$(parse_git_branch)${COLOR_YELLOW}$(git_dirty_flag)${COLOR_NONEP} "
  PS1="${prompt}${COLOR_NONEP}➔ ${COLOR_NONE}"
}
PROMPT_COMMAND=prompt_func

#Manpage in Preview.app
pman () {
  man -t $* | ps2pdf - - | open -g -f -a /Applications/Preview.app
}

#Manpage in TextMate
tman () {
  MANWIDTH=160 MANPAGER='col -bx' man $@ | mate
}

# Quit an OS X application from the command line
quit () {
    for app in $*; do
        osascript -e 'quit app "'$app'"'
    done
}

pg_start() {
  pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start > /dev/null 2>&1 &
}

pg_stop() {
  pg_ctl -D /usr/local/var/postgres stop -s -m fast
}