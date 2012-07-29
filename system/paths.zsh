export PATH=".:bin:/usr/local/bin:/usr/local/sbin:$HOME/.sfs:$ZSH/bin:$PATH"

#Add coreutils binaries to path
command -v foo >/dev/null 2>&1 || {
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
}
