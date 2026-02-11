#!/bin/bash
set -e

# Detect Python 3.11+
if command -v python3 &> /dev/null; then
    PYTHON="$HOME/.local/bin/vibelexity-venv/bin/python"
else
    echo "Error: Python 3 not found"
    echo "Install Python 3.11+ from https://www.python.org/"
    exit 1
fi

# Detect or install uv
if command -v uv &> /dev/null; then
    echo "Using existing uv installation"
    UV_CMD="uv"
else
    echo "Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.cargo/bin:$PATH"
    UV_CMD="uv"
fi

# Install vibelexity
INSTALL_DIR="$HOME/.local/share/uv/tools/vibelexity"
mkdir -p "$HOME/.local/bin"

echo "Installing vibelexity..."
"$UV_CMD" tool install vibelexity --python 3.11

# Create symlink in ~/.local/bin
if [ ! -L "$HOME/.local/bin/vibelexity" ]; then
    ln -sf "$INSTALL_DIR/bin/vibelexity" "$HOME/.local/bin/vibelexity" 2>/dev/null || true
fi

echo "vibelexity installed successfully"
echo "Ensure $HOME/.local/bin is in your PATH"