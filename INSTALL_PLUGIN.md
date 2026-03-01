# Plugin Installation Guide

**Command line installation** for Claude Code CLI.

---

## What You Get

- 26 skills and 7 specialized agents as your PM thinking partner
- Skills for quick framework access (`/strategy-session`, `/four-risks`, `/shape`, etc.)
- Optional Linear integration (apply frameworks to your backlog)
- Competitive intelligence system (systematic competitor analysis)
- Works in your actual project repositories
- All frameworks from Marty Cagan, Elena Verna, Brian Balfour, Teresa Torres, Ryan Singer, and more

---

## Installation

### Quick Install (Copy/Paste)

Run these two commands in Claude Code:

```
/plugin marketplace add breethomas/pm-thought-partner
```

```
/plugin install pm-thought-partner@breethomas
```

That's it. Start a new session and your skills are available.

---

### Why Two Steps?

Claude Code plugins use a "marketplace" system. First you add the source (the GitHub repo), then you install from that source. This is similar to how package managers work (add a repo, then install from it).

---

## Set Up Competitive Research Directory (Optional)

**First time running `/competitive-research`?** The skill will guide you through creating a personal research directory.

**Why a separate directory?**
- Keeps competitive intel separate from company codebases
- You own your strategic research, independent of employer
- No risk of accidentally committing sensitive analysis to git

**Recommended setup:**
```
~/Documents/pm-work/competitive-research/
```

The skill will ask you where to save competitive research on first run and remember your preference.

---

## Connect Your Issue Tracker (Highly Recommended)

**One-liner value:** Auto-analyze 50+ issues in 10 seconds with `/lno-prioritize` instead of spending hours in spreadsheets.

**The real power of this plugin** is applying frameworks from Marty Cagan, Elena Verna, and Brian Balfour directly to your backlog—not just talking about them.

### What MCP Integration Unlocks

**Backlog automation** (this is where MCP shines):
- **`/lno-prioritize`** - Analyze your entire backlog and auto-label by impact (Leverage/Neutral/Overhead)
- **`/four-risks [issue-id]`** - Pull issue details, assess all four risks, add analysis as comment
- **`/now-next-later`** - Generate roadmap from your Linear projects or GitHub milestones

**Strategic frameworks** (these work great without MCP too):
- **`/growth-loops`**, **`/four-fits`**, **`/ai-cost-check`** - Best with your voice-to-text context
- MCP lets you attach analysis to issues (optional), but doesn't read issues for insights

---

### Option 1: Linear MCP

**Why Linear?**
- Built for product teams (roadmaps, discovery, prioritization)
- Linear Method is one of our core frameworks
- Rich project/issue metadata

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
- Same skill capabilities as Linear MCP
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

The skills will prompt you for manual input instead of pulling from an integration.

---

### Test It Works

Start a new Claude Code session in any project and ask:

**"Should I write a PRD or prototype first?"**

**Expected behavior:** Claude pushes you toward prototyping, references frameworks, challenges assumptions.

**Try skills:**
- `/strategy-session` - Work through product decisions conversationally
- `/shape` - Shape work using Shape Up methodology
- `/spec --ai` - Spec an AI feature with context engineering
- `/four-risks` - Run risk assessment on a feature
- `/workspace-calibration` - Analyze your Linear workspace health
- `/reflect` - Analyze patterns across your strategic thinking

**[See all skills and detailed usage in README](README.md)**

---

## Updating

**To get the latest version:**

```
/plugin update pm-thought-partner@breethomas
```

---

## Troubleshooting

**"Skills don't appear in slash command autocomplete"**
- This is a [known Claude Code bug](https://github.com/anthropics/claude-code/issues/17271) affecting all plugins
- Skills still work — type `/pm-thought-partner:skill-name` directly, or just describe your problem in natural language
- Run `/skills` to see all available skills

**"Skills aren't working"**
- Make sure you're in a Claude Code session (`claude` command)
- Verify the plugin is installed: `/plugin list` should show pm-thought-partner
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
- AI feature planning and calibration

**This is your on-demand PM advisor, grounded in frameworks from the world's best product leaders.**

---

**Need help?** Open an issue: https://github.com/breethomas/pm-thought-partner/issues
