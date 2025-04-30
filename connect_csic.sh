#!/bin/bash

# Prompt for username
read -p "Enter your SSH username: " SSH_USER

# Server address and remote port
SERVER="csic2.som.emory.edu"
REMOTE_PORT=8000
LOCAL_PORT=8080

# Run SSH with port forwarding
echo "Connecting to $SERVER as $SSH_USER and forwarding port $REMOTE_PORT to localhost:$LOCAL_PORT..."
ssh -L ${LOCAL_PORT}:localhost:${REMOTE_PORT} "${SSH_USER}@${SERVER}"

