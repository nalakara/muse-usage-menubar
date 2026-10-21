#!/bin/bash
# <xbar.title>Muse Usage</xbar.title>
# <xbar.version>1.0.0</xbar.version>
# <xbar.author>Yudhan Sebastian</xbar.author>
# <xbar.author.github>nalakara</xbar.author.github>
# <xbar.desc>Display a Muse usage snapshot in the macOS menu bar.</xbar.desc>
# <swiftbar.hideAbout>true</swiftbar.hideAbout>
# <swiftbar.hideRunInTerminal>true</swiftbar.hideRunInTerminal>
# <swiftbar.hideLastUpdated>true</swiftbar.hideLastUpdated>
# <swiftbar.hideDisablePlugin>true</swiftbar.hideDisablePlugin>
# <swiftbar.hideSwiftBar>true</swiftbar.hideSwiftBar>

PLUGIN_DIR="$(cd "$(dirname "$0")" && pwd)"
SNAPSHOT_FILE="$PLUGIN_DIR/usage.txt"

if [[ -f "$SNAPSHOT_FILE" ]]; then
  cat "$SNAPSHOT_FILE"
else
  echo "⚡ –"
  echo "---"
  echo "No usage snapshot yet | color=#888888"
fi
