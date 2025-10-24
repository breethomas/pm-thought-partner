---
description: Pre-launch health check for AI features using Chip Huyen's production AI framework
---

# AI Health Check Command

Run a comprehensive **production AI readiness assessment** using Chip Huyen's framework.

**Works with:**
- **Linear MCP / GitHub MCP** - Optional: Can attach readiness assessment to an issue as comment
- **Manual** - Describe your AI feature directly (recommended for detailed assessment)

## What This Does

Prevents common AI product mistakes before launch by checking:
- Have you tried simpler approaches before fine-tuning?
- What's your data quality strategy?
- What's your cost model at scale?
- How will you monitor quality?
- What's your failure UX?

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

1. **Fetches feature details** from Linear/GitHub (or uses your description)
2. **Runs health check** across 6 critical dimensions:
   - Model Selection Strategy
   - Data Quality & Preparation
   - Cost Modeling
   - Production Monitoring
   - Failure Handling (UX)
   - System-Level Optimization

3. **Returns assessment** with:
   - Readiness score per dimension (Ready / Needs Work / Blocked)
   - Missing pieces flagged
   - Specific questions to answer
   - Links to relevant framework sections

4. **Optionally adds** checklist to issue as comment

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

⚠️ DATA QUALITY & PREPARATION (Needs Work)
What's your data quality strategy?
→ Not defined yet

How are you chunking/formatting data?
→ Using default chunking, no custom metadata

What's your data refresh strategy?
→ Not defined

⚠️ Concerns:
- Data quality beats tool selection, but quality strategy is undefined
- Default chunking may not be optimal for email templates
- No plan for handling outdated templates

📋 Action Items:
1. Define thoughtful chunking strategy for email templates
2. Add metadata (category, tone, audience) to chunks
3. Plan for data freshness (how often to refresh templates)

See: production-ai-systems.md "Data Quality Over Tool Selection" section

---

❌ COST MODELING (Blocked)
What's your cost per request?
→ Unknown

What's the cost per user per month at 10x scale?
→ Not calculated

What percentage of revenue is inference cost?
→ Not analyzed

🚨 BLOCKED: Cannot ship responsibly without cost model

📋 Action Items:
1. Calculate cost per email generation (model API + embedding + retrieval)
2. Model at 100 users, 1K users, 10K users
3. Compare to pricing/revenue model
4. Identify cost optimization opportunities (caching, cheaper models for simple emails)

See: production-ai-systems.md "Cost Optimization" + ai-unit-economics.md

---

✅ PRODUCTION MONITORING (Ready)
What will you monitor?
→ Response quality (thumbs up/down), accuracy, user edits, task completion

How will you detect degradation?
→ Weekly quality dashboard review, alerts if satisfaction < 80%

Status: Good monitoring plan in place

---

⚠️ FAILURE HANDLING UX (Needs Work)
What happens when AI fails?
→ Generic error message: "Something went wrong"

Can users override bad suggestions?
→ Yes, full edit capability

How do users know when to trust AI output?
→ Not addressed

⚠️ Concerns:
- Generic error messages don't help users
- No confidence indicators
- Users can't tell when AI is uncertain

📋 Action Items:
1. Design specific error messages ("I couldn't generate an email" vs generic error)
2. Add confidence indicators when AI is uncertain
3. Show AI as assistant, not final authority (e.g., "Here's a draft you can edit")
4. Provide fallback options when AI fails

See: production-ai-systems.md "Handling AI Failures Gracefully"

---

✅ SYSTEM-LEVEL OPTIMIZATION (Ready)
Are you optimizing end-to-end latency?
→ Yes - measured full user flow, not just model inference

Have you mapped bottlenecks?
→ Yes - retrieval takes longer than generation (5s vs 2s)

Status: System-level thinking in place

---

📊 SUMMARY

Ready to Ship: ❌ Not Yet

Dimensions Ready: 4/6
- ✅ Model Selection Strategy
- ⚠️ Data Quality (needs work)
- ❌ Cost Modeling (blocked)
- ✅ Production Monitoring
- ⚠️ Failure Handling UX (needs work)
- ✅ System-Level Optimization

🚨 BLOCKERS (Must fix before launch):
1. Cost modeling - Calculate costs at scale
2. Data quality strategy - Define chunking, metadata, refresh

⚠️ SHOULD FIX (Quality improvements):
3. Failure UX - Better error messages, confidence indicators

✅ GOOD TO GO:
- Model selection following best practices
- Monitoring plan in place
- System-level optimization thinking

📋 NEXT STEPS:
1. Run /ai-cost-check to model economics
2. Define data quality strategy (2-3 hours)
3. Design failure UX (user-facing error states)
4. Rerun /ai-health-check after fixes

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
