# Analytics Intelligence & Experimentation

## Overview
Enable PMs to connect product analytics tools (Mixpanel, Amplitude, PostHog, etc.) with PM Thought Partner to accelerate analysis, reporting, experiment design, and goal tracking—moving from "here's what happened" to "here's what to do about it."

## Problem / Opportunity

**The challenge:**
Product managers spend countless hours:
- Digging through analytics dashboards to understand what's happening
- Creating reports for stakeholders (often manually compiled)
- Trying to figure out which metrics actually matter vs vanity metrics
- Designing experiments without systematic frameworks
- Connecting metrics to business goals (OKRs, KPIs)
- Explaining metric changes to leadership ("Why did activation drop 5%?")
- Deciding what to measure for new features

**The current state:**
- Analytics tools show you data, but don't interpret it
- PMs manually export charts and write commentary
- Experiment design happens in docs/sheets disconnected from data
- OKRs live in spreadsheets, disconnected from product analytics
- Root cause analysis is manual detective work
- No connection between frameworks (Growth Loops, Four Risks) and actual metrics

**The opportunity:**
What if PM Thought Partner could:
- Connect directly to your analytics platform
- Automatically surface anomalies and insights
- Explain WHY metrics changed, not just THAT they changed
- Design experiments based on hypotheses
- Track experiments and interpret results
- Connect metrics to strategic frameworks
- Generate stakeholder reports automatically
- Help you define the right metrics for new features
- Link OKRs to actual product usage data

**The insight:**
Analytics tools are descriptive ("here's what happened"). PMs need prescriptive intelligence ("here's what to do about it"). The gap between data and action is where PM Thought Partner adds value.

## Proposed Approach

### Core Capabilities

**1. Analytics Connection & Baseline**
- Connect to analytics platforms via MCP or API
- Establish baseline understanding of your metrics
- Identify which metrics matter vs vanity metrics
- Map metrics to business goals

**2. Intelligent Monitoring & Anomaly Detection**
- Continuous monitoring of key metrics
- Automatic detection of significant changes
- Root cause analysis when metrics move
- Proactive alerts with context

**3. Experiment Design & Management**
- Framework-driven experiment design
- Hypothesis generation based on data patterns
- Experiment tracking and result interpretation
- Learning capture from experiments

**4. Goal Tracking & OKR Integration**
- Connect OKRs to product metrics
- Track progress toward goals
- Flag when you're off-track and suggest actions
- Generate progress reports

**5. Stakeholder Communication**
- Auto-generate metric reports with insights
- Explain metric changes in plain language
- Create visual summaries for leadership
- Answer ad-hoc metric questions

### The Commands / Workflows

#### `/analytics-connect` - Initial Setup

Connect your analytics platform and establish baseline:

```
/analytics-connect --platform=mixpanel --project="CustomerOS"

PM Thought Partner:
"Connecting to Mixpanel...

✓ Connected successfully
✓ Found 247 tracked events
✓ Found 34 user properties
✓ Found 12 existing funnels
✓ 18 months of historical data available

Let me analyze your current analytics setup...

Initial observations:
- Most tracked events: 'Page View' (2.3M/month)
- Highest-value events: 'Completed Purchase', 'Invited Team Member', 'Created Project'
- Retention cohorts available
- No experiment tracking detected (we should set that up)

Questions to establish baseline:
1. What are your North Star Metric and key supporting metrics?
2. What business goals (OKRs/KPIs) should I track against?
3. Are there known issues with your tracking (events that aren't firing, etc.)?

Once you answer these, I'll set up intelligent monitoring."
```

#### `/analytics-baseline` - Understand What Matters

Establish which metrics matter and why:

```
/analytics-baseline

PM Thought Partner:
"Let's establish your analytics baseline—which metrics matter and why.

Based on your event data, I see potential metric hierarchies:

**Acquisition Metrics:**
- Sign-ups: 450/week (trending down 8% MoM)
- Activation (completed onboarding): 68% of sign-ups
- Time to activation: Median 3.2 days

**Engagement Metrics:**
- DAU/MAU ratio: 0.42 (pretty good for B2B)
- Core action frequency: 3.1x per week per user
- Feature adoption:
  - AI Email Assistant: 15% of active users
  - Integrations: 34% of active users

**Retention Metrics:**
- D7 retention: 45%
- D30 retention: 28%
- 6-month retention: 18% ⚠️ (concerning)

**Revenue Metrics:**
- ARPU: $89/month
- Expansion revenue: 12% of MRR
- Churn: 5% monthly ⚠️ (high for B2B)

**Proposed North Star Metric:**
Weekly Active Teams (WAT)

Why: Captures activation + engagement + retention in one metric. If teams are using the product weekly, they're getting value.

**Supporting Metrics (L2):**
- Activation rate (% who complete onboarding)
- Feature adoption (% using core features)
- Team expansion (avg team size growth)
- Weekly engagement frequency

**Input Metrics (L3):**
- Sign-up rate
- Time to first value
- Feature-specific usage
- Integration adoption

Does this metric hierarchy make sense for your business?"
```

#### `/analytics-monitor` - Continuous Intelligence

Automatic monitoring with proactive insights:

```
/analytics-monitor --enable

PM Thought Partner:
"Analytics monitoring enabled. I'll check your key metrics daily and alert you to significant changes.

What I'm watching:
✓ North Star: Weekly Active Teams
✓ Activation rate
✓ D7/D30 retention
✓ Feature adoption rates
✓ Churn signals

I'll notify you when:
- Metrics move >5% week-over-week
- Anomalies detected (sudden spikes/drops)
- Trends emerge (3+ weeks of consistent change)
- Experiment results are statistically significant

You can also ask me metric questions anytime:
- 'Why did activation drop this week?'
- 'What's driving the increase in churn?'
- 'Which features correlate with retention?'
```

**Example alert:**
```
🚨 Analytics Alert - Thursday Morning

Weekly Active Teams dropped 7% this week (423 → 394)

Root cause analysis:
- Activation rate steady (68%)
- New user sign-ups steady (450)
- But: Returning user engagement dropped 12%

Drilling deeper:
- 34% fewer users completed 'core action' this week
- Started declining on Monday
- Correlated with: Deploy on Sunday night (v2.4.3)

Hypothesis: Recent deploy introduced friction in core workflow

Suggested actions:
1. Check if v2.4.3 had UI changes to core action
2. Look at error logs for that user flow
3. Talk to CS about user complaints this week
4. Consider rolling back if issue confirmed

Would you like me to dig deeper into the deploy changes?
```

#### `/experiment-design` - Framework-Driven Experiments

Design experiments based on hypotheses:

```
/experiment-design --hypothesis="Adding industry templates to AI Email Assistant will increase adoption"

PM Thought Partner:
"Let's design an experiment to test this hypothesis.

**Hypothesis Breakdown:**

Current state:
- AI Email Assistant adoption: 15% of active users
- Of those who try it: 40% stop using it within a week
- Common feedback: 'Doesn't understand my industry terms'

Proposed change:
- Add industry-specific email templates
- Let users select their industry on first use
- Train AI on industry-specific language

**Experiment Design:**

**Test Type:** A/B test (50/50 split)

**Target Audience:**
- New users signing up (clean test)
- Industries: Sales, Marketing, Real Estate (high volume)

**Primary Metric (Success Criteria):**
- Adoption rate: % who use AI Email Assistant ≥3 times in first week
- Target: 15% → 25% (10pp lift)

**Secondary Metrics (Guardrails):**
- Email quality (thumbs up/down ratings)
- Time to first email
- Retention of AI Email Assistant users (D30)

**Sample Size Calculation:**
- Baseline: 15% adoption
- Target: 25% adoption
- Significance: 95% confidence
- Power: 80%
- **Required sample: ~380 users per variant**
- At 450 sign-ups/week: **2 weeks to significance**

**Experiment Plan:**

Week 0 (Prep):
- Instrument events: 'industry_selected', 'template_used', 'ai_email_sent'
- Set up variant assignment in Mixpanel
- Create industry template library
- QA both variants

Week 1-2 (Run):
- 50/50 split on new sign-ups
- Monitor daily for issues
- Collect qualitative feedback

Week 3 (Analysis):
- Analyze primary metric (adoption rate)
- Check secondary metrics (quality, retention)
- Interview users in both variants
- Make ship/iterate/kill decision

**Risks & Mitigations:**

Risk: Industry selection adds friction
- Mitigation: A/A test first to verify no drop-off
- Guardrail: Monitor onboarding completion rate

Risk: Templates feel generic despite industry targeting
- Mitigation: Start with 3 well-researched industries
- Fallback: Allow custom template creation

Risk: Sample size takes too long (if sign-ups drop)
- Mitigation: Lower confidence to 90% (needs ~260 per variant)
- Alternative: Run on existing users (but less clean test)

**Implementation Checklist:**
☐ Instrument events in analytics
☐ Set up experiment in feature flag system
☐ Create industry templates (Sales, Marketing, Real Estate)
☐ Add industry selector to onboarding flow
☐ Set up automated reporting dashboard
☐ Write experiment brief for stakeholders

Ready to start this experiment?"
```

#### `/experiment-results` - Interpret Experiment Outcomes

Analyze results and decide next steps:

```
/experiment-results --experiment="industry-templates-ai-email"

PM Thought Partner:
"Your Industry Templates experiment ran for 2 weeks. Here are the results:

**Sample Size:**
- Control: 412 users
- Treatment: 419 users
- ✓ Hit target sample size

**Primary Metric: AI Email Assistant Adoption (≥3 uses in Week 1)**
- Control: 15.3% (63/412)
- Treatment: 28.6% (120/419)
- **Lift: +13.3pp (+87% relative)**
- Statistical significance: p < 0.001 ✓
- **Result: SIGNIFICANT WIN**

**Secondary Metrics:**

Email Quality (Thumbs Up Rate):
- Control: 62%
- Treatment: 71% (+9pp)
- Better quality with templates ✓

Time to First AI Email:
- Control: 4.2 days median
- Treatment: 1.8 days median (-57%)
- Templates reduce friction ✓

D30 Retention of AI Users:
- Control: 45%
- Treatment: 58% (+13pp)
- Not yet significant (need more time)
- But directionally positive ✓

**Guardrail Metrics:**

Onboarding Completion Rate:
- Control: 68.2%
- Treatment: 67.8% (-0.4pp)
- No negative impact ✓

Overall Activation:
- Control: 71%
- Treatment: 73% (+2pp)
- Slight positive, not significant

**Qualitative Feedback:**

Treatment group users:
- "Finally! The AI actually sounds like it knows my industry"
- "The templates gave me a starting point instead of blank page"
- "Sales-specific language is way better than generic"

**Segment Analysis:**

By Industry:
- Sales templates: +92% adoption (strongest)
- Marketing templates: +78% adoption
- Real Estate templates: +61% adoption

All segments won, Sales templates resonated most.

**Decision: SHIP IT**

Recommendation: Roll out to 100% of users

Why ship:
- Strong primary metric win (+87%)
- All secondary metrics positive
- No negative guardrail impacts
- Qualitative feedback overwhelmingly positive
- All industries benefited

**Next Steps:**

Immediate (Week 1):
☐ Roll out to 100% of new users
☐ Communicate win to team
☐ Document learnings

Short-term (Month 1):
☐ Add 5 more industries (Law, Healthcare, Finance, Tech, Consulting)
☐ Monitor adoption continues to stay high
☐ Backfill existing users (optional feature)

Long-term (Month 2-3):
☐ Build custom template creator
☐ Let users share templates with team
☐ Apply learnings to other AI features (make them industry-aware too)

**Strategic Insight:**

This validates your hypothesis from Day 35 of onboarding: 'Customers want domain-aware AI, not generic AI.'

This pattern likely applies to:
- AI Lead Scoring (could add industry-specific scoring models)
- Smart Notifications (industry-specific trigger patterns)
- Future AI features

Consider: "Domain awareness" as a product principle across all AI features.

Would you like me to help design the rollout plan?"
```

#### `/metrics-explain` - Answer Ad-Hoc Metric Questions

Quick metric analysis on demand:

```
/metrics-explain "Why did activation drop 5% last week?"

PM Thought Partner:
"Let me investigate the activation drop...

**The Drop:**
- Activation rate: 68% → 63% (-5pp)
- Timeframe: Started Wednesday, sustained through week
- Affected: 23 fewer users activated (out of 450 sign-ups)

**Root Cause Analysis:**

I checked:
✗ Sign-up quality (source mix unchanged)
✗ Product bugs (no error spikes)
✓ Onboarding flow changes (found the issue)

**What happened:**

On Tuesday evening, engineering updated the onboarding flow to add a new step: 'Connect your email provider.'

This step is now appearing BEFORE users complete core onboarding tasks.

Impact:
- Step has 78% completion rate (22% drop off)
- Those 22% never reach later activation steps
- Math: 68% * 78% = 53% (worse than current 63%)
- But some users skip and come back later
- Net effect: -5pp activation

**Evidence:**

Funnel breakdown:
- Sign up → Email connect: 78% (NEW STEP, causing drop)
- Email connect → Create project: 91% (was 91% before)
- Create project → Invite team: 71% (was 70% before)

User behavior:
- Users who connect email immediately: 82% activate (↑)
- Users who skip: 31% activate (↓)
- Skipping users often don't return to connect later

**What this means:**

Good news: Email connection improves activation for those who complete it
Bad news: 22% are bouncing on this new step
Net effect: Slightly negative (-5pp)

**Recommendations:**

Option 1: Make email connection optional, not blocking
- Add 'Skip for now' option
- Prompt again after they see value
- Expected impact: Restore to 68% baseline

Option 2: Improve the step to reduce drop-off
- Better messaging about why it matters
- Show preview of what they'll unlock
- Add social proof ('87% of teams connect email')
- Expected impact: Reduce drop-off from 22% to ~10%

Option 3: A/B test the placement
- Try email connection AFTER initial value
- Users more likely to connect after seeing value
- Expected impact: Could improve beyond 68% baseline

My recommendation: Option 3 (move it later in flow)

Want me to design that experiment?"
```

#### `/okr-connect` - Link Goals to Metrics

Connect OKRs to product data:

```
/okr-connect

PM Thought Partner:
"Let's connect your OKRs to product metrics so you can track progress automatically.

What are your current OKRs for this quarter?"

User: "Objective: Increase product value delivery. KR1: Increase Weekly Active Teams by 20%. KR2: Improve D30 retention from 28% to 35%. KR3: Increase AI feature adoption from 15% to 30%."

PM Thought Partner:
"Got it. Let me map these to your analytics:

**OKR Tracking Setup:**

**Objective:** Increase product value delivery

**KR1: Increase Weekly Active Teams by 20%**
- Baseline: 394 WAT (current)
- Target: 473 WAT (20% increase)
- Current: 394 WAT
- Progress: 0% (just started)
- On track: TBD (need 3 weeks of data)

**KR2: Improve D30 retention from 28% to 35%**
- Baseline: 28%
- Target: 35% (+7pp)
- Current: 28% (checking most recent cohort...)
- Progress: 0%
- Note: 30-day lag on this metric

**KR3: Increase AI feature adoption from 15% to 30%**
- Baseline: 15%
- Target: 30% (+15pp)
- Current: 15%
- Progress: 0%
- Note: Industry templates experiment could drive this

**Dashboard Created:**

I've set up a live OKR dashboard that pulls from Mixpanel daily.

You can check progress anytime with:
/okr-status

I'll send weekly updates every Monday with:
- Current progress
- Trend (on track / at risk / off track)
- Suggested actions if off track

**Strategic Connections:**

I notice these KRs are interconnected:
- KR3 (AI adoption) likely drives KR2 (retention)
- KR2 (retention) directly impacts KR1 (WAT)

So: Improve AI → Better retention → More WAT

Your industry templates experiment (if shipped) could move all three KRs.

Want me to create a plan to hit these OKRs?"
```

#### `/okr-status` - Track Progress Toward Goals

Weekly check-in on goal progress:

```
/okr-status

PM Thought Partner:
"Here's your OKR status for Week 6 of the quarter:

**Objective:** Increase product value delivery

**KR1: Increase Weekly Active Teams by 20%**
- Target: 473 WAT
- Current: 441 WAT
- Progress: 59% (↑ great progress!)
- Trend: ✅ ON TRACK
- Weekly change: +12 WAT (+2.8%)

**KR2: Improve D30 retention from 28% to 35%**
- Target: 35%
- Current: 32% (cohort from 5 weeks ago)
- Progress: 57% (+4pp out of +7pp needed)
- Trend: ✅ ON TRACK
- Note: Industry templates shipped 3 weeks ago, showing up in retention now

**KR3: Increase AI feature adoption from 15% to 30%**
- Target: 30%
- Current: 26%
- Progress: 73% (+11pp out of +15pp needed)
- Trend: ✅ ON TRACK (ahead of pace!)
- Weekly change: +1pp

**Overall OKR Health: ✅ ON TRACK**

All three KRs are trending positively. You're past halfway through the quarter and ahead on KR3, on pace for KR1 and KR2.

**What's Driving Progress:**

The industry templates for AI Email Assistant are having cascade effects:
- AI adoption up (+11pp) → Directly moves KR3 ✓
- Retention improving (+4pp) → Moving KR2 ✓
- More retained users → More WAT → Moving KR1 ✓

Your Day 80 hypothesis was correct: 'Make AI work = unlock growth.'

**Risk Factors:**

Minor concern: WAT growth slowing slightly last 2 weeks
- Was growing 3%/week, now 2.8%/week
- Not alarming yet, but watch it
- May need additional growth lever in weeks 8-10

**Recommended Actions:**

To maintain momentum:
1. Keep monitoring AI adoption (sustain at 26%+)
2. Consider expanding industry templates to 5 more industries (boost adoption further)
3. Prepare backup plan if WAT growth stalls (what's next growth lever?)

Want me to help with any of these?"
```

#### `/report-generate` - Auto-Generate Stakeholder Reports

Create reports for leadership:

```
/report-generate --audience=leadership --timeframe=monthly

PM Thought Partner:
"Generating your monthly product report for leadership...

---

**CustomerOS Product Update - March 2025**

**Executive Summary**

Strong month driven by AI feature improvements. Weekly Active Teams up 12%, retention improving, AI adoption more than doubled.

**Key Wins**

✅ Shipped industry-specific AI templates
- AI Email Assistant adoption: 15% → 26% (+73%)
- 87% relative increase in adoption
- Retention of AI users up 13pp

✅ Weekly Active Teams growing consistently
- 394 → 441 WAT (+12% MoM)
- On track for Q1 OKR (need 473 by end of quarter)

✅ Retention trending upward
- D30 retention: 28% → 32% (+4pp)
- Early signal that AI improvements are increasing stickiness
- On track for Q1 OKR (target: 35%)

**Areas of Focus**

⚠️ Activation dipped briefly due to onboarding change
- Identified issue: New email connection step causing friction
- Fix deployed: Moved step later in onboarding
- Back to 68% baseline, monitoring for improvement

**What's Next**

📍 Expand industry templates to 8 more verticals (Law, Healthcare, Finance, etc.)
📍 Apply "domain awareness" principle to other AI features
📍 Explore additional growth levers to sustain WAT momentum

**Metrics Dashboard**

| Metric | Current | Last Month | Change |
|--------|---------|------------|--------|
| Weekly Active Teams | 441 | 394 | +12% |
| D30 Retention | 32% | 28% | +4pp |
| AI Adoption | 26% | 15% | +73% |
| Activation Rate | 68% | 68% | - |
| Monthly Sign-ups | 1,950 | 1,800 | +8% |

**Strategic Insight**

The industry templates experiment validated our hypothesis: users want domain-aware AI, not generic AI. This is now a product principle we're applying across all AI features. The impact on retention suggests this is a key driver of long-term value.

**OKR Progress (Q1)**

- KR1: Increase WAT 20% → 59% progress ✅
- KR2: Improve retention to 35% → 57% progress ✅
- KR3: Increase AI adoption to 30% → 73% progress ✅

---

Report saved. Want me to adjust the tone or add anything?"
```

### Integration with Other Frameworks

**Growth Loops + Analytics:**
```
/growth-loops --analyze

PM Thought Partner uses analytics data to map actual loop metrics:

"Your Team Expansion Loop:
- User invites teammate: 2.3x per user (Mixpanel data)
- Invite acceptance rate: 68%
- New user activation: 63%
- Loop velocity: 8.4 days from invite to new user activated

This loop generates 1.2x growth per cohort. To accelerate:
- Improve invite acceptance: 68% → 80% (+18% loop growth)
- Improve activation: 63% → 70% (+11% loop growth)

Based on data, focus on activation (higher volume opportunity)."
```

**Four Risks + Analytics:**
```
/four-risks --feature="AI Email Assistant"

PM Thought Partner combines framework with data:

"Using analytics to assess risks:

Value Risk:
- ✅ Users who use it rate it 71% thumbs up
- ⚠️ Only 26% of users try it (discovery problem?)

Usability Risk:
- ✅ Time to first email dropped from 4.2 → 1.8 days
- ✅ 58% retention (using it 30 days later)

Feasibility Risk:
- ✅ No technical issues detected
- ✅ 99.2% uptime

Viability Risk:
- ⚠️ Cost per email: $0.12 (high for free tier users)
- ⚠️ Need to convert AI users to paid at higher rate

Data suggests: Value and usability solved. Discovery and monetization need work."
```

**AI Health Check + Analytics:**
```
/ai-health-check

PM Thought Partner audits AI features using analytics:

"Analyzing your 3 AI features using usage data:

AI Lead Scoring:
- Adoption: 60% ✓
- Quality: 4.2/5 avg rating ✓
- Impact: Users rate 15% more leads as 'high quality' ✓
- Status: HEALTHY

AI Email Assistant:
- Adoption: 26% ⚠️ (better but still room to grow)
- Quality: 71% thumbs up ✓
- Impact: Emails sent 3x faster ✓
- Status: IMPROVING (was at risk, now trending up)

Smart Notifications:
- Adoption: 8% ❌
- Quality: 3.1/5 avg rating ❌
- Impact: 45% turn off notifications within 7 days ❌
- Status: BROKEN (needs investigation)"
```

## Open Questions

### Technical Integration
- Which analytics platforms to prioritize? (Mixpanel, Amplitude, PostHog, GA, Heap)
- How to handle custom analytics (companies with in-house tools)?
- Real-time data vs batch updates vs manual uploads?
- How to ensure data privacy and security?

### Statistical Rigor
- What level of statistical knowledge can we assume from PMs?
- When to use simple heuristics vs rigorous statistical tests?
- How to explain concepts like significance, power, confidence intervals?
- Should we default to conservative or aggressive experiment designs?

### Experiment Management
- Should PM Thought Partner integrate with feature flag tools (LaunchDarkly, etc.)?
- How to handle multiple concurrent experiments?
- What about interaction effects between experiments?
- How to prevent p-hacking and HARKing?

### Goal Frameworks
- Should we support multiple goal frameworks (OKRs, KPIs, V2MOM, 4DX)?
- How to handle companies that don't use formal goal systems?
- What about team goals vs company goals vs individual goals?
- How to handle goal changes mid-quarter?

### Metric Definition
- How to help PMs define good metrics vs vanity metrics?
- Should we have opinionated metric templates by business model?
- How to handle leading vs lagging indicators?
- What about metrics for early-stage products with limited data?

### Reporting & Communication
- How customizable should auto-generated reports be?
- Different reports for different audiences (exec, team, board)?
- What about real-time stakeholder dashboards?
- How to handle sensitive metrics (revenue, churn)?

### Learning & Iteration
- Should failed experiments be celebrated/documented?
- How to build institutional knowledge from experiments?
- What about meta-analysis (patterns across experiments)?
- How to prevent repeating past failed experiments?

### Analytics Literacy
- How much analytics knowledge should PMs have?
- Should PM Thought Partner teach concepts or just apply them?
- What about analytics onboarding for new PMs?
- How to balance "just do it for me" vs "teach me how"?

### Scope Boundaries
- Where does PM Thought Partner end and dedicated analytics tools begin?
- Should this replace your analytics tool or augment it?
- What about data warehouse integration (Snowflake, BigQuery)?
- How deep into data science territory should this go?

## References / Inspiration

**Analytics Platforms:**
- Mixpanel, Amplitude, PostHog - Event-based product analytics
- Opportunity: Connect to these via MCP or API, add intelligence layer

**Experiment Design Frameworks:**
- Ronny Kohavi's "Trustworthy Online Controlled Experiments"
- Brian Balfour's "Growth = Acquisition × Retention × Monetization"
- Application: Rigorous but accessible experiment design

**Metric Frameworks:**
- Casey Winters on "North Star Metrics"
- Reforge on "Metric Hierarchies" (L1, L2, L3 metrics)
- Application: Help PMs define the right metrics

**OKR Methodologies:**
- John Doerr's "Measure What Matters"
- Google's OKR guide
- Opportunity: Connect OKRs to product usage data, not just business metrics

**Statistical Rigor:**
- Evan Miller's statistical calculators
- Microsoft's ExP Platform papers
- Balance: Accessible to PMs, but statistically sound

**Anti-patterns:**
- Goodhart's Law: "When a measure becomes a target, it ceases to be a good measure"
- HARKing: "Hypothesizing After Results are Known"
- p-hacking: Running experiments until you find significance
- Application: Build guardrails against these

## Related Ideas

- [Related: pm-onboarding-intelligence.md - `/analytics-baseline` as onboarding component]
- [Future idea: Metric Templates by Business Model - SaaS vs Marketplace vs E-commerce]
- [Future idea: Failed Experiment Library - Learn from past failures]
- [Future idea: Data Warehouse Integration - Beyond product analytics]
- [Future idea: Predictive Analytics - "At current trend, you'll miss OKR by X%"]
- [Future idea: Analytics Literacy Training - Teach statistical concepts]
- [Future idea: Cross-Framework Metric Mapping - Connect Growth Loops → OKRs → Analytics]
- [Future idea: Automated Experiment Pipeline - From hypothesis → design → ship → analyze]
