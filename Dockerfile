# Use Node.js base image (includes npm)
FROM node:18-alpine

# Install system packages including zsh, sudo, and Python
RUN apk add --no-cache \
    python3 \
    py3-pip \
    zsh \
    sudo \
    git \
    curl \
    shadow

# Create a non-root user with sudo privileges
RUN adduser -D -s /bin/zsh devuser && \
    echo "devuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install oh-my-zsh as devuser
RUN su - devuser -c 'sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended'

# Create symlink for python command (optional, for convenience)
RUN ln -sf python3 /usr/bin/python

# Install Claude Code CLI globally
RUN npm install -g @anthropic-ai/claude-code

# Set working directory for development
WORKDIR /app
RUN chown devuser:devuser /app

# Switch to devuser as default
USER devuser

# Expose common development ports
EXPOSE 3000 8000 8080

# Override the node entrypoint and default to zsh
ENTRYPOINT []
CMD ["zsh"]