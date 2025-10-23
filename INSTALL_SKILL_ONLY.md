# Skill-Only Installation Guide

Get the **lightweight PM Thought Partner** without slash commands or Linear integration.

## What You Get

- ✅ AI thought partner grounded in 12+ PM frameworks
- ✅ Context-aware framework application
- ✅ Prototype-first guidance
- ✅ All frameworks from Marty Cagan, Elena Verna, Brian Balfour, Teresa Torres, and more

## What You Don't Get

- ❌ Slash commands (e.g., `/lno-prioritize`, `/four-risks`)
- ❌ Linear integration
- ❌ Auto-labeling or issue analysis

**Need these features?** See [Plugin Installation](INSTALL_PLUGIN.md) instead.

---

## Installation Methods

### Option 1: Claude Code CLI

**Prerequisites:**
- Claude Code CLI installed ([instructions](https://docs.anthropic.com/claude/docs/claude-code))
- Git (for cloning the repo)

**Install:**
```bash
# Clone the repository
git clone https://github.com/breethomas/pm-thought-partner.git
cd pm-thought-partner

# Install as skill (just the AI thought partner)
claude skill install skills/pm-thought-partner
```

**Verify installation:**
```bash
claude skill list
```

You should see `pm-thought-partner` in the list.

---

### Option 2: Claude Code in Browser

**Prerequisites:**
- Access to Claude Code in Browser ([claude.ai/code](https://claude.ai/code))

**Install:**

1. Go to [claude.ai/code](https://claude.ai/code)
2. Enter the GitHub repository URL in the text field at the top:
   ```
   https://github.com/breethomas/pm-thought-partner
   ```
3. Press Enter or click the upload button
4. Claude Code will clone the repository and load the skill automatically

**Verify installation:**
- Check if the repository appears in your sessions
- Ask: "Should I write a PRD or prototype first?" (should push you toward prototyping)
- Try: "What PM frameworks are available?"

---

### Option 3: Claude Projects (Web Only - Limited)

**⚠️ Not Recommended:** Claude Projects cannot access framework files, so you'll only get the core thought partner behavior without detailed framework guidance.

**If you still want to try:**

1. Go to [claude.ai](https://claude.ai)
2. Create a new Project
3. Copy the entire [`skills/pm-thought-partner/SKILL.md`](skills/pm-thought-partner/SKILL.md) file
4. Paste it into the **"Custom Instructions"** field (NOT the Description)
5. Name your project "PM Thought Partner"

**What works:** Core behaviors (prototype-first guidance, AI-era thinking)
**What doesn't work:** Detailed framework references, examples from framework files

---

## Quick Start

Once installed, just talk to Claude like a PM thought partner:

### Prototype-First Challenges

```
"I'm writing a PRD for a new recommendation engine"
→ Claude pushes you to prototype first

"Should I build this feature?"
→ Claude applies Four Risks framework

"Help me prioritize these 10 features"
→ Claude uses LNO framework
```

### Apply Frameworks

```
"Apply the Four Risks framework to this feature: [describe feature]"

"Use the Growth Loops framework to analyze our viral loop"

"Run Rahul Vohra's PMF survey framework on our product"

"Create a Now-Next-Later roadmap from these projects: [paste projects]"
```

### Get Strategic Guidance

```
"How should I measure PMF?"

"What's the difference between growth loops and funnels?"

"How do I run continuous discovery like Teresa Torres?"

"What's Brian Balfour's Product Operating Model?"
```

---

## Available Frameworks

The skill includes frameworks from:

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

**View all frameworks:** [`frameworks/`](frameworks/) directory

---

## How It Works

The skill makes Claude:

1. **Push you to prototype** instead of document
   - Challenges PRD-first thinking
   - Suggests AI tools for rapid prototyping
   - Emphasizes Build → Learn → Decide

2. **Apply proven frameworks** contextually
   - Recognizes when a framework is relevant
   - Adapts frameworks for AI-era speed
   - Grounds advice in PM thought leader wisdom

3. **Challenge assumptions** with rigor
   - Questions your assertions
   - Asks for evidence
   - Pushes for customer validation

4. **Embrace AI-era product development**
   - Prototypes ship in hours, not weeks
   - Technical debt is cheap
   - Speed is the moat

---

## Updating the Skill

**Claude Code CLI:**
```bash
cd pm-thought-partner
git pull
claude skill update pm-thought-partner
```

**Claude Code Browser:**
Claude will notify you when updates are available.

**Claude Projects:**
You'll need to manually update the Custom Instructions field with the latest SKILL.md content.

---

## Upgrading to Plugin

Want slash commands and Linear integration later?

**From CLI:**
```bash
cd pm-thought-partner
claude skill uninstall pm-thought-partner
claude plugin install .
```

**From Browser:**
Ask Claude: "Uninstall the PM Thought Partner skill and install the plugin instead"

See [Plugin Installation Guide](INSTALL_PLUGIN.md) for full instructions.

---

## Troubleshooting

### Skill not activating
- Verify skill is installed: `claude skill list`
- Try asking directly: "What is the LNO framework?"
- Check you're using Claude Code (CLI or Browser), not Claude Projects

### Getting generic responses instead of framework guidance
- Make sure you installed from `skills/pm-thought-partner/`, not the root
- If using Claude Projects, this is expected (no file access)
- Consider upgrading to full plugin for better experience

### Framework references not working
- This is a known limitation of Claude Projects
- Use Claude Code (CLI or Browser) for full framework access
- Or upgrade to plugin installation

---

## Support

- **Report issues:** https://github.com/breethomas/pm-thought-partner/issues
- **Contribute:** See [CONTRIBUTING.md](CONTRIBUTING.md)
- **Discuss:** Open a GitHub Discussion

---

## What's Next?

1. **Test it out** - Ask a PM question and see how the thought partner responds
2. **Explore frameworks** - Browse [`frameworks/`](frameworks/) to see what's available
3. **Consider upgrading** - If you find it useful, [install the plugin](INSTALL_PLUGIN.md) for slash commands + Linear
4. **Share feedback** - What frameworks are missing? What would make this more useful?

**Happy shipping! 🚀**
