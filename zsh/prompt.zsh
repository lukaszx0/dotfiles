autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

git_branch() {
  echo $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty_flag() {
  git status 2> /dev/null | grep -c : | awk '{if ($1 > 0) print "⚡"}'
}

git_prompt_info () {
 ref=$(git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

project_name () {
  name=$(pwd | awk -F'Development/' '{print $2}' | awk -F/ '{print $1}')
  echo $name
}

project_name_color () {
  #name=$(project_name)
  #echo "%{\e[0;35m%}${name}%{\e[0m%} "
}

unpushed () {
  git cherry -v origin/$(git_branch) 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

rvm_prompt(){
  if $(which rvm &> /dev/null)
  then
    echo "%{$fg_bold[yellow]%}$(rvm tools identifier)%{$reset_color%}"
  else
    echo ""
  fi
}

directory_name(){
  echo "%{%}%1/%\/%{$reset_color%}"
}

export PROMPT=$'$fg_bold[cyan]%~%{$reset_color%} $(git_dirty_flag)› '
set_prompt () {
  export RPROMPT="%{$fg_bold[grey]%}%{$reset_color%}"
}
