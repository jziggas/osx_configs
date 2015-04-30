[alias]
    st = status
    ci = commit
    co = checkout
    fu = reset --hard
    sb = shortlog -s -n
    lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
    ll = log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat
    yep = !git pull --rebase && git remote prune origin
    standup = !git lg --since='yesterday' --author=`git config user.email`
    su = !git standup
    in = !git log `git rev-parse --abbrev-ref HEAD`..`git rev-parse --symbolic-full-name @{u}`
    incoming = !git in
    out = !git log `git rev-parse --symbolic-full-name @{u}`..`git rev-parse --abbrev-ref HEAD`
    outgoing = !git out
    unstage = reset HEAD --
    last = log -1 HEAD
    spp = !git stash && git pull --rebase && git stash pop
    weekly = !git lg --since='-6days' --author=`git config user.email`
[core]
     editor = vim
	autocrlf = input

[color]
     ui = always

[color "branch"]
     current = yellow bold
     local = green bold
     remote = cyan bold

[color "diff"]
     meta = yellow bold
     frag = magenta bold
     old = red bold
     new = green bold
     whitespace = red reverse

[color "status"]
     added = green bold
     changed = yellow bold
     untracked = red bold

[diff]
     tool = kdiff3

[difftool]
     prompt = false


[grep]
     patternType = perl


[merge]
     conflictstyle = diff3


[pull]
	rebase = true


[push]
	default = simple

[user]
	name = Joshua Ziggas
	email = <ENTER EMAIL HERE>
