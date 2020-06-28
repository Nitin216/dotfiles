#!/bin/sh

set -e

if tmux has-session -t dotfiles 2> /dev/null; then
	tmux attach -t dotfiles
	exit
fi

tmux new-session -d -s dotfiles -n vim

# 1. Main window: vim, server, shell.
tmux send-keys -t dotfiles:vim "vim ." Enter
tmux split-window -t dotfiles:vim -h -c "$PWD"
tmux send-keys -t dotfiles:vim.right "gst" Enter

tmux attach -t dotfiles:vim.left
