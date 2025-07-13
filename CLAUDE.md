# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a containerized development environment that provides a multi-language development setup with Node.js, Python, and system tools pre-installed. The repository is structured as a Docker-based development container rather than a traditional application codebase.

## Development Environment Commands

### Building the Environment
```bash
./build.sh                    # Builds the Docker container from scratch
```

### Running the Development Environment
```bash
./run.sh                      # Starts the development container with zsh shell
./go.sh                       # Equivalent to running build.sh followed by run.sh
```

### Direct Docker Commands
```bash
docker-compose build --no-cache    # Manual build (same as build.sh)
docker-compose run dev-env          # Manual run (same as run.sh)
```

## Architecture

This repository implements a containerized development environment with the following characteristics:

- **Base Image**: Node.js 18 Alpine Linux with npm pre-installed
- **Multi-language Support**: Node.js, Python 3, and system tools
- **Development User**: Non-root `devuser` with sudo privileges and zsh shell
- **Port Mapping**: Exposes ports 3000, 8000, and 8080 for various development servers
- **Volume Mounting**: The entire repository is mounted to `/app` inside the container
- **Pre-installed Tools**: 
  - Claude Code CLI (`@anthropic-ai/claude-code`)
  - Oh-my-zsh for enhanced shell experience
  - Git, curl, and essential development utilities

## Working Directory Structure

The container uses `/app` as the working directory, which is mounted from the host repository. The `node_modules` directory is excluded from mounting to prevent conflicts between host and container dependencies.

## Environment Variables

- `NODE_ENV=development` is set by default in the Docker Compose configuration

## Development Workflow

Since this is a development environment container rather than an application:
1. Use `./go.sh` to build and run the environment
2. All development work happens inside the container at `/app`
3. The container provides isolated Node.js and Python environments
4. Any projects created will persist on the host through volume mounting