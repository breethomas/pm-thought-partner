# PM Thought Partner for the AI Era

Your strategic thinking partner for product decisions. Works through problems with you, asks tough questions, challenges assumptions, helps you ship faster by thinking clearer.

Grounded in proven frameworks, reimagined through an AI-first lens. A soundboard for strategy first, automation second. Bringing AI as a meaningful partner to PM work, not just knowledge about it.

## Why I Built This

I have favorite frameworks. Articles I reference constantly. Thought leaders whose work shaped how I think about product. But it's hard to keep all of that accessible, let alone apply it quickly when you're building.

I started exploring Anthropic's Skills feature as an exercise in creating specificity for Claude around the kinds of product management that matter to me. Could I teach Claude not just PM frameworks, but *how I like to PM*? The frameworks that influence how I ship?

It quickly turned into something more interesting. A plugin. A way to leverage Claude Code as a meaningful thought partner capable of getting up to speed on two kinds of context: the problem I'm solving *and* how I approach product work.

This is also an homage to product leaders who gave back to the community in ways that shaped how we all work. The thought leaders included here shared their frameworks publicly, and that generosity made me better at my job.

And honestly? Product teams got stale. Engineers, PMs, designers, UX, data analysts... we'd settled into predictable patterns. AI changed that. We're breaking out of old processes, the technology is moving fast, and we're collaborating in ways that feel new again. I like that it's all getting weird. ✨

This is opinionated. Not every PM practice ever described. Focused on those who push modern practices while honoring timeless foundations. Context over prompts. Shipping to learn. Frameworks as tools, not rules.

It has a long way to go, but it's a start. And it's open source because the best frameworks came from people sharing what works.

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

### Backlog Automation

**Connect Linear or GitHub to auto-analyze your backlog in seconds.**

- **`/lno-prioritize`** - Categorize 50+ issues by impact (Leverage/Neutral/Overhead)
- **`/four-risks [issue-id]`** - Pull issue, assess risks, add analysis as comment
- **`/now-next-later`** - Generate roadmap from Linear projects, send back categorized

**Setup (2 min):** [Get Linear API key](https://linear.app/settings/api) → Ask Claude "Set up the Linear MCP server"

**No MCP?** All commands work with manual input. Paste issues or describe context directly.

### 20+ PM Frameworks On Demand

Applied through conversation, not lectures:

- **Growth:** `/growth-loops`, `/four-fits`
- **AI Products:** `/ai-cost-check`, `/ai-health-check`, `/start-evals`
- **Measurement:** `/pmf-survey`
- **Adoption:** `/coder`

**[→ See all 20+ commands](commands/)** | **[→ Browse frameworks](frameworks/)**

Plus comprehensive framework library covering discovery, growth, AI, planning, and measurement.

---

## Why This Is Different

Most AI tools for PMs automate busy work: generate PRDs, create tickets, reply to comments.

**PM Thought Partner is your sparring partner, not your assistant.**

It applies proven frameworks to real product decisions. Challenges assumptions. Pushes you toward prototypes over docs. Knows not just PM frameworks, but *how you like to PM*.

Automation is table stakes. Strategic thinking is the moat.

---

## Installation

**PM Thought Partner is a CLI plugin for Claude Code.**

**Fastest setup (30 seconds):**

Ask Claude:
```
Install the PM Thought Partner plugin from
https://github.com/breethomas/pm-thought-partner
```

Or clone manually:
```bash
git clone https://github.com/breethomas/pm-thought-partner.git ~/.claude/plugins/pm-thought-partner
cd ~/.claude/plugins/pm-thought-partner
./install.sh
```

**⚠️ Restart Claude Code** after installation to load slash commands.

**[→ Full installation guide with Linear/GitHub setup](INSTALL_PLUGIN.md)**

### Privacy Note

By default, `/strategy-session` outputs and `/reflect` summaries are saved locally but gitignored.

**If you want to commit your strategic thinking:**
1. Remove `sessions/` and `reflections/` from `.gitignore`
2. Commit to your repo (or team repo)
3. Now your product thinking is version-controlled and searchable

**Why gitignore by default?** Sessions contain company strategy, competitive insights, and product decisions that most PMs won't want in their git history.

### For Teams

Install to your project so the whole team has access:

```bash
git clone https://github.com/breethomas/pm-thought-partner.git .claude/plugins/pm-thought-partner
```

Commit to version control. Team members get it automatically when working on the project.

---

## Quick Verification

**Test it works:**
```
"Should I write a PRD for this recommendation engine or prototype it first?"
```

**Try slash commands:**
```
/strategy-session
/lno-prioritize
/four-risks
```

You'll get responses grounded in proven frameworks.

---

## Core Philosophy

**This is not classic PM knowledge with AI updates bolted on.** It's built AI-era first: prototype-first development, issues over user stories, continuous calibration, and modern execution velocity.

### Key Principles

1. **Prototype in hours, not document for weeks** - Show, don't tell. Working prototypes beat specs.

2. **Build to learn, not spec to build** - Iteration is cheap. Test assumptions with real artifacts.

3. **Issues not user stories** - Clear tasks. Skip the ceremony.

4. **Apply proven frameworks** - Grounded in proven wisdom. Adapted for AI-era speed.

5. **AI products need different approaches** - Continuous calibration (CC/CD). Evals for quality. Unit economics for viability.

6. **Speed is the moat** - When powerful AI is everywhere, execution velocity matters.

### Conversation Style

The PM Thought Partner is:

- **Direct and challenging** - Pushes back when needed, doesn't just agree
- **Modern and pragmatic** - Embraces AI-era tools and speed
- **Grounded in wisdom** - References proven frameworks, not trendy tactics
- **Prototype-first** - Always biases toward building to learn
- **No ceremony** - Skips theater, focuses on outcomes

**It will ask tough questions:**
- "What problem are you solving?"
- "What evidence do you have?"
- "Can you prototype this instead of writing about it?"
- "Have you talked to customers?"
- "How will you measure success?"

---

## What's Inside

### Framework Organization

```
frameworks/
├── ai-era-practices/        # Modern product development
│   ├── prototype-first.md
│   ├── context-engineering.md
│   ├── issues-not-stories.md
│   └── continuous-calibration.md
│
├── discovery/               # How to learn what to build
│   ├── continuous-discovery.md
│   └── four-risks.md
│
├── growth/                  # How to scale sustainably
│   ├── growth-loops.md
│   └── four-fits.md
│
├── planning/                # How to communicate plans
│   ├── now-next-later.md
│   └── lno-prioritization.md
│
└── ai/                      # AI-native building
    ├── pm-friendly-evals-guide.md # Start here
    ├── fine-tuning-vs-rag.md
    └── production-ai-systems.md
```

**[→ Browse all frameworks](frameworks/)** | **[→ Meet the thought leaders](thought-leaders/)**

---

## Examples

### Strategy Session

**You:** `/strategy-session "AI-powered recommendations"`

**PM Thought Partner:**
- Gathers context (reads your project files, recent commits)
- "I've reviewed your e-commerce platform - Next.js frontend, Rails API, 50K users."
- "What problem are you solving? Users don't know what to do next, or they're not engaged?"
- "Do you have evidence recommendations will fix that? What do users say when they drop off?"
- "Could you talk to 10 users this week before building anything?"

**Result:** Structured summary with decisions, risks, prototypes to build, open questions. Creates Linear issues automatically.

### Validating a Feature

**You:** "I think we should add dark mode."

**PM Thought Partner:**
- "What evidence do you have that users want this?"
- "Can you prototype this in a few hours and show it to 5 users?"
- "How will you measure if this was worth building?"

### Building AI Features

**You:** "We want AI-powered recommendations."

**PM Thought Partner:**
- "Does your data change frequently? Use RAG. Need consistent style at scale? Consider fine-tuning."
- "Have you started with evals? Write 20 test cases in a spreadsheet this week."
- "What's your cost model? Inference costs scale with usage."
- "How will users override when the AI is wrong?"

---

## AI-Era Adaptations

While grounded in proven frameworks, the PM Thought Partner emphasizes AI-era realities:

**Classic PM:**
- Write comprehensive specs
- Plan in long cycles
- Features take weeks to build
- Documentation as communication

**AI-Era PM:**
- Prototype in hours, test with users
- Ship continuously, iterate daily
- Build MVPs in afternoons
- Working prototypes as communication

**Classic PM frameworks still apply** (discovery, four risks, growth loops), but **execution velocity has fundamentally changed**.

### AI-Specific Frameworks

- **Fine-tuning vs RAG** - When to use each approach based on your product needs
- **Production AI Systems** - Demo-to-product gap, data quality, cost optimization
- **PM-Friendly Evals** - Start small (20 test cases), scale smart
- **AI Unit Economics** - Modeling costs and monetization
- **Continuous Calibration** - CC/CD for AI products
- **Prompt Engineering for PMs** - Product strategy in disguise

---

## What's Next

This has a long way to go, but we're shipping to learn.

**Recently shipped:**
- ✅ **Strategic reflection** (`/reflect`) - Pattern recognition across your thinking over time

**On the horizon:**
- **PM onboarding workflows** - New job? Plugin reads repos, docs, recent issues, gives you a strategic brief on the domain and key decisions
- **Bidirectional sync** - Write comments, update issues, not just read them
- **Analytics tool integrations** - Bring product data (Amplitude, Mixpanel) into strategic conversations
- **Claude marketplace submission** - When it's ready

Want to contribute? See [Contributing](#contributing) below.

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

## Limitations

The PM Thought Partner:

- ❌ **Does not create new PM frameworks** - It synthesizes existing wisdom
- ❌ **Is not a substitute for talking to users** - Discovery still requires real conversations
- ❌ **Is not always right** - Frameworks are tools, not rules. Context matters.
- ❌ **Cannot execute for you** - It guides thinking, you still do the work
- ❌ **Reflects a point in time** - PM best practices evolve (Jan 2025 snapshot)

It's a thought partner, not a replacement for PM judgment.

---

## FAQ

**How is this different from just asking Claude about PM topics?**

Claude has general knowledge. PM Thought Partner has curated frameworks from specific thought leaders, AI-era adaptations, bias toward prototype-first execution, and interconnected frameworks that build on each other.

**Can I use this for my team?**

Yes! Designed for individual PMs learning frameworks, teams adopting shared vocabulary, coaching junior PMs, and aligning on product practices.

**What if a framework doesn't fit my situation?**

Frameworks are tools, not rules. The PM Thought Partner encourages adaptation: "Here's the framework and the context it was designed for. What's different in your situation? How might you adapt this?"

**Does this limit what Claude can answer?**

No. It enhances Claude's PM capabilities but doesn't restrict general knowledge. Ask about growth strategy → uses frameworks. Ask Claude to write code → uses general knowledge. Enhancement, not restriction.

---

## License & Attribution

**License:** MIT (see LICENSE file)

**Attribution:** All frameworks attributed to original creators in sources.yml.

This repository synthesizes and applies existing wisdom. It does not claim ownership of the frameworks. Only the curation, adaptation, and integration for AI-era PM work.

---

**Built with:** Claude Code
**Maintained by:** Bree Thomas
**Last Updated:** January 2025

**Questions or feedback?** Open an issue on GitHub.

---

**Remember:** This is a thought partner for the AI era. It will push you to prototype instead of document, challenge assumptions with proven frameworks, and help you ship faster while thinking deeper.

Let's build great products. 🚀
