autoload colors && colors
. ~/
git_branch() {
  echo " $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})"
}

git_dirty_flag() {
  git status 2> /dev/null | grep -c : | awk '{if ($1 > 0) print "⚡"}'
}

export PROMPT=$'%{$fg_bold[green]%}%~%{$fg_bold[blue]%}$(git_branch)%{$fg_bold[red]%}$(git_dirty_flag)%{$reset_color%}› '

precmd() {
  title "zsh" "%m" "%55<...<%~"
}