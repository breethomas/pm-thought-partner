# PM Thought Partner for the AI Era

Your strategic thinking partner for product decisions. Works through problems with you, asks tough questions, challenges assumptions, helps you ship faster by thinking clearer.

Grounded in frameworks from Marty Cagan, Teresa Torres, Elena Verna, Brian Balfour, Chip Huyen, and more. Plus backlog automation when you need it.

## Why I Built This

I started exploring Anthropic's Skills feature and realized I was building the thought partner I'd always wanted.

Here's the problem: I have favorite frameworks. Articles I reference constantly. Thought leaders whose work shaped how I think. But it's hard to keep all of that accessible, let alone apply it quickly when you're building.

I'm not dogmatic about process. I follow the recipe exactly the first time — then tweak it every time after. Same with frameworks. Learn the foundation, adapt to your context.

This is also an homage to product leaders who gave back to the community in ways that shaped how we all work. Marty Cagan. Teresa Torres. Elena Verna. Brian Balfour, and more. Their generosity in sharing frameworks publicly made me better at my job.

And honestly? Product teams got stale. Engineers, PMs, designers, UX, data analysts... we'd settled into predictable patterns. AI changed that. We're all breaking out of old processes, the technology is moving fast, and we're collaborating in ways that feel new again. It's some of the most fun I've had in a long time. I like that it's all getting weird.

This is opinionated. It's not every PM practice ever described. It's focused on those who push modern practices while honoring timeless foundations. Context over prompts. Shipping to learn. Frameworks as tools, not rules.

It's open source because the best frameworks came from people sharing what works. If this helps you, contribute back. Add a framework. Update one that evolved. Make it better.

---

## What This Does

### Strategic Thinking Partner

**`/strategy-session` - Your product soundboard**

Work through product problems conversationally. Claude gathers project context proactively (reads your README, commits, architecture), then asks probing questions that apply PM frameworks naturally.

- Feature planning and validation
- Risk assessment (Marty Cagan's Four Risks)
- Roadmap decisions
- "Should we build this?" conversations

**What you get:**
- 10-15 minute strategic conversation
- Structured capture: decisions, risks, prototypes, open questions
- Actionable Linear issues created from insights

**Start:** `/strategy-session` or `/strategy-session "recommendation engine"`

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

Plus comprehensive framework library covering discovery, growth, AI, planning, and measurement.

**[→ Browse all frameworks](frameworks/)** | **[→ See all commands](commands/)**

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

You'll get responses grounded in frameworks from thought leaders like Marty Cagan, Teresa Torres, Elena Verna, Brian Balfour, Chip Huyen, and more.

---

## Core Philosophy

**This is not classic PM knowledge with AI updates bolted on.** It's built AI-era first: prototype-first development, issues over user stories, continuous calibration, and modern execution velocity.

### Key Principles

1. **Prototype in hours, not document for weeks** - Show, don't tell. Working prototypes beat specs.

2. **Build to learn, not spec to build** - Iteration is cheap. Test assumptions with real artifacts.

3. **Issues not user stories** - Clear tasks. Skip the ceremony.

4. **Apply proven frameworks** - Grounded in wisdom from Marty Cagan, Teresa Torres, Elena Verna, Brian Balfour, Chip Huyen, Aman Khan, and others. Adapted for AI-era speed.

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
│   ├── continuous-discovery.md    # Teresa Torres
│   └── four-risks.md              # Marty Cagan
│
├── growth/                  # How to scale sustainably
│   ├── growth-loops.md            # Elena Verna
│   └── four-fits.md               # Brian Balfour
│
├── planning/                # How to communicate plans
│   ├── now-next-later.md          # Janna Bastow
│   └── lno-prioritization.md      # Aakash Gupta
│
└── ai/                      # AI-native building
    ├── pm-friendly-evals-guide.md # Start here (Aman Khan + Hamel Husain)
    ├── fine-tuning-vs-rag.md      # Decision framework
    └── production-ai-systems.md   # Chip Huyen
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
- References Teresa Torres (continuous discovery)
- "Can you prototype this in a few hours and show it to 5 users?"
- Applies Marty Cagan's four risks
- "How will you measure if this was worth building?"

### Building AI Features

**You:** "We want AI-powered recommendations."

**PM Thought Partner:**
- "Does your data change frequently? Use RAG. Need consistent style at scale? Consider fine-tuning."
- "Have you started with evals? Write 20 test cases in a spreadsheet this week."
- "What's your cost model? Inference costs scale with usage."
- "How will users override when the AI is wrong?"

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
- **Production AI Systems** (Chip Huyen) - Demo-to-product gap, data quality, cost optimization
- **PM-Friendly Evals** - Start small (20 test cases), scale smart (Aman Khan + Hamel Husain)
- **AI Unit Economics** - Modeling costs and monetization
- **Continuous Calibration** - CC/CD for AI products
- **Prompt Engineering for PMs** - Product strategy in disguise

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

## Acknowledgments

Grateful to the thought leaders whose public work made this possible:

Marty Cagan, Teresa Torres, Elena Verna, Brian Balfour, Lenny Rachitsky, Rahul Vohra, Janna Bastow, Aakash Gupta, Aman Khan, Chip Huyen, Ravi Mehta, the Linear team, and the Reforge community.

Their generosity in sharing frameworks publicly enables PMs everywhere to improve their craft.

---

**Built with:** Claude Code
**Maintained by:** Bree Thomas
**Last Updated:** January 2025

**Questions or feedback?** Open an issue on GitHub.

---

**Remember:** This is a thought partner for the AI era. It will push you to prototype instead of document, challenge assumptions with proven frameworks, and help you ship faster while thinking deeper.

Let's build great products.
