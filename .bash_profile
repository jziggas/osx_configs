PATH=/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/bash/bin:/usr/local/opt/findutils/bin:/usr/local/opt/grep/bin:/usr/local/opt/xz/bin:$PATH
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
# Old /Users/ziggajt1/.nvm/versions/node/v6.9.1/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
# New /usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/bash/bin:/usr/local/opt/findutils/bin:/usr/local/opt/grep/bin:/usr/local/opt/xz/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/ziggajt1/bin
# This loads nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
# export NVM_DIR="~/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export HOMEBREW_GITHUB_API_TOKEN="<ENTER TOKEN HERE>"

# https://sublimelinter.readthedocs.org/en/latest/troubleshooting.html#finding-a-linter-executable : Special considerations for bash 
# On Mac OS X, bash does not load .bashrc unless explicitly run with the -i command line argument. On the other hand, .bash_profile is loaded in each new interactive Terminal session and if bash is run as a login shell. So you must load .bashrc in .bash_profile, but should only do so if the shell is interactive, which is what the code above below.
case $- in
   *i*) source ~/.bashrc
esac
