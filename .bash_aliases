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
alias gh='git help'
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

# Call batch cmd without many characters. Example: c ping 127.0.0.1
function c {
    args=$@
    cmd /c $args
}

function sba {
    . ~/.bash_aliases
}

function sbr {
    . ~/.bashrc
}

alias vrc="vim -c 'cd ~/.vim' ~/.vim/vimrc"
alias vff="vim -c 'FZF'"
alias vfl="vim -c 'Ag'"

# Open vim at last mark before last exit. This means the last edited file and last position.
# http://vim.wikia.com/wiki/Open_the_last_edited_file
# https://vi.stackexchange.com/questions/4817/is-there-a-vim-command-line-option-to-edit-last-edited-file
# Consider https://github.com/farmergreg/vim-lastplace (ignores git commit messages)
alias vl='vim -c "normal '\''0"'

# Open vim with a capture of the latest tmux scrollback
alias vo='temp_file=$(mktemp) && tmux capture-pane -J && tmux save-buffer $temp_file && vim -R -c ":norm Gkk$" $temp_file ; rm $temp_file'

# Allow doing |l for quick piping to less
alias l="less"

# In tmux, it is preferable to set terminal to screen-256color for most applications to work properly.
# Alpine does not support the screen-256color terminfo properly (uses italics instead of reverse).
# So even though each tmux window uses terminal screen-256color by default in my config, force TERM
# to something that Alpine actually works with.
alias alpine='TERM=xterm-256color alpine'

