# This file is here only because tmux sources  ~/.bash_profile
# and not ~/.profile when running a shell command.
# This causes issues in the case a tmux mapping runs
# programs that need ~/.profile needs to be sourced
# (example: fzf).

if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

