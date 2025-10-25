# PM Thought Partner for the AI Era

An AI-powered product management thought partner for Claude Code. Grounded in proven frameworks from 13 top PM thought leaders, adapted for the reality where you can build MVPs in hours, AI handles coordination work, and speed is the moat.

**This is not classic PM knowledge with AI updates bolted on.** It's built AI-era first: prototype-first development, issues over user stories, continuous calibration, and modern execution velocity.

## Why I Built This

I started exploring Anthropic's Skills feature and realized I was building the thought partner I'd always wanted.

Here's the problem: I have favorite frameworks. Articles I reference constantly. Thought leaders whose work shaped how I think. But it's hard to keep all of that accessible, let alone apply it quickly when you're building.

I'm not dogmatic about process. I follow the recipe exactly the first time—then tweak it every time after. Same with frameworks. Learn the foundation, adapt to your context.

This is also an homage to product leaders who gave back to the community in ways that shaped how we all work. Marty Cagan. Teresa Torres. Elena Verna. Brian Balfour. Their generosity in sharing frameworks publicly made me better at my job.

And honestly? Product teams got stale. Engineers, PMs, designers, UX, data analysts—we'd settled into predictable patterns. AI changed that. We're all breaking out of old processes, the technology is moving fast, and we're collaborating in ways that feel new again. It's some of the most fun I've had in a long time. I like that it's all getting weird.

This is opinionated. It's not every PM practice ever described. It's focused on those who push modern practices while honoring timeless foundations. Context over prompts. Shipping to learn. Frameworks as tools, not rules.

It's open source because the best frameworks came from people sharing what works. If this helps you, contribute back. Add a framework. Update one that evolved. Make it better.

---

## What This Does

Acts as your product management thought partner to:

- **Challenge assumptions** with proven frameworks (Marty Cagan, Teresa Torres, Elena Verna, Brian Balfour, and more)
- **Push you toward prototyping** over lengthy documentation
- **Apply strategic thinking** from the world's best PM thinkers
- **Navigate AI product complexity** (production systems, evals, unit economics, continuous calibration)
- **Auto-analyze your backlog** - Prioritize 50+ issues in 10 seconds with `/lno-prioritize` (Linear/GitHub MCP)
- **Help you ship faster** while thinking deeper
- **Create modern deliverables** (lite PRDs, Linear-style issues, AI product specs)

### Works With Your Issue Tracker

**The real power:** Connect Linear or GitHub to auto-analyze your entire backlog in seconds instead of manual spreadsheet work.

**Backlog automation commands** (MCP highly recommended):
- **`/lno-prioritize`** - Analyze 50+ issues and auto-label by impact (Leverage/Neutral/Overhead) in 10 seconds
- **`/four-risks [issue-id]`** - Pull issue details, assess risks, add analysis as comment
- **`/now-next-later`** - Generate roadmap from your Linear projects or GitHub milestones

**Strategic framework commands** (MCP optional):
- **`/growth-loops`**, **`/four-fits`**, **`/ai-cost-check`**, **`/ai-health-check`**, **`/start-evals`** - Best with your voice-to-text context
- MCP integration lets you attach analysis back to issues as comments (optional)

**Standalone commands** (no MCP needed):
- **`/pmf-survey`** - Create and analyze PMF surveys (Rahul Vohra's Superhuman framework)
- **`/coder`** - Organizational AI adoption (Brian Balfour's CODER framework)

**Setup (2 minutes):**
- **Linear MCP:** [Get API key](https://linear.app/settings/api) → Ask Claude "Set up the Linear MCP server for me"
- **GitHub MCP:** [GitHub MCP server](https://github.com/github/github-mcp-server) → Follow setup guide

**No MCP?** All commands work with manual input. Just paste issues or describe your context directly.

## Quick Links

**Installation:**
- **[CLI Plugin](INSTALL_PLUGIN.md)** - Command line installation (recommended, fastest)
- **[Claude Projects](CLAUDE_PROJECTS_GUIDE.md)** - Browser-based setup (no command line required)

**Reference:**
- **[Browse All Frameworks](frameworks/)** - See all 20+ PM frameworks included
- **[View Slash Commands](#slash-commands)** - Quick framework access (CLI plugin only)

## Installation

**Choose based on your workflow:**

### CLI Plugin (Command Line) - Recommended

**Fastest and easiest setup.** One command, 30 seconds.

**What you get:**
- Slash commands (`/lno-prioritize`, `/four-risks`, `/now-next-later`)
- Linear MCP or GitHub MCP integration
- Applies frameworks directly to your backlog

> **Note:** Not yet in Claude Code Marketplace. Installation requires cloning from GitHub for now.

**Option 1: Ask Claude (easiest)**
```
Install the PM Thought Partner plugin from
https://github.com/breethomas/pm-thought-partner
```

**Option 2: Clone and run install script**
```bash
git clone https://github.com/breethomas/pm-thought-partner.git ~/.claude/plugins/pm-thought-partner
cd ~/.claude/plugins/pm-thought-partner
./install.sh
```

**Option 3: Manual installation (no script)**
```bash
git clone https://github.com/breethomas/pm-thought-partner.git ~/.claude/plugins/pm-thought-partner
ln -sf ~/.claude/plugins/pm-thought-partner/commands/*.md ~/.claude/commands/
```

**⚠️ RESTART REQUIRED:** After installation, exit and restart Claude Code to load slash commands.

**[→ Full installation guide](INSTALL_PLUGIN.md)** (includes Linear setup and troubleshooting)

---

### Claude Projects (Browser)

**What you get:**
- Works across all your PM conversations
- Full access to all framework content
- Not tied to a specific repository

**Limitations:**
- ❌ No slash commands
- ❌ No Linear/GitHub integration
- ❌ Manual framework application (no automated backlog analysis)

**Why you'd choose this:**
- ✅ Works on strategy, planning, roadmaps, prioritization
- ✅ Available everywhere (not repository-specific)
- ✅ No command line required

**Setup (15 minutes):**
1. Download the framework files from this repository
2. Create a Claude Project
3. Upload the framework files as Project Knowledge
4. Add the PM Thought Partner instructions

**[→ See step-by-step Claude Projects setup guide](CLAUDE_PROJECTS_GUIDE.md)**

---

### 🤔 What About Claude Code in Browser?

**We're skipping it** because it opens a coding session in the PM Thought Partner repository itself, not your actual work. Claude Projects is simpler and more useful for day-to-day PM conversations.

---

### 🏢 For Teams

**Option: Per-Project Plugin Install**

Add PM Thought Partner to specific project repositories so your whole team has access.

**Just ask Claude:**
```
Add the PM Thought Partner plugin to this project repository
so my team can use it
```

Claude will add it to `.claude/plugins/` and you can commit it to version control.

**Benefits:**
- Team members automatically get it when working on this project
- Version controlled (everyone uses same frameworks)
- Can have different versions per project if needed

**[→ See full team setup guide](INSTALL_PLUGIN.md#for-teams-per-project-installation)**

---

### Verification

**Test it works:**
```
"Should I write a PRD for this recommendation engine or prototype it first?"
```

**With plugin installed, try slash commands:**
```
/lno-prioritize
/four-risks
/now-next-later
```

If working correctly, you'll get responses grounded in frameworks from thought leaders like Marty Cagan, Teresa Torres, Elena Verna, Brian Balfour, Chip Huyen, Aman Khan, and more.

## Slash Commands

**Available with plugin installation only.** These commands give you quick access to specific frameworks.

### `/lno-prioritize`

Apply Aakash Gupta's LNO framework to categorize Linear issues by impact:
- **Leverage (L):** 10x impact tasks - your highest priority
- **Neutral (N):** Regular impact tasks
- **Overhead (O):** Minimal impact tasks to minimize

```bash
/lno-prioritize                    # Categorize all issues
/lno-prioritize --team product     # Specific team
/lno-prioritize --label            # Auto-add Linear labels
```

### `/four-risks`

Run Marty Cagan's Four Risks assessment on a Linear issue:
- Value Risk: Will customers use/buy this?
- Usability Risk: Can users figure it out?
- Feasibility Risk: Can we build it?
- Viability Risk: Does it work for our business?

```bash
/four-risks ENG-245               # Assess specific issue
/four-risks --current-sprint      # Assess sprint issues
/four-risks --add-comment         # Add assessment to Linear
```

### `/now-next-later`

Generate a Now-Next-Later roadmap from Linear projects using Janna Bastow's framework:
- **NOW:** High certainty, committed work
- **NEXT:** Medium certainty, exploring solutions
- **LATER:** Low certainty, ideas and options

```bash
/now-next-later                   # Generate roadmap
/now-next-later --team eng        # Specific team
/now-next-later --export          # Export markdown
```

### `/coder`

Apply Brian Balfour's CODER framework for organizational AI adoption:
- **C**onstraints - Make new behavior easier
- **O**wnership - Assign responsibility
- **D**irectives - Create instructions
- **E**xpectations - Set measurable goals
- **R**ewards - Tie to career progression

```bash
/coder                            # Start CODER framework
/coder --diagnose                 # Identify adoption barriers
```

### `/pmf-survey`

Create and analyze PMF surveys using Rahul Vohra's Superhuman framework:
- The magic "very disappointed" >40% benchmark
- Segment by high-expectation customers
- Generate improvement plan

```bash
/pmf-survey                       # Start PMF survey wizard
/pmf-survey --create              # Generate survey questions
/pmf-survey --analyze [data]      # Analyze results
```

### `/start-evals`

Start AI quality testing without overengineering (Aman Khan + Hamel Husain):
- Generates your first 20 test cases
- Good → Better → Best progression
- Spreadsheet tracking or Linear project

```bash
/start-evals "AI product recommendations"  # Generate test cases
/start-evals --create-project              # Create Linear eval project
/start-evals --interactive                 # Step-by-step wizard
```

### `/ai-health-check`

Pre-launch readiness assessment for AI features (Chip Huyen):
- Model selection strategy (tried prompting before fine-tuning?)
- Data quality & preparation
- Cost modeling at scale
- Production monitoring plan
- Failure handling UX
- System-level optimization

```bash
/ai-health-check ENG-245          # Assess specific AI feature
/ai-health-check --pre-launch     # Check all sprint AI features
/ai-health-check --add-comment    # Add checklist to Linear
```

### `/ai-cost-check`

Calculate AI feature costs at scale to validate viability:
- Cost per request
- Cost per user at 100, 1K, 10K, 100K scale
- % of revenue consumed by AI
- Optimization opportunities (caching, cheaper models)

```bash
/ai-cost-check "product recommendations"   # Calculate costs
/ai-cost-check --model gpt-4               # Specify model
/ai-cost-check --compare                   # Compare across models
```

### `/growth-loops`

Design compounding growth systems (Elena Verna):
- Identify viral, content, network effect, or paid loops
- Map where output becomes input
- Analyze loop velocity
- Implementation suggestions

```bash
/growth-loops                     # Analyze current product
/growth-loops "referral program"  # Design loop for feature
/growth-loops --velocity          # Optimize loop speed
```

### `/four-fits`

Validate sustainable scaling readiness (Brian Balfour):
- Market ↔ Product: Do customers want this?
- Product ↔ Channel: Can we reach them efficiently?
- Channel ↔ Model: Do economics work?
- Model ↔ Market: Can we monetize profitably?

```bash
/four-fits                        # Full assessment
/four-fits --validate             # Pre-scale validation
/four-fits --diagnose             # Identify blocking fit
```

**[→ See command documentation](commands/)** for detailed usage

---

## How to Use

#### Discovery & Validation

```
"I want to validate this product idea"
```

**What you'll get:**
- Teresa Torres' continuous discovery approach
- Marty Cagan's four risks framework
- Emphasis on prototyping to test quickly
- Weekly customer conversation habits

#### Growth Strategy

```
"How do we grow faster?"
```

**What you'll get:**
- Elena Verna's growth loops (not just funnels)
- Brian Balfour's four fits validation
- Stage-appropriate tactics from Reforge
- Focus wins framework

#### AI Products

```
"We're building an AI feature. What do I need to think about?"
```

**What you'll get:**
- Chip Huyen's production AI systems (demo-to-product gap, data quality, cost optimization)
- PM-friendly evals guide (start with 20 test cases, scale smart - Aman Khan + Hamel Husain)
- Aman Khan's comprehensive evals framework (systematic testing when you're ready)
- Continuous calibration (CC/CD) approach
- Prompt engineering for PMs
- AI unit economics and monetization
- Ravi Mehta's AI integration framework

#### Roadmapping

```
"I need to create a roadmap"
```

**What you'll get:**
- Janna Bastow's Now-Next-Later framework
- Pushed toward outcomes vs features
- Emphasis on managing uncertainty
- How AI accelerates roadmap movement

#### Competitive Analysis

```
"I need to analyze our competitors"
```

**What you'll get:**
- Strategic insights focus (not feature checklists)
- Template for competitive analysis
- How to find gaps and opportunities
- What to learn and apply

#### Stakeholder Communication

```
"I need to present this to leadership"
```

**What you'll get:**
- Aakash Gupta's visual frameworks approach
- Stakeholder communication strategies
- How to tailor message to audience
- Modern deliverable formats

### Getting Frameworks and Templates

You can explicitly ask for specific frameworks:

```
"Show me the Product Strategy Stack framework"
"What's the PMF survey approach?"
"How do I measure growth loops?"
"Give me the competitive analysis template"
"What's the continuous calibration framework for AI?"
```

The PM Thought Partner will reference specific markdown files in this repository and explain how to apply them.

## What's Inside

### Framework Organization

```
pm-thought-partner/
├── SKILL.md                          # Skill definition (what the AI knows)
├── README.md                         # This file
├── sources.yml                       # Attribution and learning sources
│
├── frameworks/                       # Core PM frameworks
│   ├── ai-era-practices/            # Modern product development
│   │   ├── prototype-first.md       # Build to learn, don't document to build
│   │   ├── context-engineering.md   # Context > prompts, systems thinking
│   │   ├── prompt-engineering-for-pms.md # How PMs should think about prompting
│   │   ├── issues-not-stories.md    # Linear Method approach
│   │   ├── organizational-ai-adoption.md # CODER framework
│   │   ├── ai-unit-economics.md     # Monetization and cost modeling
│   │   └── continuous-calibration.md # CC/CD for AI products
│   │
│   ├── discovery/                   # How to learn what to build
│   │   ├── continuous-discovery.md  # Teresa Torres
│   │   └── four-risks.md            # Marty Cagan
│   │
│   ├── growth/                      # How to scale sustainably
│   │   ├── growth-loops.md          # Elena Verna
│   │   ├── four-fits.md             # Brian Balfour
│   │   └── product-led-sales.md     # Elena Verna
│   │
│   ├── measurement/                 # How to measure success
│   │   └── pmf-survey.md            # Rahul Vohra
│   │
│   ├── planning/                    # How to communicate plans
│   │   ├── now-next-later.md        # Janna Bastow
│   │   ├── lno-prioritization.md    # Aakash Gupta
│   │   ├── scope-projects-down.md   # Linear Method
│   │   ├── prioritize-enablers-blockers.md # Linear Method
│   │   ├── frontier-of-understanding.md # Teresa Torres
│   │   └── product-operating-model.md # Marty Cagan
│   │
│   └── ai/                          # AI-native building
│       ├── pm-friendly-evals-guide.md # Start here for evals (Aman Khan + Hamel Husain)
│       ├── ai-evals.md              # Comprehensive evals (Aman Khan)
│       └── production-ai-systems.md # Chip Huyen
│
├── templates/                       # Modern deliverables
│   ├── lite-prd.md                  # Outcome-focused, concise
│   ├── linear-issue.md              # Clear, direct tasks
│   ├── ai-product-spec.md           # Evals, costs, calibration
│   └── competitive-analysis.md      # Strategic insights focus
│
└── thought-leaders/                 # The foundations
    ├── marty-cagan.md               # Product discovery, four risks
    ├── teresa-torres.md             # Continuous discovery, OST
    ├── elena-verna.md               # Growth loops, PLG
    ├── brian-balfour.md             # Four fits, focus wins
    ├── lenny-rachitsky.md           # Synthesizer, community
    ├── rahul-vohra.md               # PMF survey
    ├── janna-bastow.md              # Now-Next-Later roadmapping
    ├── aakash-gupta.md              # Visual frameworks, communication
    ├── aman-khan.md                 # AI evals, AI-native products
    ├── chip-huyen.md                # Production AI, ML systems engineering
    ├── ravi-mehta.md                # Product Strategy Stack, AI integration
    ├── linear-method.md             # Issues not stories, direction over process
    ├── reforge.md                   # Practitioner wisdom, monetization
    └── README.md                    # Overview of thought leaders
```

### Core Philosophy

1. **Prototype in hours, not document for weeks** - Show, don't tell. Working prototypes beat specs.

2. **Build to learn, not spec to build** - Iteration is cheap. Test assumptions with real artifacts.

3. **Issues not user stories** - Clear tasks. Skip the ceremony.

4. **Apply proven frameworks** - Grounded in wisdom from Marty Cagan, Teresa Torres, Elena Verna, Brian Balfour, Chip Huyen, Aman Khan, and others. Adapted for AI-era speed.

5. **AI products need different approaches** - Continuous calibration (CC/CD). Evals for quality. Unit economics for viability.

6. **Speed is the moat** - When everyone has GPT-4, execution velocity matters.

## Thought Leaders Included

The PM Thought Partner synthesizes publicly available frameworks from:

- **Marty Cagan** - Product discovery, four risks, empowered teams
- **Teresa Torres** - Continuous discovery habits, opportunity solution trees
- **Elena Verna** - Growth loops, product-led growth
- **Brian Balfour** - Four fits, focus wins, growth strategy
- **Lenny Rachitsky** - Synthesizer of best practices, community insights
- **Rahul Vohra** - PMF survey, high-expectation customers
- **Janna Bastow** - Now-Next-Later roadmapping, cone of uncertainty
- **Aakash Gupta** - Visual frameworks, stakeholder communication, AI prototyping
- **Aman Khan** - AI evals, vibe-driven development, AI-native products
- **Chip Huyen** - Production AI systems, ML engineering, data quality over tools
- **Ravi Mehta** - Product Strategy Stack, AI integration framework
- **Linear** - Issues not stories, direction → building → quality
- **Reforge** - Practitioner wisdom, monetization, growth frameworks

## Contributing & Updates

### Philosophy on Updates

PM frameworks evolve. What works today might not work tomorrow. This repository is designed to be:

- **Living:** Can be updated as frameworks evolve
- **Community-driven:** Open to contributions
- **Source-attributed:** Every framework links to original sources
- **Versioned:** Track changes over time

### How to Contribute

This is currently a personal project, but contributions are welcome:

1. **Open an issue** to discuss proposed changes
2. **Submit a pull request** with updates to frameworks or new thought leader additions
3. **Include sources** - All frameworks must link to publicly available original content

### Quality Standards

Contributions should:

- ✅ Reference publicly available content (articles, podcasts, books)
- ✅ Provide attribution to original thinkers
- ✅ Focus on frameworks and mental models (not just tactics)
- ✅ Be adaptable to different contexts (not rigid playbooks)
- ✅ Include practical application guidance
- ✅ Maintain AI-era first perspective

### Updating Frameworks

If a thought leader updates their framework or new insights emerge:

1. Check `sources.yml` for original source links
2. Verify the update is from official/authoritative source
3. Update the relevant markdown file
4. Update "Last Updated" date
5. Document what changed and why

## Sources & Attribution

All frameworks in this repository come from publicly available content. See `sources.yml` for complete attribution and links to original sources.

**Key principle:** The PM Thought Partner synthesizes and applies existing wisdom. It does not claim to create new frameworks. It makes proven frameworks accessible and applicable.

## AI-Era Adaptations

While grounded in proven frameworks, the PM Thought Partner emphasizes AI-era realities:

### What's Different from Classic PM

**Classic PM:**
- Write comprehensive specs
- Coordinate manually across tools
- Plan in long cycles
- Features take weeks to build
- Documentation as communication

**AI-Era PM (This Skill):**
- Prototype in hours, test with users
- AI syncs changes, reduces coordination overhead
- Ship continuously, iterate daily
- Build MVPs in afternoons
- Working prototypes as communication

**Classic PM frameworks still apply** (discovery, four risks, growth loops, PMF measurement), but **execution velocity has fundamentally changed**.

### What the PM Thought Partner Adds

**AI-specific frameworks:**
- Production AI Systems (Chip Huyen) - Demo-to-product gap, data quality over tools, cost optimization
- PM-Friendly Evals Guide - Start small (20 test cases), scale smart (Aman Khan + Hamel Husain)
- AI Evals & Testing (Aman Khan) - Comprehensive systematic testing approach
- AI Unit Economics - Modeling costs and monetization with marginal inference costs
- Continuous Calibration (CC/CD) - How to develop AI products differently
- Prompt Engineering for PMs - Product strategy in disguise
- AI Integration Framework (Ravi Mehta) - Combining off-the-shelf AI with your unique advantages

**Modern execution practices:**
- Prototype-first development
- Issues not user stories (Linear Method)
- Visual frameworks for communication (Aakash Gupta)
- Speed-oriented roadmapping (Janna Bastow adapted)

## Tone & Approach

The PM Thought Partner is designed to be:

- **Direct and challenging** - Pushes back when needed, doesn't just agree
- **Modern and pragmatic** - Embraces AI-era tools and speed
- **Grounded in wisdom** - References proven frameworks, not trendy tactics
- **Prototype-first** - Always biases toward building to learn
- **No ceremony** - Skips theater, focuses on outcomes
- **Speed-oriented** - Helps you move faster, not document more

**It will ask tough questions:**
- "What problem are you solving?"
- "What evidence do you have?"
- "Can you prototype this instead of writing about it?"
- "Have you talked to customers?"
- "How will you measure success?"

## Examples of Usage

### Example 1: Validating a Feature Idea

**You:** "I think we should add dark mode to our app."

**PM Thought Partner:**
- "What evidence do you have that users want this?"
- "Have you talked to customers about this?"
- References Teresa Torres (continuous discovery)
- "Can you prototype this in a few hours and show it to 5 users?"
- Applies Marty Cagan's four risks: value, usability, feasibility, viability
- "How will you measure if this was worth building?"

### Example 2: Measuring Product-Market Fit

**You:** "How do I know if we have PMF?"

**PM Thought Partner:**
- Explains Rahul Vohra's PMF survey
- "Run a survey: How would users feel if they could no longer use your product?"
- ">40% saying 'very disappointed' indicates PMF"
- "Segment responses by user type. Focus on high-expectation customers"
- "This is a point-in-time measurement; run quarterly as you evolve"

### Example 3: Building an AI Feature

**You:** "We want to add AI-powered recommendations."

**PM Thought Partner:**
- "Have you tried prompt engineering before fine-tuning? Fine-tuning should be your last resort." (Chip Huyen)
- "What's your data quality strategy? Data quality beats tool selection." (Chip Huyen)
- "Have you started with evals? Write 20 test cases in a spreadsheet this week." (PM-friendly evals)
- "Have you designed evals for what makes a 'good' recommendation vs 'bad'?" (Aman Khan)
- "What's your cost model? Inference costs scale with usage." (AI unit economics, Chip Huyen)
- "Start with low agency. AI suggests, human decides. Earn autonomy." (Continuous calibration)
- "How will users override when the AI is wrong?" (UX for AI failures)
- "What's your prompt strategy for this?" (Prompt engineering)

### Example 4: Roadmap Planning

**You:** "Leadership wants a roadmap with dates for the next year."

**PM Thought Partner:**
- References Janna Bastow's Now-Next-Later
- "Roadmaps should communicate sequence and certainty, not false dates"
- "Now: committed, Next: likely, Later: possible"
- "Use cone of uncertainty. Confidence decreases over time"
- "Can you show a working prototype of 'Now' items to validate direction?"

## Limitations

The PM Thought Partner:

- ❌ **Does not create new PM frameworks** - It synthesizes existing wisdom
- ❌ **Is not a substitute for talking to users** - Discovery still requires real conversations
- ❌ **Is not always right** - Frameworks are tools, not rules. Context matters.
- ❌ **Cannot execute for you** - It guides thinking, you still do the work
- ❌ **Reflects a point in time** - PM best practices evolve (Jan 2025 snapshot)

It's a thought partner, not a replacement for PM judgment.

## Frequently Asked Questions

### How is this different from just asking Claude about PM topics?

**Claude has general knowledge.** The PM Thought Partner has:
- Curated frameworks from specific thought leaders
- AI-era adaptations of classic PM wisdom
- Bias toward prototype-first, modern execution
- Structured templates and deliverables
- Interconnected frameworks that build on each other

### Can I use this for my team?

Yes! This is designed for:
- Individual PMs learning frameworks
- Teams adopting shared vocabulary
- Coaching junior PMs
- Aligning on product practices

Share the repository, install it, use together.

### How do I know these frameworks are good?

Every framework comes from:
- Published articles, books, podcasts from recognized PM thought leaders
- Practitioners with track records (CPOs, VPs of Product at top companies)
- Battle-tested at companies like Airbnb, Spotify, HubSpot, Facebook, etc.

Check `sources.yml` for original attributions.

### What if a framework doesn't fit my situation?

**Frameworks are tools, not rules.**

It encourages adaptation:
- "Here's the framework, here's the context it was designed for"
- "What's different in your situation?"
- "How might you adapt this?"

Always apply judgment, don't follow blindly.

### How often will this be updated?

This is a living repository. Updates will happen when:
- Thought leaders publish significant new frameworks
- AI-era practices evolve meaningfully
- Community contributes improvements
- Frameworks prove outdated or incorrect

No fixed schedule, but maintained actively.

### Can I request new thought leaders be added?

Yes! Open an issue with:
- Who you'd like added
- Why they're relevant (unique contribution)
- Links to their publicly available content
- How they fit with existing frameworks

Quality and uniqueness matter more than quantity.

### Does the PM Thought Partner limit what Claude can answer?

**No.** It enhances Claude's PM capabilities with proven frameworks but doesn't restrict general knowledge.

**You can freely mix topics:**
- Ask about growth strategy → Uses PM Thought Partner frameworks
- Ask Claude to write Python code → Uses general knowledge
- Ask about competitive analysis → Uses PM Thought Partner template

Enhancement, not restriction.

### What if I ask about a PM framework not included?

**Claude will still help using general PM knowledge.** It'll be transparent that the framework isn't in the curated set and suggest it could be added if valuable.

**What you get:**
- ✅ Curated frameworks from 13 thought leaders + AI-era adaptations
- ✅ General PM help outside these frameworks
- ✅ Custom solutions for your specific situation

Curated doesn't mean limited.

### Can I use the PM Thought Partner for non-PM work?

**Yes, absolutely.**

The PM Thought Partner is active in the background, but you can ask Claude anything:
- PM questions → Enhanced with frameworks
- Code questions → Normal Claude capabilities
- Writing/analysis/anything else → Normal Claude capabilities

**Think of it as:** Claude with a PM expert on call, not Claude that only knows PM.

## License & Attribution

**License:** MIT (see LICENSE file)

**Attribution:** All frameworks attributed to original creators in `sources.yml`.

This repository synthesizes and applies existing wisdom. It does not claim ownership of the frameworks. Only the curation, adaptation, and integration for AI-era PM work.

## Acknowledgments

Grateful to the thought leaders whose public work made this possible:

Marty Cagan, Teresa Torres, Elena Verna, Brian Balfour, Lenny Rachitsky, Rahul Vohra, Janna Bastow, Aakash Gupta, Aman Khan, Chip Huyen, Ravi Mehta, the Linear team, and the Reforge community.

Their generosity in sharing frameworks publicly enables PMs everywhere to improve their craft.

---

**Built with:** Claude Code
**Maintained by:** Bree Thomas
**Last Updated:** January 2025

**Questions or feedback?** Open an issue on GitHub or reach out directly.

---

**Remember:** This is a thought partner for the AI era. It will push you to prototype instead of document, challenge assumptions with proven frameworks, and help you ship faster while thinking deeper.

Let's build great products. 🚀
