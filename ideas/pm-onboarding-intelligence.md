# PM Onboarding Intelligence

## Overview
An intelligent onboarding system that helps product managers rapidly understand a new product domain in their first 30/60/90 days by applying product frameworks to historical data, current state analysis, and iteratively surfacing opportunities and risks as context deepens.

## Problem / Opportunity

**The challenge:**
When a PM joins a new company or takes over a new product:
- There's overwhelming information to absorb (historical decisions, metrics, customers, tech stack, market position)
- No clear structure for what to learn first vs later
- Pressure to "add value" quickly while still learning
- Risk of making uninformed decisions or missing critical context
- Existing team members have context in their heads, not documented

**The current approach:**
- Read whatever docs exist (often outdated or incomplete)
- Schedule 1:1s with everyone (time-consuming, inconsistent information)
- Try to piece together "what happened before I got here"
- Make a 30/60/90 day plan based on incomplete understanding
- Hope you don't step on landmines

**The opportunity:**
What if PM Thought Partner could:
- Ingest historical data (tickets, metrics, user feedback, past roadmaps, meeting notes)
- Apply product frameworks systematically to current state
- Generate a structured learning plan that evolves as you learn more
- Surface "quick wins" vs "understand deeply first" opportunities
- Help you avoid repeating past mistakes the team already learned from
- Continuously recalibrate recommendations as you add context
- **Track your learning journey so you can see how your understanding has evolved**

**The insight:**
Onboarding isn't a one-time event—it's an iterative discovery process. The questions you can ask in Day 90 are different from Day 1. An AI thought partner should evolve with you AND help you remember what you've learned along the way.

## Proposed Approach

### Core Concept: Progressive Contextualization with Memory

Instead of frontloading all analysis, the system adapts its recommendations as your understanding deepens AND keeps a running record of your learning journey:

**Day 1-30: Reconnaissance Mode**
- Focus: Understand current state, identify patterns, build mental models
- Frameworks applied: High-level opportunity scans
- Memory: Daily/weekly reflections on "what I learned today"
- Output: "Here's what I'm seeing in the data—what context am I missing?"

**Day 31-60: Hypothesis Formation Mode**
- Focus: Test initial assumptions, dig into specific areas
- Frameworks applied: Targeted analysis on areas of interest
- Memory: Track how your hypotheses evolved from Week 2 to Week 6
- Output: "Based on what you've learned, here are the highest-leverage opportunities"

**Day 61-90: Strategy Calibration Mode**
- Focus: Refine long-term direction, validate with stakeholders
- Frameworks applied: Deep strategic frameworks (Four Fits, Growth Loops)
- Memory: Compare Day 1 assumptions to Day 90 reality
- Output: "Here's your integrated 6-month strategy with supporting evidence"

### Integration with `/reflect` Command

The onboarding system uses `/reflect` as its memory layer:

**Daily Reflection Prompts (automatic during onboarding):**
```
/reflect --onboarding-day=5

"What did you learn today that changed your understanding?"
"What assumptions from earlier this week are you revising?"
"What questions do you now realize you should have asked on Day 1?"
```

**Weekly Synthesis (automatic every Friday):**
```
/reflect --onboarding-week=2 --synthesize

PM Thought Partner:
"Let's look at your Week 2 vs Week 1:

Week 1 Understanding:
- You thought the main problem was slow growth
- You were focused on new feature ideas
- You assumed the AI features were working well

Week 2 Learning:
- Growth is slow because retention is dropping
- Existing features need fixing before adding new ones
- AI Email Assistant has 15% adoption despite 4-month launch

How your thinking shifted:
- From 'ship more' to 'fix what exists'
- From 'growth problem' to 'value delivery problem'
- From 'AI is the future' to 'AI needs to actually work first'

This shift is good. It means you're learning the real context."
```

**Monthly Retrospective (Day 30, 60, 90):**
```
/reflect --onboarding-month=1 --retrospective

"Looking back at your first 30 days:
- What did you learn that surprised you?
- What assumptions were wrong?
- What would you tell your Day 1 self?
- What do you need to learn in the next 30 days?"
```

**Searchable Learning History:**
```
/reflect --search="AI Email Assistant"

Shows all your reflections mentioning AI Email Assistant:
- Day 12: "Just heard about this feature, sounds promising"
- Day 18: "Wait, only 15% adoption? Need to investigate"
- Day 25: "Talked to 5 customers - doesn't understand industry terms"
- Day 35: "Root cause is lack of domain-specific training data"
- Day 50: "Proposed solution: industry templates + feedback loop"
```

### Context Ingestion: Batch Loading & MCP Integration

**Initial Context Load (Day 1-7):**

Instead of manually copy-pasting documents, connect existing sources:

```
/onboard-connect

PM Thought Partner:
"Let's connect your existing context sources. I can ingest from:

📊 Product Analytics:
- Amplitude, Mixpanel, PostHog (via MCP)
- I'll pull: key metrics, trends, feature usage

📋 Project Management:
- Linear, Jira, Asana (via MCP)
- I'll pull: roadmap history, completed projects, backlog themes

💬 Communication:
- Slack exports, meeting notes
- I'll pull: common topics, pain points, decisions made

📄 Documents:
- Google Docs, Notion, Confluence (via MCP)
- I'll pull: strategy docs, retrospectives, customer research

👥 Customer Feedback:
- Zendesk, Intercom, Gong (via MCP)
- I'll pull: support themes, feature requests, churned customer reasons

🏗️ Technical:
- GitHub, GitLab (via MCP)
- I'll pull: architecture docs, recent major changes, tech debt issues

Which would you like to connect first?"
```

**Smart Batch Processing:**

```
/onboard-ingest --source=linear --timeframe="last 6 months"

Processing Linear data...
✓ 423 issues analyzed
✓ 12 completed epics identified
✓ 89 open issues categorized
✓ Common themes extracted

Initial patterns found:
- 23% of issues mention "AI features"
- 18% mention "performance/scaling"
- 15% mention "user onboarding"
- Tech debt appears in 34 issues

Adding to your onboarding knowledge base.
Run /onboard-analyze to see framework insights.
```

**Continuous Context Updates:**

Once connected, sources stay updated:

```
Every Monday morning:

"Your weekly context update:
- 12 new Linear issues created (3 mention AI features)
- 2 customer churn tickets (both cited 'too complex')
- Adoption of Feature X dropped 5% (worth investigating?)
- Engineering retro mentioned tech debt again

Should I update your onboarding analysis with these signals?"
```

### The Onboarding Workflow

#### Phase 1: Initial Context Gathering (Day 1-7)

**What the PM provides:**
- Product name/description
- Domain (B2B SaaS, consumer mobile, marketplace, etc.)
- Role scope (entire product, specific area, platform team)
- Company stage (startup, growth, enterprise)
- Their background (domain expert vs new domain)

**What the PM connects:**
- MCP sources (Linear, analytics, docs, customer feedback)
- Batch document uploads (PDFs, strategy docs, retrospectives)
- Key people to interview (system helps schedule/structure conversations)

**What PM Thought Partner does:**
```
/onboard-start --product="CustomerOS" --domain="B2B SaaS" --scope="Core Platform" --stage="Growth" --background="new-domain"

PM Thought Partner responds:
"I'll help you get up to speed on CustomerOS. Let's start by building a baseline understanding.

First, let's connect your context sources:
- Connect Linear → I'll analyze your roadmap and backlog
- Connect analytics → I'll understand your key metrics
- Connect docs → I'll read existing strategy and retrospectives

[After connections complete]

Initial scan complete. Here's what I found:
- 6 months of roadmap history
- 4 major feature launches
- 3 strategy docs
- 847 customer feedback items

I'll spend tonight analyzing this and have your Day 1 baseline ready tomorrow.

In the meantime, start your first reflection:
/reflect --onboarding-day=1
'What are your first impressions? What questions do you have?'"
```

**Daily Reflection Cadence:**

Every evening:
```
/reflect --onboarding-day=X

"Before you finish today:
- What did you learn that was surprising?
- What assumptions are you forming?
- What do you need to investigate tomorrow?"
```

#### Phase 2: Baseline Analysis (Day 8-30)

**What PM Thought Partner does:**
- Analyzes connected sources + uploaded documents
- Applies lightweight framework scans:
  - `/ai-health-check` - Are there AI features? What's their state?
  - `/growth-loops` - Where is growth coming from?
  - `/four-risks` - What are the biggest current risks?
  - **`/analytics-baseline`** (future idea) - What metrics matter and why?
- Identifies patterns and anomalies
- Generates questions for stakeholder 1:1s
- **Tracks your evolving understanding via `/reflect`**

**Example output:**
```
## Your Product Baseline (as of Day 15)

### What I Understand So Far:
- CustomerOS is a B2B CRM for mid-market sales teams
- Core loop: Sales team uses product → Gets value → Invites teammates → Team expansion
- 3 AI features shipped in last 6 months
- Growth has slowed 20% QoQ
- Engineering team concerned about tech debt

### Your Learning Journey (from reflections):

Day 1: "Everything seems overwhelming. Where do I even start?"

Day 5: "Starting to see patterns. AI features are mentioned a lot but adoption seems mixed."

Day 10: "Hypothesis: We're shipping AI because it's trendy, not because it solves real problems."

Day 15: "Talked to 3 customers today. They WANT AI help but current features miss the mark."

### Framework Insights:

**AI Health Check (Preliminary):**
- AI Lead Scoring: Launched 4 months ago, 60% adoption ✓
- AI Email Assistant: Launched 2 months ago, 15% adoption ⚠️
- Smart Notifications: Launched last month, no data yet
- **Concern:** Low adoption on Email Assistant - dig into why

**Growth Loops (Initial View):**
- Primary loop: Team expansion (invite-based)
- Secondary loop: Integration network effects
- **Opportunity:** Integration loop underdeveloped

**Four Risks (Current State):**
- Value: Unclear if AI features solving real problems
- Usability: Adoption data suggests possible UX issues
- Feasibility: Tech debt mentioned multiple times
- Viability: Slowing growth impacts revenue targets

### Questions for Your Next 1:1s:

**With Engineering Lead:**
- What tech debt is most constraining?
- Why is AI Email Assistant adoption low? Technical issues or product-market fit?

**With Sales/CS:**
- What are customers saying about AI features?
- What features are they actually asking for?

**With CEO/Leadership:**
- What's driving the growth slowdown?
- What's the priority: new features vs fixing existing vs scale?

### Suggested Focus Areas (Days 16-30):
1. Deep dive on AI Email Assistant (why isn't it working?)
2. Understand tech debt constraints (what can't we do?)
3. Talk to 5 customers who adopted AI vs 5 who didn't

Remember to /reflect on what you learn from these conversations!
```

**Weekly Reflection Synthesis (automatic):**

Every Friday:
```
/reflect --week-summary

"Your Week 3 Learning Themes:

Most mentioned topics in your reflections:
1. AI Email Assistant (5 mentions) - becoming your focus area
2. Tech debt (3 mentions) - concern growing
3. Customer confusion (4 mentions) - pattern emerging

Shifting understanding:
- Week 1: Product seemed fine, just needed growth tactics
- Week 2: Realized existing features have adoption issues
- Week 3: Identified specific root causes (lack of domain context in AI)

Questions you're now asking (that you didn't Week 1):
- 'How do we make AI actually understand our users' domain?'
- 'Is shipping more features making the problem worse?'
- 'Should we pause new development to fix existing features?'

You're moving from surface-level to root-cause thinking. Good progress."
```

#### Phase 3: Opportunity Identification (Day 31-60)

**What changes:**
- You've now had dozens of conversations
- You have opinions forming
- You need to validate assumptions
- You're ready for deeper framework application
- **Your `/reflect` history shows how your thinking evolved**

**What PM Thought Partner does:**
```
/onboard-check-in --day=35

PM Thought Partner:
"You're at Day 35. Let's see how your understanding has deepened.

Your Day 10 hypothesis (from /reflect):
'We're shipping AI because it's trendy, not because it solves real problems.'

Your Day 30 refined understanding (from /reflect):
'Customers DO want AI help. Our AI features are solving the right problem but implementing the wrong solution. They need domain-aware AI, not generic AI.'

This is significant growth in understanding. Let's apply frameworks to your refined insight.

Based on your focus on AI Email Assistant, let me run targeted analyses:

**Four Risks Assessment for AI Email Assistant:**
[Previous analysis...]

**Recommended Actions:**
[Previous recommendations...]

Continue tracking your learning:
/reflect --day=35
'Now that you understand the root cause, what solution are you leaning toward?'"
```

**Reflection-Driven Framework Application:**

The system notices themes in your reflections and suggests frameworks:

```
Pattern detected in your reflections:

You've mentioned "growth slowdown" 8 times in the last 2 weeks.
You've mentioned "retention dropping" 5 times.
You've mentioned "customers churning" 4 times.

Suggested deep-dive:
/growth-loops --focus="retention"
/four-fits --assess="product-market"

These frameworks will help you understand if growth is slowing because:
- The core loop is broken
- You're in the wrong market
- The product fit has degraded
```

#### Phase 4: Strategic Integration (Day 61-90)

**What PM Thought Partner does:**
- Helps synthesize 90 days of learning into coherent strategy
- Applies full framework suite with deep context
- Identifies how quick wins connect to longer strategy
- Validates thinking against product principles
- **Shows how your thinking evolved from Day 1 to Day 90**

**Example output:**
```
/onboard-synthesize --day=80

PM Thought Partner:
"You're at Day 80. Let's build your 6-month strategy based on everything you've learned.

## Your Learning Journey:

### Week 1 (Days 1-7):
From your reflections: "Everything is overwhelming. AI features, growth problems, tech debt - where do I even start?"

### Month 1 (Days 8-30):
From your reflections: "Starting to see the real problem. It's not growth tactics - our existing features aren't delivering value."

### Month 2 (Days 31-60):
From your reflections: "I understand now. AI Email Assistant has potential but needs domain-specific training. This is fixable."

### Month 3 (Days 61-80):
From your reflections: "Validated my hypothesis with customers. They'd pay MORE if AI actually worked in their domain. This is our growth lever."

## How Your Understanding Evolved:

Day 1 assumption: "Need to ship more features to grow"
↓
Day 30 insight: "Need to fix existing features first"
↓
Day 60 insight: "Need to make AI domain-aware"
↓
Day 80 strategy: "Make AI work = unlock growth + pricing power"

## Integrated Framework Analysis:

**Growth Loops:**
[Analysis from your context...]

**Four Fits:**
You've identified the broken fit: Product-Market Fit for AI features
[Analysis...]

**AI Strategy:**
[Analysis...]

## Your 6-Month Strategy (Recommendation):

**Months 1-2 (Quick Wins):**
- Fix AI Email Assistant with industry templates + feedback loop
- Instrument AI features to understand value delivery
- Start tech debt paydown plan (engineering lead owns)

**Months 3-4 (Foundation):**
[Previous recommendations...]

**Months 5-6 (Growth):**
[Previous recommendations...]

## Validation Against Your Learning:

This strategy aligns with insights from:
- Day 25 reflection: "Customers want AI, just not this AI"
- Week 6 reflection: "Domain-specific AI could be a competitive moat"
- Day 70 reflection: "If we fix this, we can charge premium pricing"

Continue tracking progress:
/reflect --day=80
'Does this strategy feel right based on everything you've learned?'"
```

### Continuous Learning Mode (Post-90 Days)

The system doesn't stop at 90 days. It continues to:
- Update analysis as metrics change
- Flag when assumptions no longer hold
- Suggest framework re-runs when context shifts
- Help onboard the next PM by capturing your learnings
- **Keep tracking via `/reflect` for continuous learning**

**Example: Month 6 Check-in:**
```
/reflect --search="AI Email Assistant" --timeline

Your AI Email Assistant Learning Timeline:

Day 18: First heard about low adoption
Day 25: Identified root cause (domain context)
Day 50: Proposed solution (industry templates)
Day 80: Made it part of 6-month strategy
Day 120: Shipped industry templates
Day 150: Adoption increased to 35%
Day 180 (today): Customers asking for more AI features

Your learning journey from "this isn't working" to "this is our growth driver" took 6 months. That's valuable institutional knowledge for the next PM.
```

## Example Usage

### Scenario 1: PM with Domain Expertise, New Company

**Day 1:**
```
/onboard-start --background="domain-expert" --product="InsureTech Platform"

"I've worked in insurtech for 5 years, but this is my first time at a growth-stage company."

/onboard-connect --sources=linear,analytics,docs

[System ingests historical context]

/reflect --day=1
"First day. I know insurance but this company's approach feels different. Need to understand what they've learned that I haven't."
```

**Day 30:**
```
/reflect --month=1 --retrospective

PM Thought Partner:
"Looking at your reflections, interesting pattern:

Week 1: You kept saying 'In my last company, we did X'
Week 2: You started saying 'Wait, that approach won't work here because Y'
Week 3: You said 'Actually, their way makes more sense given Z constraint'
Week 4: You're now saying 'My insurance expertise applies, but in different ways'

You successfully integrated your domain knowledge without imposing your old company's playbook. That's the right approach."
```

### Scenario 2: PM New to Domain

**Day 1:**
```
/onboard-start --background="new-domain" --product="HealthTech Scheduling"

"I was in fintech, now in healthcare. Help me not say something stupid."

/reflect --day=1
"Healthcare seems WAY more complex than fintech. Worried I'm in over my head."
```

**Day 15:**
```
/reflect --search="compliance" --timeline

Shows your learning progression:
- Day 2: "What's HIPAA?"
- Day 5: "Oh, HIPAA affects everything we build"
- Day 10: "Compliance isn't just legal, it's a product constraint"
- Day 15: "Actually, compliance can be a competitive advantage if done right"

PM Thought Partner: "You went from fear to strategic thinking about compliance in 2 weeks. You're learning the domain."
```

### Scenario 3: Batch Loading Existing Context

**Day 1:**
```
/onboard-connect

Connecting Linear... ✓ 1,247 issues indexed
Connecting Amplitude... ✓ 18 months of analytics loaded
Connecting Slack archive... ✓ #product and #engineering channels analyzed
Connecting Google Drive... ✓ 24 strategy docs and retros indexed
Connecting Zendesk... ✓ 3,892 support tickets categorized

Processing complete. I've built your baseline context.

Key findings:
- "Tech debt" mentioned 127 times across sources
- "AI feature" adoption curve shows: spike at launch, then decline
- Customer churn rate doubled in Q3 (6 months ago)
- Last 3 retros all mentioned "we're moving too fast"

I'll have a full analysis ready by tomorrow morning.

Start your first reflection:
/reflect --day=1
```

## Open Questions

### Integration and Architecture
- How does `/reflect` data persist and get searched?
- Should reflections be private or shared with managers?
- How do we balance automatic prompts vs PM-initiated reflections?
- Can the system attend meetings via MCPs and auto-generate reflection prompts?

### MCP and Data Sources
- Which MCPs should be prioritized for onboarding?
- How do we handle companies that don't use standard tools?
- What about proprietary internal tools?
- Should there be an "export your onboarding knowledge" feature for when PMs leave?

### Scope and Boundaries
- How much of this is general onboarding vs PM-specific product onboarding?
- Should this integrate with company onboarding systems or be standalone?
- What if the company has no documentation to ingest?
- How do we prevent information overload?

### Privacy and Security
- How do we handle sensitive company information?
- What data gets stored vs processed and discarded?
- How do we ensure PMs don't leak confidential info to the AI?
- Should reflections be encrypted?

### Measuring Success
- How do we know if onboarding was successful?
- What's the difference between "fast onboarding" and "thorough onboarding"?
- Can we measure "time to first meaningful contribution"?
- Should we track how Day 1 assumptions compared to Day 90 reality?

### Future Command Integration
- **`/analytics-baseline`** - Help PM understand what metrics matter and why
- **`/customer-listening-plan`** - Structure which customers to talk to when
- **`/tech-debt-decoder`** - Help non-technical PMs understand engineering constraints
- **`/competitive-landscape`** - Map competitive context (future idea)
- **`/stakeholder-map`** - Identify key people and their priorities (future idea)

## References / Inspiration

**30/60/90 Day Plans:**
- Common PM onboarding framework
- Usually static documents, not adaptive
- Opportunity: Make them dynamic and data-driven

**Reflective Practice (Donald Schön):**
- "Reflection-in-action" and "reflection-on-action"
- Learning happens through documented reflection
- Application: `/reflect` as learning tool, not just journaling

**Spaced Repetition / Progressive Learning:**
- Don't frontload everything
- Introduce concepts when relevant
- Reinforce learning over time
- See how understanding changes

**Knowledge Management Systems:**
- Problem: Knowledge trapped in people's heads or scattered docs
- Opportunity: MCP integration makes knowledge accessible and analyzable

**Teresa Torres' Continuous Discovery:**
- Weekly touch-points with customers
- Integration: Onboarding should include structured customer learning

## Related Ideas

- [Future idea: `/analytics-baseline` - Analytics deep-dive command]
- [Future idea: `/tech-debt-decoder` - Help PMs understand eng constraints]
- [Future idea: Departing PM Handoff Protocol - Export knowledge for next PM]
- [Future idea: Team Context Sharing - What should managers see vs not see?]
- [Related: responsible-vibe-coding.md - Technical onboarding component]
- [Future idea: Framework Sequencing - Which frameworks to apply when during onboarding]
- [Future idea: MCP Priority - Which integrations matter most for onboarding]
