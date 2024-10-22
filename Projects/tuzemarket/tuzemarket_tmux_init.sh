#!/bin/bash

# Set directories
TUZEMARKET_DIR="$HOME/Projects/tuzemarket/tuzemarket-mono/"
FRONTEND_DIR="$ECOMAIL_DIR/apps/frontend/"
BACKENDEND_DIR="$ECOMAIL_DIR/apps/backend/"
SESHION="tuzemarket"
# Command to check if session exists
tmux has-session -t $SESHION 2>/dev/null

if [ $? != 0 ]; then
  # Create new tmux session named 'tuzemarket'
  tmux new-session -d -s $SESHION -n "general"

  # First window: 2 panes in 'general' directory
  tmux send-keys -t $SESHION:general "cd $TUZEMARKET_DIR" C-m

  # Second window: nvim in 'editor' directory
  tmux new-window -t $SESHION -n 'editor' -c $TUZEMARKET_DIR
  tmux send-keys -t $SESHION:editor 'nvim .' C-m

  # Third window: 2 panes in 'server' directory, with specific commands
  tmux new-window -t $SESHION -n 'server' -c $TUZEMARKET_DIR
  tmux split-window -h
  tmux select-pane -t 0
  tmux send-keys 'corepack enable && nvm use 20 && pnpm dev:all' C-m  # Replace this with actual command
  tmux select-pane -t 1

  # Switch to the first window (general) on attach
  tmux select-window -t $SESHION:0
fi

# Attach to the tmux session
tmux attach -t $SESHION

