# ----------------------
# Git Aliases
# ----------------------
alias ga='git add -v'
alias gaa='git add -v .'
alias gai='git add -v -i'
alias gap='git add -v -p'
alias gb='git branch'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'
alias gbr='git branch --remotes'
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
alias gpd='git push --delete'
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
# P4 Aliases
# ----------------------
alias p4a='p4 add'
alias p4c='p4 change'
alias p4cd='p4 change -d'
alias p4cl='p4 changes -m1 -t'
alias p4co='p4 change -o | less'
alias p4cs='p4 changes -spending -u$USER'
alias p4csp='p4 changes -spending -u$USER | less'
alias p4cu='p4 change -u'
alias p4d='p4 diff'
alias p4dt='P4DIFF=vimdiff p4 diff'
alias p4ds='p4 describe -s'
alias p4e='p4 edit'
alias p4o='p4 opened | less'
alias p4oc='p4 opened $PWD/... | less'
alias p4rv='p4 revert'
alias p4ro='p4 reopen -c'
alias p4s='p4 submit -c'

# ----------------------
# MISC
# ----------------------

alias tmux='tmux -2'

alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias v='vim'

# Less confusing colors by default
# Color codes reference: https://misc.flogisoft.com/bash/tip_colors_and_formatting
alias ag='ag --color-match "39;91"'

alias googler='googler --url-handler=$HOME/opera.exe '
