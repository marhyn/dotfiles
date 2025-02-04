#!/bin/bash

# Set directories
ECOMAIL_DIR="$HOME/Projects/ecomail/"
FRONTEND_DIR="$ECOMAIL_DIR/ecomailapp-frontend/"
BACKENDEND_DIR="$ECOMAIL_DIR/ecomailapp/"
LOCAL_INFRASTRUCTURE="$HOME/Projects/local_development/infrastructure/"
SESHION="ecomail"
# Command to check if session exists
tmux has-session -t ecomail 2>/dev/null

if [ $? != 0 ]; then
  # Create new tmux session named 'ecomail'
  tmux new-session -d -s $SESHION -n "general"

  # First window: 2 panes in 'general' directory
  tmux send-keys -t $SESHION:general "cd $BACKENDEND_DIR" C-m
  tmux split-window -h -c $FRONTEND_DIR
  tmux select-pane -t 1
  tmux send-keys 'nix develop' C-m  # Replace this with actual command

  # Second window: nvim in 'editor' directory
  tmux new-window -t $SESHION -n 'editor' -c $FRONTEND_DIR
  tmux send-keys -t $SESHION:editor 'nvim .' C-m

  # Third window: 2 panes in 'server' directory, with specific commands
  tmux new-window -t ecomail:2 -n 'server' -c $BACKENDEND_DIR
  tmux split-window -h -c $FRONTEND_DIR
  tmux select-pane -t 0
  tmux send-keys 'yarn serve' C-m  # Replace this with actual command
  tmux select-pane -t 1
  tmux send-keys 'nix develop' C-m  # Replace this with actual command
  tmux send-keys 'pnpm dev' C-m  # Replace this with actual command

  # Third window: 2 panes in 'server' directory, with specific commands
  tmux new-window -t $SESHION:3 -n 'docker' -c $BACKENDEND_DIR
  tmux split-window -h -c $LOCAL_INFRASTRUCTURE
  tmux select-pane -t 0
  tmux send-keys 'podman machine start' C-m  # Replace this with actual command
  tmux send-keys 'podman compose -f build/dynamodb/dynamodb.yaml up' C-m  # Replace this with actual command
  tmux select-pane -t 1
  tmux send-keys 'podman compose up mysql' C-m  # Replace this with actual command

  # Switch to the first window (general) on attach
  tmux select-window -t ecomail:0
fi

# Attach to the tmux session
tmux attach -t ecomail

