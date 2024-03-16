#!/usr/bin/env bash

set -e
set -u

if [[ "$(uname -s)" == "Darwin" ]]; then
  if command -v brew &> /dev/null; then
    xargs brew install < ./githooks/.tools.brew
  else
    echo "Homebrew not installed. Please install required tools manually."
  fi
fi

pre-commit autoupdate
pre-commit install --hook-type pre-commit
pre-commit install --hook-type commit-msg
