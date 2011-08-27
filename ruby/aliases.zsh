alias restart="touch tmp/restart.txt"
alias tlog="tail -f log/development.log"
alias dbmigrate='rake db:automigrate db:test:clone'
alias dbupgrade='rake db:autoupgrade db:test:clone'
