alias ls='ls -hBG'
alias ll='ls -lhF'
alias l='ls -lAhF'
alias l.="ls -d .*"

alias cd..="cd .."
alias e="exit"
alias ..="cd .."
alias grep="grep --color"

#Copy publickey to clipboard
alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Flush DNS cache
alias flushdns="dscacheutil -flushcache"

# Simple HTTP Server
alias httpserver="python -m SimpleHTTPServer"

alias showhiddenfiles="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder "
alias dontshowhiddenfiles="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"