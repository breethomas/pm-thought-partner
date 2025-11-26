---
description: Write a Product Requirements Document using Aakash Gupta's modern PRD framework (8/10 approach, quality over completeness)
---

# PRD Command

Write a **Product Requirements Document** following **Aakash Gupta's modern PRD framework** - shorter, more insightful, and designed to excite the team.

**Works with:**
- **Linear MCP** - Reads issue details, creates PRD from context
- **GitHub MCP** - Reads issue details, creates PRD from context
- **Manual** - Describe the feature directly

## What This Does

Guides you through writing a PRD that:
- **Gets teams excited** to build (not just informed)
- **Aims for 8/10 quality** (Pareto principle applied)
- **Focuses on quality content** over template completion
- **Includes user evidence** and impact sizing
- **Evolves through 5 stages** from planning to impact review

## Usage

```
/prd [issue-id]
/prd --step [planning|kickoff|solution-review|launch-readiness|impact-review]
/prd --checklist
```

**Examples:**
- `/prd ENG-245` - Start PRD for specific issue
- `/prd --step kickoff` - Work on kickoff stage
- `/prd --checklist` - Show checklist for current stage

## The 5 Stages

### 1. Planning
**When:** During planning cycle, exploring problem space

**Checklist:**
- [ ] Problem clearly defined
- [ ] Current state documented
- [ ] Metrics identified (what business metrics to move)
- [ ] Qualitative evidence included (user quotes, anecdotes)
- [ ] Competition surveyed
- [ ] User insight/segment identified
- [ ] Next steps and gaps outlined

### 2. Kickoff
**When:** Problem validated, moving to solution

**Checklist:**
- [ ] Potential solution outlined (wireframe/mock)
- [ ] Metrics to measure defined (north-star, secondary, guardrails)
- [ ] Impact sizing model created
- [ ] Counter metrics identified (what might go down)

### 3. Solution Review
**When:** After design exploration, solution locked

**Checklist:**
- [ ] Edge cases identified
- [ ] Roll-out plan defined
- [ ] XFN requirements outlined
- [ ] Tracking & analytics requirements specified
- [ ] Go-to-market strategy outlined
- [ ] Risks and mitigations documented

### 4. Launch Readiness
**When:** Final review before launch

**Checklist:**
- [ ] Engineering concerns addressed
- [ ] Design complete (Figma/design file linked)
- [ ] Estimated and tasked (JIRA/Linear ready)
- [ ] GTM teams enabled
- [ ] Test plan ready
- [ ] Corner cases discovered and handled

### 5. Impact Review
**When:** Post-launch

**Checklist:**
- [ ] Results review document linked
- [ ] Stats sniff test passed
- [ ] Continuous monitoring plan defined
- [ ] Improvements identified for future iterations

## What Happens

1. **Identifies your stage** - Where are you in the PRD process?
2. **Shows relevant checklist** - What does this stage need?
3. **Helps create quality content:**
   - User evidence (quotes, data, anecdotes)
   - Impact sizing (model out metric movement)
   - Counter metrics (what might go down)
   - Compelling narrative (get team excited)
4. **Reminds you:**
   - Aim for 8/10, not 10/10 (unless exec review)
   - Quality > completeness
   - Include the WHY, not just the WHAT

## Example Output

```
📄 PRD: AI-powered email composer (Planning Stage)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎯 PROBLEM

Users spend 2+ hours/day writing emails. Current tools
don't understand context or voice.

User quote: "I rewrite the same emails 10x. I know what
I want to say but it takes forever to get the tone right."

📊 METRICS

Input metric: Email composition time (currently 8min avg)
Output metric: User engagement (sessions/week)

Current state:
- 47% of users report email writing as #1 pain point
- Average 32 emails sent/day per user
- 8min average composition time

📈 IMPACT SIZING

If we reduce composition time by 50% (8min → 4min):
- Saves users 1hr/day
- Increases emails sent by 20% (engagement signal)
- Estimated NPS impact: +15 points

Addressable population: 10K active users (85% email users)
→ Target: 3K adoption in first quarter

⚠️  COUNTER METRICS TO WATCH
- Email quality (sentiment, response rates)
- Manual editing time (are we creating more work?)
- AI cost per email (unit economics)

🎨 USER EVIDENCE

From 15 user interviews:
- 87% said "writing takes too long"
- 60% use ChatGPT separately, then copy/paste
- 40% would pay $10/mo for good AI email

"I literally have ChatGPT open in another tab because
our compose experience sucks." - Sarah, enterprise user

🔍 COMPETITION

- Grammarly: Has AI writing, but not email-specific
- Superhuman: Fast email, no AI composition
- Jasper: AI writing, not integrated into email

Gap: No one has great AI composition inside email client

✅ NEXT STEPS

Week 1: Prototype throwaway UI for AI compose flow
Week 2: Test with 10 users, validate willingness to use
Week 3: Spike on costs (OpenAI vs Claude vs local model)
Week 4: Present at product review with recommendation

@design: Mock up 3 potential UX approaches
@eng: Cost model for 10K, 100K, 1M emails/month
@pm: Schedule 10 user tests

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💡 Quality Check:

✅ Problem is compelling
✅ User evidence is specific
✅ Impact sizing is credible
✅ Counter metrics identified
⚠️  Missing: Competitive differentiation detail
⚠️  Missing: Legal/compliance considerations

Current quality: 7/10 → Aim for 8/10 before kickoff

📋 TO GET TO 8/10:
- Add competitive analysis table
- Address compliance/legal requirements
- Model unit economics (3 scenarios)
```

## Key Principles

### Aim for 8/10, Not 10/10
Unless you have an exec review, don't spend 2 weeks on a perfect PRD. The Pareto principle applies. Get to 8/10 in 1-2 days.

### Quality Content > Template Completeness
Don't just fill in sections. Make them compelling:
- **User evidence:** Actual quotes, specific data
- **Impact sizing:** Real models, not vague goals
- **Counter metrics:** What might go down?
- **Competition:** What are they doing?

### Get People Excited
PRDs should make teams want to build this. Show:
- Why this matters to users (evidence)
- Why this matters to business (impact)
- Why now is the right time (opportunity)

### Common Mistakes to Avoid
- ❌ No impact sizing (just vague goals)
- ❌ No user evidence (just assumptions)
- ❌ Missing counter metrics
- ❌ Excessive delegation to design
- ❌ Looking complete but being vacuous

## Requirements

- ✅ PM Thought Partner plugin installed
- ✅ **Optional:** Linear MCP or GitHub MCP for automatic issue fetching
- ✅ **Manual mode:** Works without MCP - describe the feature

## Integration Options

**With Linear MCP:**
Automatically fetches issue details and creates PRD from context.

**With GitHub MCP:**
Automatically fetches issue details and creates PRD from context.

**Manual mode:**
```
Write a PRD for this feature: [describe feature]
We're at the [planning/kickoff/solution-review] stage.
```

## Learn More

See the full PRD framework at:
`frameworks/execution/prd-framework.md`

---

**Framework:** Aakash Gupta (Product Growth)
**Best for:** Feature documentation, alignment, shipping with confidence
**Key insight:** Modern PRDs are shorter but more insightful - quality over completeness
