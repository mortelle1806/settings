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
alias gl='git --no-pager log --graph --oneline --decorate -10'
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

# Call batch cmd without many characters. Example: c ping 127.0.0.1
function c {
    args=$@
    cmd /c "$args"
}

function sba {
    . ~/.bash_aliases
}

function sbr {
    . ~/.bashrc
}

function sp {
    . ~/.profile
}

# "Find file": Make user choose a file from the fnid results. To be used with backticks eg. `ff`.
# The tee command is here for comfort when using `ff` because the selected path will be output to the terminal.
alias ff="fnid | fzf --height=20 | tee /dev/tty"

# "Find file to clipboard": Make user choose a file from the fnid and copy the path to the clipboard.
# The newline character at the end is cleared before storage, so that it can be pasted while editing a command, without validating.
alias ffc="fnid | fzf --height=20 | tee /dev/tty | tr -d '\n' | xclip"

# Go back to a parent directory
# https://github.com/vigneshwaranr/bd
alias bd=". bd -si"

alias vrc="vim -c 'cd ~/.vim' ~/.vim/vimrc"
alias vfd="vim -c 'Fnid'"
alias vff="vim -c 'FZF'"
alias vfl="vim -c 'Ag'"
alias vft="vim -c 'Tags'"

alias V="vfd"

# Open vim at last mark before last exit. This means the last edited file and last position.
# http://vim.wikia.com/wiki/Open_the_last_edited_file
# https://vi.stackexchange.com/questions/4817/is-there-a-vim-command-line-option-to-edit-last-edited-file
# Consider https://github.com/farmergreg/vim-lastplace (ignores git commit messages)
alias vl='vim -c "normal '\''0" -c "normal zz"'

# TODO: Factorize this into functions when stable

function save_tmux_scrollback() {
    local start_line_index=${1:-0} # Sets to default value to 0 (ie. first line of visible pane) unless argument $1 exists.
    temp_file=$(mktemp)
    tmux capture-pane -J -S $start_line_index
    tmux save-buffer $temp_file

    # For some reason, the resulting file has trailing newlines and trailing whitespaces in lines.
    # Remove these whitespace characters to make navigation easy.
    sed -i "/^$/d" $temp_file
    sed -i "s/[ \t]*$//" $temp_file
}

# Open vim with a capture of the latest tmux scrollback (no argument = only the visible scrollback, which is fast)
# Using the g_ instead of $ mapping is subtle : it allows using the k key while still staying on the same column as the last non-blank character. With $ it will go to the end of the line above.
function vo() {
    local start_line_index=${1:-0} # Sets to default value to 0 (ie. first line of visible pane) unless argument $1 exists.
    save_tmux_scrollback $start_line_index
    vim -u ~/.vim/vimrc_scrollback -R -c ":norm Gk" -c ":norm g0" $temp_file
    rm $temp_file
}

# Open vim with a capture of the latest tmux scrollback, but up to X lines above the visible scrollback (check .tmux.conf for history-limit to compare)
alias vO='vo -999999'

# Open vim with a capture of the latest tmux scrollback, look for a integer
alias voi='save_tmux_scrollback && vim -u ~/.vim/vimrc_scrollback -R -c ":norm G" -c ":norm g_" -c "silent! /\d\+" -c ":norm N" $temp_file ; rm $temp_file'

# Open vim with a capture of the latest tmux scrollback, look for a word
alias vow='save_tmux_scrollback && vim -u ~/.vim/vimrc_scrollback -R -c ":norm G" -c ":norm g_" -c "silent! /\w\+" -c ":norm N" $temp_file ; rm $temp_file'

# Open vim with a capture of the latest tmux scrollback, look for a P4 changelist (hack: it looks for a large integer at the beginning and end of a word)
alias voc='save_tmux_scrollback && vim -u ~/.vim/vimrc_scrollback -R -c ":norm G" -c ":norm g_" -c "silent! /\<\d\{5,\}\>" -c ":norm N" $temp_file ; rm $temp_file'

# Open vim with a capture of the latest tmux scrollback, look for a Git SHA1 (hack: it looks for a large hexadecimal string)
alias vos='save_tmux_scrollback && vim -u ~/.vim/vimrc_scrollback -R -c ":norm G" -c ":norm g_" -c "silent! /\x\{7,\}" -c ":norm N" $temp_file ; rm $temp_file'

# Open vim with a capture of the latest tmux scrollback, look for a full Unix path (very imperfect)
alias voup='save_tmux_scrollback && vim -u ~/.vim/vimrc_scrollback -R -c ":norm G" -c ":norm g_" -c "silent! /[/~][0-9a-z/.\-_]\{3,\}" -c ":norm N" $temp_file ; rm $temp_file'

# Open vim with a capture of the latest tmux scrollback, look for a full P4 path (very imperfect)
alias vopp='save_tmux_scrollback && vim -u ~/.vim/vimrc_scrollback -R -c ":norm G" -c ":norm g_" -c "silent! /\/\/[0-9a-z/.\-_]\{3,\}" -c ":norm N" $temp_file ; rm $temp_file'

# Open vim with a capture of the latest tmux scrollback, look for a full Windows path (very imperfect)
alias vowp='save_tmux_scrollback && vim -u ~/.vim/vimrc_scrollback -R -c ":norm G" -c ":norm g_" -c "silent! /[a-z]\:\\\\[0-9a-z.\\\\_\-]\+[0-9a-z]" -c ":norm N" $temp_file ; rm $temp_file'

# Does not use the tmux scrollback, but lets user copy a previous command (except the one just run by the alias)
alias voh='history | tail -50 | head -49 | cut -c 8- | vim -R -c ":norm G" -'

# Allow doing |l for quick piping to less
alias l="less"

# In tmux, it is preferable to set terminal to screen-256color for most applications to work properly.
# Alpine does not support the screen-256color terminfo properly (uses italics instead of reverse).
# So even though each tmux window uses terminal screen-256color by default in my config, force TERM
# to something that Alpine actually works with.
alias alpine='TERM=xterm-256color alpine'

