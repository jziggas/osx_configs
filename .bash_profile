PATH=/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/bash/bin:/usr/local/opt/findutils/bin:/usr/local/opt/grep/bin:/usr/local/opt/xz/bin:$PATH
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Show what git branch you are working in
function EXT_COLOR () { echo -ne "\033[38;5;$1m"; }
export LS_COLORS='di=38;5;108:fi=00:*svn-commit.tmp=31:ln=38;5;116:ex=38;5;186'
PS1='\[\e]0;\u@\h \w\a\]\[`EXT_COLOR 187`\]\u@🏠\  \[`EXT_COLOR 174`\]\w$(parse_git_branch)\$\[\033[00m\] '

# Launch gpg-agent
gpg-connect-agent /bye

# When using SSH support, use the current TTY for passphrase prompts
gpg-connect-agent updatestartuptty /bye > /dev/null

# Point the SSH_AUTH_SOCK to the one handled by gpg-agent
if [ -S $(gpgconf --list-dirs agent-ssh-socket) ]; then
  export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
else
  echo "$(gpgconf --list-dirs agent-ssh-socket) doesn't exist. Is gpg-agent running ?"
fi

# Configure the current TTY for GnuPG client.
export GPG_TTY=$(tty)

# This loads nvm
export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"
# export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# export HOMEBREW_GITHUB_API_TOKEN="<ENTER TOKEN HERE>"

# https://sublimelinter.readthedocs.org/en/latest/troubleshooting.html#finding-a-linter-executable : Special considerations for bash 
# On Mac OS X, bash does not load .bashrc unless explicitly run with the -i command line argument. On the other hand, .bash_profile is loaded in each new interactive Terminal session and if bash is run as a login shell. So you must load .bashrc in .bash_profile, but should only do so if the shell is interactive, which is what the code above below.
case $- in
   *i*) source ~/.bashrc
esac

listening () {
	lsof -Pni | grep '(LISTEN)' | awk 'BEGIN {printf "%-15s %5s %21s\n", "Command", "PID", "PORT"} {printf "%-15s %5s %21s\n", $1,$2,$9}'
}
export HOMEBREW_GITHUB_API_TOKEN="<ENTER KEY HERE>"
