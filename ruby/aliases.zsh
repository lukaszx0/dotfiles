alias restart="touch tmp/restart.txt"
alias tlog="tail -f log/development.log"
alias dlog="tail -f log/debug.log"
alias dbmigrate='rake db:migrate db:test:clone'
alias dbupgrade='rake db:migrate db:test:clone'

# Bundler
alias be="bundle exec"
alias bi="bundle install"
alias bl="bundle list"
alias bp="bundle package"
alias bu="bundle update"
