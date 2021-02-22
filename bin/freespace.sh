#!/usr/bin/env sh

set -e -o pipefail

figlet "free your space..."

# docker
docker system prune -f

# homebrew
brew cleanup -s

# old dev dependencies
find ~/devel -name "venv|env" -type d -mtime +120 | xargs rm -rf
find ~/devel -name "node_modules" -type d -mtime +120 | xargs rm -rf



diskutil info / | grep "Free Space"
