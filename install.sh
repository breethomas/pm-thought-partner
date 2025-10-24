#!/bin/bash

# PM Thought Partner Installation Script
# This script sets up slash commands by symlinking them to ~/.claude/commands/

set -e  # Exit on error

echo "🚀 Setting up PM Thought Partner..."
echo ""

# Determine plugin location
PLUGIN_DIR="$(cd "$(dirname "$0")" && pwd)"
COMMANDS_DIR="$HOME/.claude/commands"

# Create commands directory if it doesn't exist
mkdir -p "$COMMANDS_DIR"

# Symlink all command files
echo "📋 Linking slash commands..."

COMMANDS_SOURCE="$PLUGIN_DIR/commands"
LINKED_COUNT=0

for cmd_file in "$COMMANDS_SOURCE"/*.md; do
    if [[ -f "$cmd_file" ]]; then
        cmd_name=$(basename "$cmd_file")
        target_path="$COMMANDS_DIR/$cmd_name"

        # Remove existing symlink if it exists
        if [[ -L "$target_path" ]]; then
            rm "$target_path"
        fi

        # Create symlink
        ln -sf "$cmd_file" "$target_path"
        echo "   ✓ /$cmd_name"
        ((LINKED_COUNT++))
    fi
done

echo ""
echo "✅ Installation complete! $LINKED_COUNT slash commands linked."
echo ""
echo "🎯 Available commands:"
echo "   • /lno-prioritize  - Apply LNO prioritization framework"
echo "   • /four-risks      - Run Marty Cagan's Four Risks assessment"
echo "   • /now-next-later  - Generate Now-Next-Later roadmap"
echo "   • /coder           - Apply CODER framework for AI adoption"
echo "   • /pmf-survey      - Create and analyze PMF surveys"
echo ""
echo "⚠️  IMPORTANT: Restart Claude Code to load slash commands"
echo "   1. Exit your current Claude session (Ctrl+C)"
echo "   2. Run 'claude' to start a new session"
echo "   3. Try /lno-prioritize or any other command"
echo ""
