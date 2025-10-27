---
description: Pre-launch health check that blocks you from shipping broken AI features
---

# AI Health Check Command

**Before you ship an AI feature, it needs to pass 6 checks.**

Most AI products fail because PMs skip the basics: no cost model, broken failure UX, terrible data quality. This command stops you from launching garbage.

**Works with:**
- **Linear MCP / GitHub MCP** - Optional: Can attach assessment to an issue
- **Manual** - Describe your AI feature directly

## What This Does

**Checks if you're ready to ship:**
- ❌ **Blockers** - Missing these = don't ship
- ⚠️ **Risks** - Fix these or accept the consequences
- ✅ **Ready** - Good to go

**Six dimensions:**
1. Model selection (did you try simple approaches first?)
2. Data quality (the thing you're probably ignoring)
3. Cost modeling (can you afford this at scale?)
4. Production monitoring (how will you know if it breaks?)
5. Failure UX (what happens when AI screws up?)
6. System optimization (are you measuring the right things?)

**Philosophy:** "Most AI failures are UX problems, not technical ones. Data quality beats tool selection. Fine-tuning should be your last resort." - Chip Huyen

## Usage

```
/ai-health-check [issue-id]
```

**Examples:**
- `/ai-health-check ENG-245` - Assess specific AI feature issue
- `/ai-health-check --pre-launch` - Full pre-launch checklist for current sprint
- `/ai-health-check --add-comment` - Add assessment to Linear issue
- `/ai-health-check "email composer AI"` - Manual description

## What Happens

1. **Asks hard questions** about your AI feature
2. **Grades each dimension:** ✅ Ready / ⚠️ Risk / ❌ Blocked
3. **Tells you if you can ship:**
   - All green? Ship it.
   - Any blockers? Fix them or don't ship.
   - Risks? Your call, but you've been warned.

4. **Optionally creates** Linear issues for blockers

## Example Output

```
🏥 AI Health Check: [ENG-245] AI-powered email composer

Overall Readiness: ⚠️ NEEDS WORK (4/6 dimensions ready)

---

✅ MODEL SELECTION STRATEGY (Ready)
Have you tried prompt engineering first?
→ Yes - Tested 15+ prompt variations before considering fine-tuning

Have you exhausted context engineering?
→ Yes - RAG system retrieves relevant email templates

Status: Following the hierarchy correctly (prompting → context → tools → fine-tuning)

---

⚠️ DATA QUALITY & PREPARATION (Risk)
What's your data quality strategy?
→ "Not defined yet"

🚨 THIS IS A PROBLEM

You're building an AI feature with no data quality strategy.
Data quality beats tool selection. Always.

Default chunking is lazy. Email templates need:
- Metadata (category, tone, audience)
- Thoughtful chunking (by use case, not by character count)
- Refresh strategy (outdated templates = bad suggestions)

FIX THIS BEFORE LAUNCH:
1. Define chunking strategy (2 hours)
2. Add metadata to all templates (4 hours)
3. Set up data refresh pipeline (1 day)

OR: Prototype with better data first, see if results improve 10x

See: production-ai-systems.md "Data Quality Over Tool Selection"

---

❌ COST MODELING (BLOCKER)
What's your cost per request?
→ "Unknown"

What's cost per user at 10K users?
→ "Not calculated"

🛑 DON'T SHIP WITHOUT A COST MODEL

You're about to launch with zero idea if this bankrupts you at scale.

This isn't optional. You MUST know:
- Cost per email generation
- Cost at 1K, 10K, 100K users
- % of revenue consumed by AI
- What happens if usage is 10x higher than expected

RUN /ai-cost-check RIGHT NOW

Then come back when you have numbers.

See: ai-unit-economics.md

---

✅ PRODUCTION MONITORING (Ready)
What will you monitor?
→ Response quality (thumbs up/down), accuracy, user edits, task completion

How will you detect degradation?
→ Weekly quality dashboard review, alerts if satisfaction < 80%

Status: Good monitoring plan in place

---

⚠️ FAILURE HANDLING UX (Risk)
What happens when AI fails?
→ "Something went wrong"

Can users tell when AI is uncertain?
→ No

🚨 YOUR FAILURE UX IS BROKEN

"Something went wrong" tells users nothing.
No confidence indicators = users don't know when to trust the AI.

Users WILL see failures. How you handle them = your product quality.

FIX BEFORE LAUNCH:
1. Write specific error messages (2 hours)
   - "I couldn't find relevant templates for this request"
   - Not "Something went wrong"

2. Add confidence indicators (1 day)
   - Show when AI is uncertain
   - Let users know it's a draft, not final

3. Build fallback UX (3 hours with Cursor)
   - What happens if AI takes >10s?
   - What if it returns nothing useful?

See: production-ai-systems.md "Handling AI Failures Gracefully"

---

✅ SYSTEM-LEVEL OPTIMIZATION (Ready)
Are you optimizing end-to-end latency?
→ Yes - measured full user flow, not just model inference

Have you mapped bottlenecks?
→ Yes - retrieval takes longer than generation (5s vs 2s)

Status: System-level thinking in place

---

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📊 VERDICT: DON'T SHIP YET
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ Ready: 4/6
⚠️ Risks: 2/6
❌ Blockers: 1/6

🛑 YOU HAVE 1 BLOCKER:
- No cost model → Run /ai-cost-check RIGHT NOW

⚠️ YOU HAVE 2 RISKS (fix or accept):
- Data quality strategy undefined
- Failure UX is broken

✅ GOOD TO GO:
- Model selection
- Production monitoring
- System optimization

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
WHAT TO DO NOW
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

**Option A: Fix everything (RECOMMENDED)**
1. Run /ai-cost-check (10 min)
2. Define data quality strategy (2 hours)
3. Build better failure UX with Cursor (3 hours)
4. Rerun /ai-health-check

Time: 1 day. Result: Ship confidently.

**Option B: Ship with known risks**
1. Fix the blocker (run /ai-cost-check)
2. Ship knowing:
   - Data quality might be bad
   - Failure UX will frustrate users
3. Plan to fix in week 1

Time: 10 min. Result: Ship fast, fix later.

Want me to create Linear issues for Option A?

Full framework: frameworks/ai/production-ai-systems.md
```

## Health Check Dimensions

### 1. Model Selection Strategy

**Key questions:**
- Have you tried prompt engineering before fine-tuning?
- Have you exhausted context engineering (RAG, better data)?
- Have you considered tool use / function calling?
- Is fine-tuning actually necessary?

**Common mistake:** Jumping to fine-tuning without trying simpler approaches

**Best practice:** Follow the hierarchy - prompting → context → tools → fine-tuning

---

### 2. Data Quality & Preparation

**Key questions:**
- What's your data quality strategy?
- How are you chunking/formatting data?
- What metadata are you including?
- How do you handle duplicates or outdated content?
- What's your data refresh strategy?

**Common mistake:** Spending weeks debating vector databases while ignoring data quality

**Best practice:** Data quality > tool selection. Focus 80% on data, 20% on tools.

---

### 3. Cost Modeling

**Key questions:**
- What's your cost per request?
- What's cost per user per month at different scales?
- What % of revenue is inference cost?
- Where can you optimize (caching, cheaper models for simple queries)?

**Common mistake:** Not modeling costs until production, then discovering it's unsustainable

**Best practice:** Model at 10x, 100x scale BEFORE launch

---

### 4. Production Monitoring

**Key questions:**
- What quality metrics are you tracking?
- What performance metrics (latency, error rate)?
- What cost metrics?
- How do you detect data distribution shift?
- What are your alert thresholds?

**Common mistake:** Launching without monitoring, flying blind

**Best practice:** Define metrics and dashboards before launch

---

### 5. Failure Handling UX

**Key questions:**
- What happens when AI fails?
- Can users override bad suggestions?
- How do users know when to trust AI?
- What's your fallback experience?
- Do error messages help users?

**Common mistake:** Only designing the success UX, not the failure UX

**Best practice:** Design failure experience as carefully as success experience

---

### 6. System-Level Optimization

**Key questions:**
- Are you optimizing end-to-end latency (not just model inference)?
- Have you mapped bottlenecks in the full system?
- Are you measuring total cost per user interaction?

**Common mistake:** Optimizing model performance while ignoring data retrieval bottlenecks

**Best practice:** Map the full user journey, optimize system-wide

---

## Pre-Launch Checklist Mode

```
/ai-health-check --pre-launch
```

Generates a comprehensive checklist for all AI features in current sprint:

```
🚀 Pre-Launch AI Health Check

Found 3 AI features in current sprint:

1. [ENG-245] Email composer - ⚠️ Needs Work (4/6)
2. [ENG-278] Search with AI - ✅ Ready (6/6)
3. [ENG-301] Code suggestions - ❌ Blocked (2/6)

Overall Sprint Readiness: ⚠️ 1 ready, 1 needs work, 1 blocked

[Detailed assessment for each feature]

🚨 Sprint Blockers:
- ENG-301: No cost model, no monitoring plan

⚠️ Should Fix Before Launch:
- ENG-245: Data quality strategy, failure UX

✅ Ready to Ship:
- ENG-278: All dimensions ready
```

## Integration Options

### With Linear

- Adds health check as issue comment
- Creates "AI Health Check" label
- Flags blockers with "blocked-ai-readiness" label
- Can create follow-up issues for missing pieces

### With GitHub

- Adds health check as issue comment
- Tags with "ai-health-check" label
- Creates checklist in issue body

### Manual

- Returns markdown assessment
- Provides checklist you can copy
- Links to specific framework sections for fixes

## Requirements

- ✅ PM Thought Partner plugin installed
- ✅ **Optional:** Linear MCP server for issue integration
- ✅ **Optional:** GitHub for issue tracking

## Common Use Cases

### Before Sprint Planning
```
/ai-health-check --pre-launch
```
Check all AI features slated for sprint. Identify blockers early.

### During Feature Review
```
/ai-health-check ENG-245
```
Validate AI feature is production-ready before marking "ready for dev"

### Before Demo/Launch
```
/ai-health-check "product recommendations" --add-comment
```
Final check before showing to customers or launching

## Learn More

**Full frameworks:**
- `frameworks/ai/production-ai-systems.md` - Chip Huyen's comprehensive guide
- `frameworks/ai/ai-unit-economics.md` - Cost modeling details
- `frameworks/ai/pm-friendly-evals-guide.md` - Quality testing approach

**Related commands:**
- `/start-evals` - Set up quality testing
- `/ai-cost-check` - Detailed cost modeling
- `/four-risks` - Overall feature risk assessment

---

**Framework:** Production AI Systems (Chip Huyen)
**Best for:** Pre-launch validation of AI features
**Key insight:** "Fine-tuning is the last resort. Data quality beats tool selection. Most AI failures are UX problems."
**Remember:** The gap between a demo and a product is production engineering.
