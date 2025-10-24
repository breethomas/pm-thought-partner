#!/bin/bash

# PM Thought Partner Plugin Installer
# https://github.com/breethomas/pm-thought-partner

set -e

echo "🚀 PM Thought Partner Plugin Installer"
echo ""

# Check if we're in a git repo (for per-project install option)
IN_GIT_REPO=false
if git rev-parse --git-dir > /dev/null 2>&1; then
    IN_GIT_REPO=true
fi

# Ask user for installation preference
echo "Where would you like to install PM Thought Partner?"
echo ""
echo "1. Globally (available in all projects) - Recommended"
if [ "$IN_GIT_REPO" = true ]; then
    echo "2. Per-project (only in this repository)"
fi
echo ""
read -p "Enter your choice (1 or 2): " choice

case $choice in
    1)
        INSTALL_PATH="$HOME/.claude/plugins/pm-thought-partner"
        INSTALL_TYPE="global"
        ;;
    2)
        if [ "$IN_GIT_REPO" = false ]; then
            echo "❌ Error: Per-project installation requires being in a git repository."
            exit 1
        fi
        INSTALL_PATH=".claude/plugins/pm-thought-partner"
        INSTALL_TYPE="per-project"
        ;;
    *)
        echo "❌ Invalid choice. Exiting."
        exit 1
        ;;
esac

echo ""
echo "📦 Installing PM Thought Partner ($INSTALL_TYPE)..."
echo "   Location: $INSTALL_PATH"
echo ""

# Check if directory already exists
if [ -d "$INSTALL_PATH" ]; then
    echo "⚠️  PM Thought Partner already exists at $INSTALL_PATH"
    read -p "Do you want to update it? (y/n): " update_choice

    if [ "$update_choice" = "y" ] || [ "$update_choice" = "Y" ]; then
        echo "🔄 Updating..."
        cd "$INSTALL_PATH"
        git pull origin main
        echo "✅ Updated successfully!"
    else
        echo "❌ Installation cancelled."
        exit 0
    fi
else
    # Create parent directory if needed
    mkdir -p "$(dirname "$INSTALL_PATH")"

    # Clone repository
    echo "📥 Cloning repository..."
    git clone https://github.com/breethomas/pm-thought-partner.git "$INSTALL_PATH"

    echo ""
    echo "✅ PM Thought Partner installed successfully!"
fi

echo ""
echo "🎯 Next steps:"
echo ""
echo "1. Start Claude Code in any project:"
echo "   claude"
echo ""
echo "2. Test it works:"
echo "   Ask: 'Should I write a PRD or prototype first?'"
echo ""
echo "3. Try slash commands:"
echo "   /lno-prioritize"
echo "   /four-risks"
echo "   /now-next-later"
echo ""
echo "4. (Optional) Add Linear integration:"
echo "   claude mcp add linear"
echo ""
echo "📖 Full documentation: https://github.com/breethomas/pm-thought-partner"
echo ""
echo "🚀 Happy shipping!"
