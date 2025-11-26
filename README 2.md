# PM Thought Partner

**Your sparring partner, not your assistant.** 🥊

Claude Code plugin that applies proven PM frameworks to real product decisions. Challenges assumptions. Asks tough questions. Pushes you toward prototypes over docs.

Opinionated. Curated for prototype-first, AI-era product work.

---

## Thought Leaders Included

The PM Thought Partner synthesizes publicly available frameworks from:

- **Marty Cagan** - Product discovery, four risks, empowered teams
- **Teresa Torres** - Continuous discovery habits, opportunity solution trees
- **Elena Verna** - Growth loops, product-led growth
- **Brian Balfour** - Four fits, focus wins, growth strategy
- **Chip Huyen** - Production AI systems, ML engineering, data quality
- **Aman Khan** - AI evals, vibe-driven development, AI-native products
- **Janna Bastow** - Now-Next-Later roadmapping, cone of uncertainty
- **Aakash Gupta** - Visual frameworks, stakeholder communication
- **Rahul Vohra** - PMF survey, high-expectation customers
- **Ravi Mehta** - Product Strategy Stack, AI integration framework
- **Linear** - Issues not stories, direction → building → quality
- **Reforge** - Practitioner wisdom, monetization, growth frameworks

**[→ Read detailed profiles](thought-leaders/)**

---

## What This Does

### Strategic Thinking Partner

**`/strategy-session` - Your product soundboard**

Work through product problems conversationally. Claude gathers project context proactively (reads your README, commits, architecture), then asks probing questions that apply PM frameworks naturally.

- Feature planning and validation
- Risk assessment
- Roadmap decisions
- "Should we build this?" conversations

**What you get:**
- Strategic conversation that adapts to your problem
- Structured capture: decisions, risks, prototypes, open questions
- Actionable Linear issues created from insights

**Start:** `/strategy-session` or `/strategy-session "recommendation engine"`

### Strategic Reflection

**`/reflect` - Pattern recognition across your decisions**

See patterns in your strategic thinking over time:
- Analyze decision-making trends across multiple sessions
- Track which frameworks you use most
- Identify unresolved questions blocking progress
- Weekly/monthly reflection ritual

Sessions are saved locally (gitignored by default for privacy).

**Start:** `/reflect` or `/reflect "this month"`

### Competitive Intelligence

**`/competitive-research` - Systematic competitive analysis that compounds over time**

Inspired by Teresa Torres' compounding systems approach. Thorough competitor research with automated synthesis, comparison tables, and strategic insights.

- Sequential agent research (thorough analysis per competitor)
- First analysis: ~1 hour for 5 competitors with structured output
- Update existing research: ~15 minutes (that's the compound effect)
- Automated synthesis with comparison tables
- Saved to personal research directory (outside company repos)
- Optional Linear integration for roadmap impact

**First run:** Sets up personal competitive research directory for privacy

**Start:** `/competitive-research` then provide competitor list

### Backlog Automation

**Connect Linear or GitHub to auto-analyze your backlog in seconds.**

- **`/lno-prioritize`** - Categorize 50+ issues by impact (Leverage/Neutral/Overhead)
- **`/four-risks [issue-id]`** - Pull issue, assess risks, add analysis as comment
- **`/now-next-later`** - Generate roadmap from Linear projects, send back categorized

**Setup (2 min):** [Get Linear API key](https://linear.app/docs/api-and-webhooks) (Settings > Account > Security & Access) → Ask Claude "Set up the Linear MCP server"

**No MCP?** All commands work with manual input. Paste issues or describe context directly.

### Strategic Commands

Applied through conversation, not lectures:

- **Competitive Intel:** `/competitive-research`
- **Growth:** `/growth-loops`, `/four-fits`
- **AI Products:** `/ai-cost-check`, `/ai-health-check`, `/start-evals`
- **Measurement:** `/pmf-survey`
- **Adoption:** `/coder`

**[→ See all commands](commands/)** | **[→ Browse frameworks](frameworks/)**

Plus comprehensive framework library with 40+ documented approaches covering discovery, growth, AI, planning, and measurement.

---

## Installation

Ask Claude Code:
```
Install the PM Thought Partner plugin from
https://github.com/breethomas/pm-thought-partner
```

**[→ Full guide with Linear/GitHub setup](INSTALL_PLUGIN.md)**

### Privacy Note

By default, `/strategy-session` outputs and `/reflect` summaries are saved locally but gitignored.

**If you want to commit your strategic thinking:**
1. Remove `sessions/` and `reflections/` from `.gitignore`
2. Commit to your repo (or team repo)
3. Now your product thinking is version-controlled and searchable

**Why gitignore by default?** Sessions contain company strategy, competitive insights, and product decisions that most PMs won't want in their git history.

---

## How It Works

**You:** "Should I build AI recommendations or improve search first?"

**PM Thought Partner:**
- Reads your codebase context
- "What evidence do you have that discovery is the problem?"
- "Can you prototype both and test with 10 users this week?"
- Applies Four Risks framework, suggests evals strategy
- Creates Linear issues with next steps

**It pushes back.** Won't just agree with your idea. Will ask for evidence, suggest prototypes over PRDs, and challenge you to talk to users.

---

## Contributing

This is a living repository. PM frameworks evolve.

**How to contribute:**
1. Open an issue to discuss proposed changes
2. Submit a pull request with framework updates or new thought leaders
3. Include sources - all frameworks must link to publicly available content

**Quality standards:**
- ✅ Reference publicly available content (articles, podcasts, books)
- ✅ Provide attribution to original thinkers
- ✅ Focus on frameworks and mental models (not just tactics)
- ✅ Maintain AI-era first perspective

**[→ See sources.yml for complete attribution](sources.yml)**

---

## Ideas & Future Directions

Exploring what PM Thought Partner could become. These aren't commitments—they're concepts to discuss and evolve with the community.

**[→ Browse ideas](ideas/)** - Potential features like PM onboarding intelligence, analytics integration, responsible vibe coding workflows

**Want to discuss an idea?** Open an issue. **Have your own idea?** Check the ideas directory for the template.

---

## License & Attribution

MIT License. All frameworks attributed to original creators in [sources.yml](sources.yml).

Built with Claude Code by [Bree Thomas](https://github.com/breethomas)
