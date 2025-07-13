#!/bin/sh

# Fix ownership of /app directory and its contents
chown devuser:devuser /app
chown -R devuser:devuser /app

# Switch to devuser and run the command
# If no arguments provided, default to zsh
if [ $# -eq 0 ]; then
    exec su - devuser -c "cd /app && /bin/zsh"
else
    exec su - devuser -c "cd /app && $*"
fi
