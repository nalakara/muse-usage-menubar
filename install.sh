#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="$HOME/MuseMenuBar"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This installer only supports macOS."
  exit 1
fi

if [[ ! -d "/Applications/SwiftBar.app" ]]; then
  if command -v brew >/dev/null 2>&1; then
    brew install --cask swiftbar
  else
    echo "SwiftBar is not installed and Homebrew was not found."
    echo "Install SwiftBar from https://github.com/swiftbar/SwiftBar/releases, then run this installer again."
    exit 1
  fi
fi

mkdir -p "$TARGET_DIR"
cp "$SCRIPT_DIR/muse-usage.5m.sh" "$TARGET_DIR/muse-usage.5m.sh"
chmod +x "$TARGET_DIR/muse-usage.5m.sh"

if [[ ! -f "$TARGET_DIR/usage.txt" ]]; then
  cp "$SCRIPT_DIR/usage.example.txt" "$TARGET_DIR/usage.txt"
fi

echo "Installed the Muse Usage plugin in $TARGET_DIR"
echo "Open SwiftBar and choose MuseMenuBar as its plugin folder."
open -a SwiftBar
