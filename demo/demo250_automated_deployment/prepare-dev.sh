#!/bin/sh

# Demo parameters
DEMO_NAME=acs-demo250-dev

# Demo script location
SCRIPT_PATH=$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")
DEMO_HOME=$(dirname $SCRIPT_PATH)

# Configure TMux and Tmuxinator
mkdir ~/.tmuxinator
cp $DEMO_HOME/.tmuxinator/* ~/.tmuxinator

# Configure Docker
export DOCKER_HOME=
export DOCKER=

docker stop $(docker ps -q)

# Create tmux session
tmux kill-session -t $DEMO_NAME
mux $DEMO_NAME

