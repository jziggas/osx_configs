PATH=/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/bash/bin:/usr/local/opt/findutils/bin:/usr/local/opt/grep/bin:/usr/loca$

# This loads nvm
export NVM_DIR="/Users/ziggajt1/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# https://sublimelinter.readthedocs.org/en/latest/troubleshooting.html#finding-a-linter-executable : Special considerations for bash 
# On Mac OS X, bash does not load .bashrc unless explicitly run with the -i command line argument. On the other hand, .bash_profile is loaded in each new interactive Terminal session and if bash is run as a login shell. So you must load .bashrc in .bash_profile, but should only do so if the shell is interactive, which is what the code above below.
case $- in
   *i*) source ~/.bashrc
esac
