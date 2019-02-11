# ----------------------
# Git Aliases
# ----------------------
alias ga='git add -v'
alias gaa='git add -v .'
alias gai='git add -v -i'
alias gap='git add -v -p'
alias gau='git add -v -u'
alias gb='git --no-pager branch'
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
alias gdtt='git difftoolvimtabs'
alias gdtd='git difftoolvimdirdiff'
alias gdtdc='git difftoolvimdirdiff --cached'
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
alias gtl='git describe --tags'
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

# Alternative to the real fd to see if I can live without it
function fd {
    find -iname *$1*
}

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

# Go back to a parent directory
# https://github.com/vigneshwaranr/bd
alias bd=". bd -si"

alias vrc="vim -c 'cd ~/.vim' ~/.vim/vimrc"
alias vff="vim -c 'FZF'"
alias vfl="vim -c 'Ag'"

# Open vim at last mark before last exit. This means the last edited file and last position.
# http://vim.wikia.com/wiki/Open_the_last_edited_file
# https://vi.stackexchange.com/questions/4817/is-there-a-vim-command-line-option-to-edit-last-edited-file
# Consider https://github.com/farmergreg/vim-lastplace (ignores git commit messages)
alias vl='vim -c "normal '\''0"'

# TODO: Factorize this into functions when stable

# Open vim with a capture of the latest tmux scrollback
alias vo='temp_file=$(mktemp) && tmux capture-pane -J && tmux save-buffer $temp_file && vim -u ~/.vim/vimrc_scrollback -R -c ":norm G$" $temp_file ; rm $temp_file'

# Open vim with a capture of the latest tmux scrollback, look for a integer
alias voi='temp_file=$(mktemp) && tmux capture-pane -J && tmux save-buffer $temp_file && vim -u ~/.vim/vimrc_scrollback -R -c ":norm G$" -c "silent! /\d\+" -c ":norm N" $temp_file ; rm $temp_file'

# Open vim with a capture of the latest tmux scrollback, look for a word
alias vow='temp_file=$(mktemp) && tmux capture-pane -J && tmux save-buffer $temp_file && vim -u ~/.vim/vimrc_scrollback -R -c ":norm G$" -c "silent! /\w\+" -c ":norm N" $temp_file ; rm $temp_file'

# Open vim with a capture of the latest tmux scrollback, look for a P4 changelist (hack: it looks for a large integer at the beginning and end of a word)
alias voc='temp_file=$(mktemp) && tmux capture-pane -J && tmux save-buffer $temp_file && vim -u ~/.vim/vimrc_scrollback -R -c ":norm G$" -c "silent! /\<\d\{5,\}\>" -c ":norm N" $temp_file ; rm $temp_file'

# Open vim with a capture of the latest tmux scrollback, look for a Git SHA1 (hack: it looks for a large hexadecimal string)
alias vos='temp_file=$(mktemp) && tmux capture-pane -J && tmux save-buffer $temp_file && vim -u ~/.vim/vimrc_scrollback -R -c ":norm G$" -c "silent! /\x\{7,\}" -c ":norm N" $temp_file ; rm $temp_file'

# Open vim with a capture of the latest tmux scrollback, look for a full Unix path (very imperfect)
alias voup='temp_file=$(mktemp) && tmux capture-pane -J && tmux save-buffer $temp_file && vim -u ~/.vim/vimrc_scrollback -R -c ":norm G$" -c "silent! /[/~][0-9a-z/.\-_]\{3,\}" -c ":norm N" $temp_file ; rm $temp_file'

# Open vim with a capture of the latest tmux scrollback, look for a full P4 path (very imperfect)
alias vopp='temp_file=$(mktemp) && tmux capture-pane -J && tmux save-buffer $temp_file && vim -u ~/.vim/vimrc_scrollback -R -c ":norm G$" -c "silent! /\/\/[0-9a-z/.\-_]\{3,\}" -c ":norm N" $temp_file ; rm $temp_file'

# Open vim with a capture of the latest tmux scrollback, look for a full Windows path (very imperfect)
alias vowp='temp_file=$(mktemp) && tmux capture-pane -J && tmux save-buffer $temp_file && vim -u ~/.vim/vimrc_scrollback -R -c ":norm G$" -c "silent! /[a-z]\:\\\\[0-9a-z.\\\\_\-]\+[0-9a-z]" -c ":norm N" $temp_file ; rm $temp_file'

# Copy to clipboard the last line of output of last command
alias voll='temp_file=$(mktemp) && tmux capture-pane -J && tmux save-buffer $temp_file && tail -3 $temp_file | head -1 | xclip -in -selection clipboard ; rm $temp_file ; echo "Last line copied to clipboard."'

# Copy to clipboard the last 2 lines of output of last command
alias voll2='temp_file=$(mktemp) && tmux capture-pane -J && tmux save-buffer $temp_file && tail -4 $temp_file | head -2 | xclip -in -selection clipboard ; rm $temp_file ; echo "Last 2 lines copied to clipboard."'

# Copy to clipboard the last 2 lines of output of last command
alias voll3='temp_file=$(mktemp) && tmux capture-pane -J && tmux save-buffer $temp_file && tail -5 $temp_file | head -3 | xclip -in -selection clipboard ; rm $temp_file ; echo "Last 3 lines copied to clipboard."'

# Copy to clipboard the last 2 lines of output of last command
alias voll4='temp_file=$(mktemp) && tmux capture-pane -J && tmux save-buffer $temp_file && tail -6 $temp_file | head -4 | xclip -in -selection clipboard ; rm $temp_file ; echo "Last 4 lines copied to clipboard."'

# Does not use the tmux scrollback, but lets user copy a previous command (except the one just run by the alias)
# TODO: Make exiting vim easy (by creating a file?)
alias voh='history | tail -50 | head -49 | cut -c 8- | vim -c ":norm G" -'

# Allow doing |l for quick piping to less
alias l="less"

# In tmux, it is preferable to set terminal to screen-256color for most applications to work properly.
# Alpine does not support the screen-256color terminfo properly (uses italics instead of reverse).
# So even though each tmux window uses terminal screen-256color by default in my config, force TERM
# to something that Alpine actually works with.
alias alpine='TERM=xterm-256color alpine'

