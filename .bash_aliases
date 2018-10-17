# ----------------------
# Git Aliases
# ----------------------
alias ga='git add -v'
alias gaa='git add -v .'
alias gai='git add -v -i'
alias gap='git add -v -p'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gca='git commit --all'
alias gcam='git commit --all --message'
alias gcm='git commit --message'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdt='git difftool'
alias gdtc='git difftool --cached'
alias gf='git fetch'
alias gl='git --no-pager log --graph --oneline --decorate -5'
alias gl2='git log --graph --oneline --decorate'
alias gla='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short'
alias gm='git merge'
alias gp='git push'
alias gpt='git push --tags'
alias gs='git status'
alias gsu='git status -u'
alias gt='git tag'
alias gtd='git tag -d'

# Source git completion file to be able to use __git_complete, which allows
# completion on bash aliases such as 'gco' for 'git checkout' 
# NOTE: This path works for Ubuntu 16.04 but may not be the same for other distros.
[ -f /usr/share/bash-completion/completions/git ] && . /usr/share/bash-completion/completions/git

__git_complete ga _git_add
__git_complete gaa _git_add
__git_complete gai _git_add
__git_complete gap _git_add
__git_complete gb _git_branch
__git_complete gbd _git_branch
__git_complete gc _git_commit
__git_complete gca _git_commit
__git_complete gcam _git_commit
__git_complete gcm _git_commit
__git_complete gco _git_checkout
__git_complete gcob _git_checkout
__git_complete gcom _git_checkout
__git_complete gd _git_diff
__git_complete gdc _git_diff
__git_complete gdt _git_difftool
__git_complete gdtc _git_difftool
__git_complete gf _git_fetch
__git_complete gl _git_log
__git_complete gld _git_log
__git_complete gm _git_merge
__git_complete gp _git_push
__git_complete gpt _git_push
__git_complete gs _git_status
__git_complete gsu _git_status
__git_complete gt _git_tag
__git_complete gtd _git_tag

# ----------------------
# IDEs
# ----------------------
alias ds='vim -S ~/DashboardService.vim'
alias dsc='vim -S ~/DashboardService.Client.vim'
alias dsp='vim -S ~/DashboardService.Puncher.vim'
alias utc='vim -S ~/Ubisoft.TeamCity.vim'
alias utcm='vim -S ~/Ubisoft.TeamCity.Monitor.vim'
alias sss='vim -S ~/Settings.vim'
alias tcs='vim -S ~/TeamCitySharp.vim'
alias tb='vim -S ~/TeaBox.vim'
alias tbs='vim -S ~/TeaBox.Scripts.vim'
alias tdsp='vim -S ~/TeaBox.DashboardService.Puncher.vim'
alias p4n='vim -S ~/P4.net.vim'

# ----------------------
# MISC
# ----------------------

alias tmux='tmux -2'

alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias v='vim'
