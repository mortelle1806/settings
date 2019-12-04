alias tmux='tmux -2'

alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias v='vim'

function vimdirdiff() {
    local path1=$1
    local path2=$2
    vim -c ":DirDiff $path1 $path2"
}
alias vdd='vimdirdiff'

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

source .git_aliases

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

function generate_ids() {
    echo Generating ID file...
    local temp_id_file="ID_new"
    if [ -f "$temp_id_file" ]; then
        rm $temp_id_file
    fi
    mkid --lang-map="$HOME/id-lang.map" --output=$temp_id_file
    RET=$?
    if [ $RET -ne 0 ]; then
        echo "Error!!!!"
        popd
        return 1
    fi 
    rm ID
    mv $temp_id_file ID
}
export -f generate_ids
alias genid=generate_ids

function generate_csearch() {
    echo Generating .csearchindex file...
    local temp_index_file=".csearchindex_new"
    if [ -f "$temp_index_file" ]; then
        rm $temp_index_file
    fi
    local CSEARCHINDEX=./$temp_index_file
    cindex -maxlinelen 5000 . &> /dev/null
    RET=$?
    if [ $RET -ne 0 ]; then
        echo "Error!!!!"
        popd
        return 1
    fi 
    rm .csearchindex
    mv $temp_index_file .csearchindex
}
export -f generate_csearch
alias gencs=generate_csearch

alias genx='genid && gencs'

function generate_tags() {
    gtags --incremental --verbose
    RET=$?
    if [ $RET -ne 0 ]; then
        echo "Error!!!!"
        popd
        return 1
    fi
}
export -f generate_tags
alias gentags=generate_tags

}
