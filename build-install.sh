#!/usr/bin/env bash
# build-install.sh - Install linear-cli via Deno
# Created by repo-mole for ~/prj/util installation
set -euo pipefail

cd "$(dirname "$0")"

BIN_DIR="$HOME/prj/util/bin"

echo "==> Installing linear-cli..."

# Check for deno
if ! command -v deno &>/dev/null; then
    echo "Error: deno is required but not installed."
    echo "Install via: curl -fsSL https://deno.land/install.sh | sh"
    exit 1
fi

# Run the project's install task (includes codegen)
deno task install

# Symlink executable to ~/prj/util/bin
mkdir -p "$BIN_DIR"
ln -sf ~/.deno/bin/linear "$BIN_DIR/linear"

echo ""
echo "==> linear-cli installed successfully!"
echo "    Binary: $BIN_DIR/linear"
echo ""
echo "Setup: Run 'linear config' in your project directory to configure."
