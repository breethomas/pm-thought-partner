#!/bin/bash

# PM Thought Partner Plugin Installer
# https://github.com/breethomas/pm-thought-partner

set -e

echo "🚀 PM Thought Partner Plugin Installer"
echo ""

# Default to global installation (recommended for 95% of users)
# For per-project installation, see: https://github.com/breethomas/pm-thought-partner/blob/main/INSTALL_PLUGIN.md
INSTALL_PATH="$HOME/.claude/plugins/pm-thought-partner"
INSTALL_TYPE="global"

echo ""
echo "📦 Installing PM Thought Partner ($INSTALL_TYPE)..."
echo "   Location: $INSTALL_PATH"
echo ""

# Check if directory already exists
if [ -d "$INSTALL_PATH" ]; then
    echo "⚠️  PM Thought Partner already exists at $INSTALL_PATH"
    read -p "Do you want to update it? (y/n): " update_choice </dev/tty

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
