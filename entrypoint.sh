#!/bin/sh

# Switch to devuser and run the command
# If no arguments provided, default to zsh
if [ $# -eq 0 ]; then
    exec su - devuser -c "cd /app && /bin/zsh"
else
    exec su - devuser -c "cd /app && $*"
fi