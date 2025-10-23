# PM Thought Partner for the AI Era

An AI-powered product management thought partner for Claude Code. Grounded in proven frameworks from 12+ top PM thought leaders, adapted for the reality where you can build MVPs in hours, AI handles coordination work, and speed is the moat.

**This is not classic PM knowledge with AI updates bolted on.** It's built AI-era first—emphasizing prototype-first development, issues over user stories, continuous calibration, and modern execution velocity.

## What This Does

Acts as your product management thought partner to:

- **Challenge assumptions** with proven frameworks (Teresa Torres, Marty Cagan, Brian Balfour, Elena Verna, and more)
- **Push you toward prototyping** over lengthy documentation
- **Apply strategic thinking** from the world's best PM thinkers
- **Apply frameworks to real work** with Linear (recommended) or GitHub Issues (fallback)
- **Help you ship faster** while thinking deeper
- **Navigate AI product complexity** (evals, unit economics, continuous calibration)
- **Create modern deliverables** (lite PRDs, Linear-style issues, AI product specs)

## Quick Links

**For Technical PMs:**
- **[CLI Plugin Installation](INSTALL_PLUGIN.md#option-1-claude-code-cli-recommended)** - Full experience with slash commands + Linear

**For Non-Technical PMs:**
- **[Claude Projects Setup Guide](CLAUDE_PROJECTS_GUIDE.md)** - Simple browser-based setup (15 min)

**Reference:**
- **[Browse All Frameworks](frameworks/)** - See all 15+ PM frameworks included
- **[View Slash Commands](#slash-commands)** - Quick framework access (CLI plugin only)

## Installation

**Choose based on your role and needs:**

### 👨‍💻 For Technical PMs / Engineers

**Best option: Claude Code CLI with Plugin**

Get slash commands for applying frameworks to your actual projects. Works with **Linear (recommended)** or **GitHub Issues (fallback)**.

**Just ask Claude to install it:**
```
Install the PM Thought Partner plugin from
https://github.com/breethomas/pm-thought-partner
```

Claude will ask if you want it globally (all projects) or per-project. Choose **globally** for most use cases.

**[→ See full guide with slash commands](INSTALL_PLUGIN.md)** (includes Linear setup)

---

### 📋 For Non-Technical PMs

**Best option: Claude Projects**

Simple setup, works across all your PM conversations, no coding required.

**Why Claude Projects instead of Claude Code Browser?**
- ✅ Works on ANY of your PM work (roadmaps, PRDs, prioritization, etc.)
- ✅ Not tied to a specific code repository
- ✅ No Git, no GitHub App, no command line
- ✅ Full access to all framework content

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

If working correctly, you'll get responses grounded in frameworks from Marty Cagan, Elena Verna, Brian Balfour, Teresa Torres, and other top PM leaders.

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

**[→ See command documentation](commands/)** for detailed usage

---

## How to Use

### General Workflow

Just start a conversation with Claude about product management work:

- **"I'm trying to figure out if we have product-market fit"**
  - Will apply Rahul Vohra's PMF survey framework
  - Challenge you on evidence and measurement

- **"Should I write a PRD for this feature idea?"**
  - Will push you to prototype first instead
  - Reference AI-era practices (prototype-first development)

- **"How should I prioritize these 10 features?"**
  - Will apply prioritization frameworks
  - Ask about strategy, measurement, and evidence

- **"I need to present our product strategy to executives"**
  - Will help create visual frameworks (Aakash Gupta style)
  - Reference Ravi Mehta's Product Strategy Stack

- **"We're adding an AI feature—how do I think about pricing?"**
  - Will apply AI unit economics frameworks
  - Reference Reforge monetization mistakes
  - Challenge you on cost modeling

### Specific Use Cases

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
"We're building an AI feature—what do I need to think about?"
```

**What you'll get:**
- Aman Khan's AI evals framework
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

The skill will reference specific markdown files in this repository and explain how to apply them.

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
│   │   ├── issues-not-stories.md    # Linear Method approach
│   │   ├── ai-unit-economics.md     # Monetization and cost modeling
│   │   ├── continuous-calibration.md # CC/CD for AI products
│   │   └── prompt-engineering-for-pms.md # How PMs should think about prompting
│   │
│   ├── discovery/                   # How to learn what to build
│   │   ├── continuous-discovery.md  # Teresa Torres
│   │   └── four-risks.md            # Marty Cagan
│   │
│   ├── growth/                      # How to scale sustainably
│   │   ├── growth-loops.md          # Elena Verna
│   │   └── four-fits.md             # Brian Balfour
│   │
│   ├── measurement/                 # How to measure success
│   │   └── pmf-survey.md            # Rahul Vohra
│   │
│   ├── planning/                    # How to communicate plans
│   │   └── now-next-later.md        # Janna Bastow
│   │
│   └── ai/                          # AI-native building
│       └── ai-evals.md              # Aman Khan
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
    ├── ravi-mehta.md                # Product Strategy Stack, AI integration
    ├── linear-method.md             # Issues not stories, direction over process
    └── reforge.md                   # Practitioner wisdom, monetization
```

### Core Philosophy

This skill operates on these principles:

1. **Prototype in hours, not document for weeks**
   - Modern tools (Cursor, Claude Code, v0, Bolt, Replit) enable rapid prototyping
   - Show, don't tell—working prototypes communicate better than specs

2. **Build to learn, not spec to build**
   - AI-era reality: iteration is cheaper than ever
   - Test assumptions with real artifacts, not documents

3. **Issues not user stories**
   - Clear, direct task descriptions (Linear Method)
   - Skip the ceremony, focus on outcomes

4. **Apply proven frameworks**
   - Grounded in wisdom from Marty Cagan, Teresa Torres, Elena Verna, Brian Balfour, and others
   - Adapted for AI-era speed and tooling

5. **AI products need different approaches**
   - Continuous calibration (CC/CD) not just CI/CD
   - Evals for quality, unit economics for viability
   - Prompt engineering as product strategy

6. **Speed is the moat**
   - When everyone has access to GPT-4, execution velocity matters
   - Ship continuously, learn from real users

## Thought Leaders Included

This skill synthesizes publicly available frameworks from:

- **Marty Cagan** - Product discovery, four risks, empowered teams
- **Teresa Torres** - Continuous discovery habits, opportunity solution trees
- **Elena Verna** - Growth loops, product-led growth
- **Brian Balfour** - Four fits, focus wins, growth strategy
- **Lenny Rachitsky** - Synthesizer of best practices, community insights
- **Rahul Vohra** - PMF survey, high-expectation customers
- **Janna Bastow** - Now-Next-Later roadmapping, cone of uncertainty
- **Aakash Gupta** - Visual frameworks, stakeholder communication, AI prototyping
- **Aman Khan** - AI evals, vibe-driven development, AI-native products
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

**Key principle:** This skill synthesizes and applies existing wisdom. It does not claim to create new frameworks—it makes proven frameworks accessible and applicable.

## AI-Era Adaptations

While grounded in proven frameworks, this skill emphasizes AI-era realities:

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

**Classic PM frameworks still apply** (discovery, four risks, growth loops, PMF measurement)—but **execution velocity has fundamentally changed**.

### What This Skill Adds

**AI-specific frameworks:**
- Continuous Calibration (CC/CD) - How to develop AI products differently
- AI Evals - Testing AI quality systematically
- AI Unit Economics - Modeling costs and monetization with marginal inference costs
- Prompt Engineering for PMs - Product strategy in disguise
- AI Integration Framework - Combining off-the-shelf AI with your unique advantages

**Modern execution practices:**
- Prototype-first development
- Issues not user stories (Linear Method)
- Visual frameworks for communication (Aakash Gupta)
- Speed-oriented roadmapping (Janna Bastow adapted)

## Tone & Approach

This skill is designed to be:

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
- "Segment responses by user type—focus on high-expectation customers"
- "This is a point-in-time measurement; run quarterly as you evolve"

### Example 3: Building an AI Feature

**You:** "We want to add AI-powered recommendations."

**PM Thought Partner:**
- "Have you designed evals for what makes a 'good' recommendation vs 'bad'?" (Aman Khan)
- "What's your cost model? Inference costs scale with usage." (AI unit economics)
- "Start with low agency—AI suggests, human decides. Earn autonomy." (Continuous calibration)
- "How will users override when the AI is wrong?"
- "What's your prompt strategy for this?" (Prompt engineering)

### Example 4: Roadmap Planning

**You:** "Leadership wants a roadmap with dates for the next year."

**PM Thought Partner:**
- References Janna Bastow's Now-Next-Later
- "Roadmaps should communicate sequence and certainty, not false dates"
- "Now: committed, Next: likely, Later: possible"
- "Use cone of uncertainty—confidence decreases over time"
- "Can you show a working prototype of 'Now' items to validate direction?"

## Limitations

This skill:

- ❌ **Does not create new PM frameworks** - It synthesizes existing wisdom
- ❌ **Is not a substitute for talking to users** - Discovery still requires real conversations
- ❌ **Is not always right** - Frameworks are tools, not rules. Context matters.
- ❌ **Cannot execute for you** - It guides thinking, you still do the work
- ❌ **Reflects a point in time** - PM best practices evolve (Jan 2025 snapshot)

It's a thought partner, not a replacement for PM judgment.

## Frequently Asked Questions

### How is this different from just asking Claude about PM topics?

**Claude has general knowledge.** This skill has:
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

Share the repository, install as a skill, use together.

### How do I know these frameworks are good?

Every framework comes from:
- Published articles, books, podcasts from recognized PM thought leaders
- Practitioners with track records (CPOs, VPs of Product at top companies)
- Battle-tested at companies like Airbnb, Spotify, HubSpot, Facebook, etc.

Check `sources.yml` for original attributions.

### What if a framework doesn't fit my situation?

**Frameworks are tools, not rules.**

The skill encourages adaptation:
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

### Does the skill limit what Claude can answer?

**No.** The skill enhances Claude's PM capabilities by providing proven frameworks, but doesn't restrict general knowledge.

**How it works:**
- The skill adds PM frameworks and thought leader context to Claude's system prompt
- This makes Claude better at PM advice (grounded in proven frameworks)
- But Claude can still help with anything else (code, writing, analysis, etc.)

**You can freely mix topics:**
- Ask about growth strategy → Uses skill frameworks
- Ask Claude to write Python code → Uses general knowledge
- Ask about competitive analysis → Uses skill template
- Ask about deployment → Uses general knowledge

The skill is **enhancement, not restriction**.

### What if I ask about a PM framework not in the skill?

**Claude will still help using general PM knowledge.**

**Example:** If you ask about AARRR pirate metrics (not currently in the skill), Claude will:
1. Answer using general knowledge
2. Be transparent that it's not in the PM Thought Partner frameworks
3. Suggest it could be a good addition if you find it valuable

**The skill provides:**
- ✅ Curated frameworks from 12+ thought leaders
- ✅ AI-era adaptations
- ✅ Cross-framework integration
- ✅ Proven, battle-tested approaches

**But doesn't prevent:**
- ✅ General PM help outside these frameworks
- ✅ Other PM methodologies and approaches
- ✅ Custom solutions for your specific situation

### Can I use the skill for non-PM work?

**Yes, absolutely.**

The skill is active in the background, but you can ask Claude anything:
- PM questions → Enhanced with frameworks
- Code questions → Normal Claude capabilities
- Writing/analysis/anything else → Normal Claude capabilities

**Think of it as:** Claude with a PM expert on call, not Claude that only knows PM.

## License & Attribution

**License:** MIT (see LICENSE file)

**Attribution:** All frameworks attributed to original creators in `sources.yml`.

This repository synthesizes and applies existing wisdom. It does not claim ownership of the frameworks—only the curation, adaptation, and integration for AI-era PM work.

## Acknowledgments

Grateful to the thought leaders whose public work made this possible:

Marty Cagan, Teresa Torres, Elena Verna, Brian Balfour, Lenny Rachitsky, Rahul Vohra, Janna Bastow, Aakash Gupta, Aman Khan, Ravi Mehta, the Linear team, and the Reforge community.

Their generosity in sharing frameworks publicly enables PMs everywhere to improve their craft.

---

**Built with:** Claude Code
**Maintained by:** Bree Thomas
**Last Updated:** January 2025

**Questions or feedback?** Open an issue on GitHub or reach out directly.

---

## Quick Start Checklist

- [ ] Install the skill (symlink or copy to `~/.claude-code/skills/`)
- [ ] Restart Claude Code
- [ ] Test: Ask Claude Code to help with a PM task
- [ ] Explore: Browse `/frameworks/` and `/thought-leaders/` to see what's available
- [ ] Apply: Use templates in `/templates/` for your actual work
- [ ] Contribute: Open issues or PRs if you find improvements

**Remember:** This is a thought partner for the AI era. It will push you to prototype instead of document, challenge assumptions with proven frameworks, and help you ship faster while thinking deeper.

Let's build great products. 🚀
