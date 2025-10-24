# Prompt Library

**For PMs using Claude.ai in the browser who want quick access to frameworks without setting up a full Project.**

## How to Use These Prompts

1. Browse the prompts below or in individual files
2. Copy the entire prompt (includes framework context + instructions)
3. Paste into any Claude conversation at claude.ai
4. Claude will respond using the specific framework

**Each prompt includes:**
- Full framework context and principles
- Specific instructions for application
- Key questions to ask
- Integration with other frameworks

## Available Prompts

### Product-Market Fit

**File:** [`pmf-survey.txt`](./pmf-survey.txt)

**Use when:** You want to measure whether you have product-market fit

**Framework:** Rahul Vohra's PMF survey methodology

---

### CODER Framework (AI Adoption)

**File:** [`coder-framework.txt`](./coder-framework.txt)

**Use when:** Driving AI adoption across your organization

**Framework:** Brian Balfour's CODER framework (Constraints, Ownership, Directives, Expectations, Rewards)

---

## Want More Prompts?

We currently maintain a focused set of copy/paste prompts. For full access to all 20+ frameworks:

### Option 1: CLI Plugin (Recommended)
Install the PM Thought Partner plugin for slash commands and Linear integration.
**[→ Installation guide](../INSTALL_PLUGIN.md)**

### Option 2: Claude Projects
Set up a persistent PM thought partner in Claude Projects.
**[→ Setup guide](../CLAUDE_PROJECTS_GUIDE.md)**

---

## How to Use Prompts Effectively

### 1. Add Your Context

Open the prompt file and paste it into a new Claude conversation, then immediately add:
- Product stage (0-1, PMF, growth, scale)
- Product type (B2B SaaS, consumer, AI product, marketplace)
- Specific challenge you're facing

**Example:**
```
[Paste PMF survey prompt from file]

Context: We're a B2B SaaS company with 50 paying customers, $50K MRR,
80% month-over-month retention. We think we have PMF but want to validate.
```

### 2. Ask Follow-up Questions

Have a conversation:
- "Why is that the right approach?"
- "What are the risks?"
- "Can you show me an example?"
- "How does this connect to other frameworks?"

## Limitations vs. Full Installation

**What works with prompts:**
- ✅ Quick access to specific frameworks
- ✅ No installation required
- ✅ Works in browser

**What doesn't work:**
- ❌ Claude won't remember frameworks across conversations
- ❌ Manual copy/paste each time
- ❌ Can't access all 20+ frameworks simultaneously
- ❌ No Linear/GitHub integration
- ❌ No slash commands

**Solution:** For ongoing PM work, install the full plugin or set up Claude Projects.

## Creating Custom Prompts

Want a prompt for a different framework? Use this template:

```
I need help with [specific challenge] using [framework name] from [thought leader].

Framework context:
[Copy relevant sections from /frameworks/ in the repository]

My situation:
[Your specific context]

Help me:
1. Apply this framework to my situation
2. Challenge my assumptions
3. Identify what I'm missing
4. Create a concrete next step
```

**Browse all frameworks:** [/frameworks/](../frameworks/)

---

**Prefer a more permanent setup?** Install the [CLI plugin](../INSTALL_PLUGIN.md) or set up [Claude Projects](../CLAUDE_PROJECTS_GUIDE.md) for persistent access to all 13 thought leaders and 20+ frameworks.
