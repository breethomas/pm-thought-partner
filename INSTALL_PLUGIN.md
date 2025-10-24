# Plugin Installation Guide (CLI)

**Command line installation** for Claude Code CLI.

**Prefer browser-based setup?** → [Claude Projects Guide](CLAUDE_PROJECTS_GUIDE.md)

---

## What You Get

- ✅ AI thought partner grounded in 12+ PM frameworks
- ✅ Slash commands for quick framework access (`/lno-prioritize`, `/four-risks`, etc.)
- ✅ Optional Linear integration (apply frameworks to your backlog)
- ✅ Works in your actual project repositories
- ✅ All frameworks from Marty Cagan, Elena Verna, Brian Balfour, Teresa Torres, and more

---

## Installation

> **Note:** PM Thought Partner is not yet in the Claude Code Marketplace. For now, installation requires cloning from GitHub. Once published to the marketplace, installation will be simpler: `claude plugin install pm-thought-partner`

### Option 1: Ask Claude (Easiest)

**Just ask Claude Code CLI to install it:**

```
Install the PM Thought Partner plugin from
https://github.com/breethomas/pm-thought-partner
```

Claude will handle everything - cloning the repo, setting up the plugin directory, and verifying the installation.

**⚠️ IMPORTANT: YOU MUST RESTART CLAUDE CODE** to load the slash commands. Exit your current session and run `claude` again.

---

### Option 2: Clone and Run Install Script

**Automated setup with install script:**

```bash
git clone https://github.com/breethomas/pm-thought-partner.git ~/.claude/plugins/pm-thought-partner
cd ~/.claude/plugins/pm-thought-partner
./install.sh
```

The install script will automatically symlink the slash commands to `~/.claude/commands/`.

### Option 3: Manual Installation (No Script)

**If you prefer full control:**

```bash
git clone https://github.com/breethomas/pm-thought-partner.git ~/.claude/plugins/pm-thought-partner
ln -sf ~/.claude/plugins/pm-thought-partner/commands/*.md ~/.claude/commands/
```

**⚠️ IMPORTANT: YOU MUST RESTART CLAUDE CODE** to load the slash commands. Exit your current session and run `claude` again.

**For per-project installation** (team access), see the [Manual Installation](#advanced-manual-installation) section below.

---

## Connect Your Issue Tracker (Optional)

The PM Thought Partner works best when connected to your backlog. Set this up right after installation to get the most value.

### Option 1: Linear MCP

**Why Linear?**
- Built for product teams (roadmaps, discovery, prioritization)
- Linear Method is one of our core frameworks
- Rich project/issue metadata for better framework analysis

**What you get:**
- `/lno-prioritize` - Auto-categorize issues by impact + add labels
- `/four-risks [issue-id]` - Risk assessment + add to issue comments
- `/now-next-later` - Generate roadmap from projects
- Full integration with Linear's API

**Setup (2 minutes):**

Just ask Claude:
```
Set up the Linear MCP server for me
```

Claude will prompt you for your Linear API key and configure everything.

**Get your Linear API key:** [linear.app/settings/api](https://linear.app/settings/api)

**Or manually:**
```bash
claude mcp add linear
```

Follow the prompts to add your Linear API key.

---

### Option 2: GitHub MCP

**Already have GitHub connected?** The PM Thought Partner will automatically detect and use it.

**What you get:**
- Same slash command capabilities as Linear MCP
- Issue management, PR integration, project boards
- Full create/update/label capabilities
- Great if your team already lives in GitHub

**Setup:**
Use the [GitHub MCP server](https://github.com/github/github-mcp-server)

**Not set up yet?**
```
Set up the GitHub MCP server for me
```

---

### Option 3: No Integration

**Works fine without either!** You can:
- Paste issues or project lists manually
- Describe your backlog in conversation
- Still get all framework guidance and strategic advice

The slash commands will prompt you for manual input instead of pulling from an integration.

---

### Test It Works

**After restarting Claude Code**, start a new session in any project:

```bash
claude
```

Then ask: **"Should I write a PRD or prototype first?"**

**Expected behavior:** Claude pushes you toward prototyping, references frameworks, challenges assumptions.

**Try slash commands:**
- `/lno-prioritize` - Categorize issues by impact
- `/four-risks` - Run risk assessment on a feature
- `/now-next-later` - Generate a roadmap

---

## Available Slash Commands

### `/lno-prioritize`

Apply Aakash Gupta's LNO framework to categorize Linear issues:
- **Leverage (L):** 10x impact tasks - your highest priority
- **Neutral (N):** Regular impact tasks
- **Overhead (O):** Minimal impact tasks to minimize

```bash
/lno-prioritize                    # Categorize all issues
/lno-prioritize --team product     # Specific team
/lno-prioritize --label            # Auto-add Linear labels
```

### `/four-risks`

Run Marty Cagan's Four Risks assessment (value, usability, feasibility, viability):

```bash
/four-risks ENG-245               # Assess specific issue
/four-risks --current-sprint      # Assess sprint issues
/four-risks --add-comment         # Add assessment to Linear
```

### `/now-next-later`

Generate a Now-Next-Later roadmap from Linear projects (Janna Bastow's framework):

```bash
/now-next-later                   # Generate roadmap
/now-next-later --team eng        # Specific team
/now-next-later --export          # Export markdown
```

### `/coder`

Apply Brian Balfour's CODER framework for organizational AI adoption:

```bash
/coder                            # Start CODER framework
/coder --diagnose                 # Identify adoption barriers
```

### `/pmf-survey`

Create and analyze PMF surveys (Rahul Vohra's Superhuman method):

```bash
/pmf-survey                       # Start PMF survey wizard
/pmf-survey --create              # Generate survey questions
/pmf-survey --analyze [data]      # Analyze results
```

**[→ See detailed command documentation in README](README.md#slash-commands)**

---

## For Teams: Per-Project Installation

Want your whole team to have PM Thought Partner when working on a specific project?

**Just ask Claude:**

```
Add the PM Thought Partner plugin to this project repository
so my team can use it
```

Claude will add it to `.claude/plugins/` in your project and you can commit it.

**Benefits:**
- Team members automatically get it when working on this project
- Version controlled (everyone uses same frameworks)
- Can have different versions per project if needed

---

## Updating

**To get the latest frameworks:**

```
Update the PM Thought Partner plugin to the latest version
```

Claude will pull the latest changes from GitHub.

---

## Troubleshooting

**"Slash commands aren't working"**
- Make sure you're in a Claude Code session (`claude` command)
- Check if commands are symlinked: `ls -la ~/.claude/commands/` should show the command files
- If commands aren't symlinked, run: `ln -sf ~/.claude/plugins/pm-thought-partner/commands/*.md ~/.claude/commands/`
- Restart Claude Code after symlinking
- Try using natural language: "Apply LNO prioritization to my issues"

**"Claude says it can't find Linear issues"**
- Check Linear MCP is set up: Ask Claude "Is Linear MCP configured?"
- Verify Linear API key is correct
- Try: "List my Linear issues" to test connection

**"The frameworks seem generic"**
- Ask specific questions: "Apply the Four Risks framework to this feature"
- Reference frameworks by name
- Give context about your product and situation

---

## What's Next?

Once installed, use your PM Thought Partner for:
- Feature validation before building
- Backlog prioritization
- Growth strategy planning
- Roadmap generation
- PMF measurement
- AI adoption planning

**This is your on-demand PM advisor, grounded in frameworks from the world's best product leaders.**

---

<details>
<summary><strong>Advanced: Manual Installation</strong></summary>

If you prefer to install manually without asking Claude:

### Global Install (Available in all projects)

```bash
# Clone the repository
git clone https://github.com/breethomas/pm-thought-partner.git

# Symlink to Claude's plugins directory (recommended)
ln -s "$(pwd)/pm-thought-partner" ~/.claude/plugins/pm-thought-partner

# Symlink the slash commands
ln -sf ~/.claude/plugins/pm-thought-partner/commands/*.md ~/.claude/commands/

# Or copy if you prefer a stable version
mkdir -p ~/.claude/plugins
cp -r pm-thought-partner ~/.claude/plugins/
ln -sf ~/.claude/plugins/pm-thought-partner/commands/*.md ~/.claude/commands/
```

**Tip:** Plugin symlink is better - `git pull` updates automatically apply. Commands must always be symlinked to `~/.claude/commands/`.

### Per-Project Install (Team access)

```bash
# In YOUR project directory
cd /path/to/your/project

# Add as project plugin
mkdir -p .claude/plugins
cp -r /path/to/pm-thought-partner .claude/plugins/pm-thought-partner

# Symlink the slash commands to global commands directory
ln -sf "$(pwd)/.claude/plugins/pm-thought-partner/commands"/*.md ~/.claude/commands/

# Commit to your repo
git add .claude/
git commit -m "Add PM Thought Partner plugin"
git push
```

**Note:** Commands are still symlinked to `~/.claude/commands/` globally, but the plugin content lives in your project.

### Verify Manual Installation

```bash
# Check global install
ls -la ~/.claude/plugins/pm-thought-partner

# Check per-project install
ls -la .claude/plugins/pm-thought-partner

# Check commands are linked
ls -la ~/.claude/commands/
```

</details>

---

**Need help?** Open an issue: https://github.com/breethomas/pm-thought-partner/issues

🚀 **Happy shipping!**
