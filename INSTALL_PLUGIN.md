# Plugin Installation Guide (CLI)

**For technical PMs and engineers** who use Claude Code CLI.

**Looking for non-technical PM setup?** → [Claude Projects Guide](CLAUDE_PROJECTS_GUIDE.md)

---

## What You Get

- ✅ AI thought partner grounded in 12+ PM frameworks
- ✅ Slash commands for quick framework access (`/lno-prioritize`, `/four-risks`, etc.)
- ✅ Optional Linear integration (apply frameworks to your backlog)
- ✅ Works in your actual project repositories
- ✅ All frameworks from Marty Cagan, Elena Verna, Brian Balfour, Teresa Torres, and more

---

## Installation

### Just Ask Claude

**If you're using Claude Code CLI, just ask Claude to install it:**

```
Install the PM Thought Partner plugin from
https://github.com/breethomas/pm-thought-partner
```

Claude will:
1. Clone the repository
2. Ask if you want it globally (all projects) or per-project (this repo only)
3. Install it to the appropriate location
4. Verify it's working

**When Claude asks:**
- Choose **"globally"** if you want PM frameworks everywhere (recommended)
- Choose **"per-project"** if you only want it in specific repos

**That's it.** You're using an AI coding assistant—let it do the installation work.

---

### Test It Works

Start Claude Code in any project:

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

## Adding Linear Integration (Optional)

The plugin includes powerful Linear integration for applying frameworks directly to your backlog.

**What Linear integration enables:**
- `/lno-prioritize` - Categorize Linear issues by impact (Leverage/Neutral/Overhead)
- `/four-risks [issue-id]` - Run Marty Cagan's risk assessment on specific issues
- `/now-next-later` - Generate roadmap from Linear projects
- Auto-label issues with framework categorizations

### Setup Linear MCP Server

**Just ask Claude:**

```
Set up the Linear MCP server for me
```

Claude will prompt you for your Linear API key ([get one here](https://linear.app/settings/api)) and configure everything.

**Or manually:**

```bash
claude mcp add linear
```

Follow the prompts to add your Linear API key.

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

**[→ See detailed command documentation](commands/)**

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
- Try using natural language: "Apply LNO prioritization to my issues"
- Restart Claude Code

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

# Or copy if you prefer a stable version
mkdir -p ~/.claude/plugins
cp -r pm-thought-partner ~/.claude/plugins/
```

**Tip:** Symlink is better - `git pull` updates automatically apply.

### Per-Project Install (Team access)

```bash
# In YOUR project directory
cd /path/to/your/project

# Add as project plugin
mkdir -p .claude/plugins
cp -r /path/to/pm-thought-partner .claude/plugins/pm-thought-partner

# Commit to your repo
git add .claude/
git commit -m "Add PM Thought Partner plugin"
git push
```

### Verify Manual Installation

```bash
# Check global install
ls -la ~/.claude/plugins/pm-thought-partner

# Check per-project install
ls -la .claude/plugins/pm-thought-partner
```

</details>

---

**Need help?** Open an issue: https://github.com/breethomas/pm-thought-partner/issues

🚀 **Happy shipping!**
