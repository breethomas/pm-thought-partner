# Plugin Installation Guide

Get the **full PM Thought Partner experience** with slash commands and optional Linear integration.

## What You Get

- ✅ AI thought partner grounded in 12+ PM frameworks
- ✅ Slash commands for quick framework access
- ✅ Optional Linear integration (apply frameworks to your backlog)
- ✅ All frameworks from Marty Cagan, Elena Verna, Brian Balfour, Teresa Torres, and more

## Installation Methods

### Option 1: Claude Code CLI (Recommended)

**Prerequisites:**
- Claude Code CLI installed ([instructions](https://docs.anthropic.com/claude/docs/claude-code))
- Git (for cloning the repo)

**Install:**
```bash
# Clone the repository
git clone https://github.com/breethomas/pm-thought-partner.git
cd pm-thought-partner

# Install as plugin
claude plugin install .
```

**Verify installation:**
```bash
claude plugin list
```

You should see `pm-thought-partner` in the list.

---

### Option 2: Claude Code in Browser

**Prerequisites:**
- Access to Claude Code in Browser ([claude.ai/code](https://claude.ai/code))

**Install:**

1. Go to [claude.ai/code](https://claude.ai/code)
2. In the chat, type:
   ```
   Install the PM Thought Partner plugin from https://github.com/breethomas/pm-thought-partner
   ```
3. Claude will fetch and install the plugin automatically

**Verify installation:**
Ask Claude: "What plugins are installed?" or try a slash command like `/lno-prioritize`

---

## Adding Linear Integration (Optional)

The plugin includes powerful Linear integration for applying frameworks directly to your backlog.

**What Linear integration enables:**
- `/lno-prioritize` - Categorize Linear issues by impact (Leverage/Neutral/Overhead)
- `/four-risks [issue-id]` - Run Marty Cagan's risk assessment on specific issues
- `/now-next-later` - Generate roadmap from Linear projects
- Auto-label issues with framework categorizations

### Setup Linear MCP Server

**Prerequisites:**
- Linear account
- Linear API key ([get one here](https://linear.app/settings/api))

**Install Linear MCP server:**

```bash
# Using Claude Code CLI
claude mcp add linear

# Follow prompts to add your Linear API key
```

**Alternative: Manual setup**

1. Create `.claude/mcp.json` in your home directory if it doesn't exist:
   ```json
   {
     "mcpServers": {
       "linear": {
         "command": "npx",
         "args": ["-y", "@linear/mcp-server"],
         "env": {
           "LINEAR_API_KEY": "your-linear-api-key-here"
         }
       }
     }
   }
   ```

2. Restart Claude Code

**Verify Linear connection:**
Ask Claude: "List my Linear issues" or run `/lno-prioritize`

---

## Quick Start

Once installed, try:

### Using the Thought Partner

**Prototype-first challenges:**
```
"Should I write a PRD for this recommendation engine or prototype it first?"
```

**Apply frameworks:**
```
"Apply the Four Risks framework to this feature: [describe feature]"
```

**Roadmap planning:**
```
"Help me create a Now-Next-Later roadmap from these projects: [paste projects]"
```

### Using Slash Commands

**Prioritize your backlog:**
```
/lno-prioritize
/lno-prioritize --team product
/lno-prioritize --label  (adds Linear labels)
```

**Risk assessment:**
```
/four-risks ENG-245
/four-risks --current-sprint
/four-risks --add-comment  (adds assessment to Linear)
```

**Roadmap generation:**
```
/now-next-later
/now-next-later --team engineering
/now-next-later --export  (generates markdown)
```

**Organizational AI adoption:**
```
/coder
/coder --diagnose
```

**PMF measurement:**
```
/pmf-survey
/pmf-survey --create
/pmf-survey --analyze [survey-data]
```

---

## Available Frameworks

The plugin includes frameworks from:

**Discovery & Validation:**
- Four Risks (Marty Cagan)
- Opportunity Solution Trees (Teresa Torres)
- Continuous Discovery (Teresa Torres)
- PMF Survey (Rahul Vohra / Sean Ellis)

**Planning & Prioritization:**
- LNO Prioritization (Aakash Gupta / Shreyas Doshi)
- Now-Next-Later Roadmaps (Janna Bastow)
- North Star Metric
- One Metric That Matters (Elena Verna)

**Growth & Retention:**
- Four Fits Framework (Elena Verna)
- Growth Loops (Brian Balfour)
- Product-Led Sales (Elena Verna)

**Team Execution:**
- Linear Method
- Product Operating Model (Brian Balfour)
- Product Trio (Marty Cagan)

**AI-Specific:**
- AI Eval Frameworks (Hamel Husain, Eugene Yan)
- Organizational AI Adoption / CODER (Brian Balfour)

All frameworks are in the [`frameworks/`](frameworks/) directory.

---

## Updating the Plugin

**Claude Code CLI:**
```bash
cd pm-thought-partner
git pull
claude plugin update pm-thought-partner
```

**Claude Code Browser:**
Claude will notify you when updates are available.

---

## Troubleshooting

### Plugin not showing in list
- Verify `.claude-plugin/plugin.json` exists in the repo
- Try: `claude plugin install --force .`

### Slash commands not working
- Verify command files exist in `commands/` directory
- Check command syntax: `/command-name` (use hyphens, not spaces)
- Try restarting Claude Code

### Linear integration not working
- Verify Linear API key is correct: `claude mcp list`
- Check Linear MCP is running: `claude mcp status linear`
- Test connection: Ask Claude "List my Linear issues"

### Commands return "No Linear issues found"
- Verify you have active Linear issues in your workspace
- Check Linear API key has correct permissions
- Try: `/lno-prioritize --team [your-team-name]`

---

## Support

- **Report issues:** https://github.com/breethomas/pm-thought-partner/issues
- **Contribute:** See [CONTRIBUTING.md](CONTRIBUTING.md)
- **Discuss:** Open a GitHub Discussion

---

## What's Next?

1. **Try the slash commands** - Start with `/lno-prioritize` to see frameworks in action
2. **Connect Linear** (if you use it) - Apply frameworks to your actual backlog
3. **Explore frameworks** - Browse [`frameworks/`](frameworks/) to see what's available
4. **Share feedback** - What frameworks are missing? What would make this more useful?

**Happy shipping! 🚀**
