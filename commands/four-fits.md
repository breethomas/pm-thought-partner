---
description: Validate product-market-channel-model alignment using Brian Balfour's Four Fits framework
---

# Four Fits Command

Validate **sustainable scaling readiness** using Brian Balfour's Four Fits framework.

**Works with:**
- **Linear MCP / GitHub MCP** - Optional: Can attach analysis to an issue as comment
- **Manual** - Provide product/market context directly (recommended for strategic thinking)

## What This Does

Prevents scaling too early by validating ALL four fits are aligned:
1. **Market ↔ Product** - Do customers want this?
2. **Product ↔ Channel** - Can we reach customers efficiently?
3. **Channel ↔ Model** - Does our business model support acquisition costs?
4. **Model ↔ Market** - Can we monetize this market profitably?

**Philosophy:** "All four fits must align for $100M+ growth." Scaling with misaligned fits burns cash and fails. - Brian Balfour

## Usage

```
/four-fits
```

**Examples:**
- `/four-fits` - Full assessment of current state
- `/four-fits --validate` - Pre-scale validation checklist
- `/four-fits --diagnose` - Identify which fit is blocking growth
- `/four-fits --market "SMB SaaS"` - Specify market explicitly

## What Happens

1. **Gathers context** about your product:
   - What's your market? (SMB, enterprise, consumer)
   - What's your product? (feature set, positioning)
   - What's your primary channel? (paid, viral, content, sales)
   - What's your business model? (SaaS, marketplace, freemium, transaction)

2. **Assesses each fit** independently:
   - Questions to validate fit strength
   - Evidence required
   - Common anti-patterns
   - Confidence level (Validated / Needs Work / Misaligned)

3. **Identifies misalignments:**
   - Which fits are blocking scale?
   - Where are the gaps?
   - What validation is needed?

4. **Returns** detailed assessment with:
   - Fit-by-fit analysis
   - Overall readiness score
   - Recommended fixes
   - When to scale (or not)

5. **Provides validation activities** to de-risk each fit

## Example Output

```
🎯 Four Fits Assessment: Project Management SaaS

CONTEXT:
- Market: SMB teams (5-50 employees)
- Product: Collaborative project management tool
- Primary Channel: Paid search + content marketing
- Business Model: $20/user/month SaaS subscription

---

FIT #1: MARKET ↔ PRODUCT (✅ VALIDATED)

Questions:
✅ Is there a real pain point in this market?
   → Yes - SMBs struggle with coordination across remote teams

✅ Is our product solving that pain?
   → Yes - 80% retention, high NPS (45)

✅ Do customers choose us over alternatives?
   → Yes - win rate vs competitors 60%

✅ Are customers willing to pay?
   → Yes - conversion free → paid is 25%

Evidence:
- Retention: 80% (strong)
- NPS: 45 (excellent)
- PMF survey: 48% "very disappointed" (above 40% threshold)
- Customer interviews: pain point validated across 30+ interviews

Confidence: ✅ VALIDATED

Why: Multiple strong signals. Product-market fit is real.

---

FIT #2: PRODUCT ↔ CHANNEL (⚠️ NEEDS WORK)

Questions:
⚠️ Can customers discover us through this channel?
   → Partially - paid search works, content struggling

⚠️ Can we acquire customers at sustainable cost?
   → Partially - CAC $400, LTV $1,200 (3:1 ratio is healthy but...)

❌ Is our product suited to this channel?
   → Questionable - paid search requires instant "aha moment"
   → Our product has 7-day onboarding (too slow)

❌ Can we scale this channel 10x?
   → No - paid search is competitive, CPCs rising
   → Content SEO takes 6-12 months to compound

Evidence:
- Paid search CPC: Increased 40% in 6 months (channel saturation)
- Content SEO: Only 5% of traffic (nascent, not scaling yet)
- Activation rate: 30% (too low for paid channel)
- Time to value: 7 days (too slow, users churn before "aha")

Confidence: ⚠️ NEEDS WORK

Issues:
1. Product onboarding too slow for paid acquisition
2. Paid search channel saturating (rising CPCs)
3. Alternative channels (content, viral) not mature yet

📋 Fixes Required:
1. Shorten time-to-value (7 days → 2 days)
2. Improve activation rate (30% → 50%+)
3. Build viral loop to reduce paid dependency (see /growth-loops)
4. Scale content SEO (current 5% → 30% of acquisition)

---

FIT #3: CHANNEL ↔ MODEL (✅ VALIDATED)

Questions:
✅ Does our pricing support customer acquisition costs?
   → Yes - LTV $1,200, CAC $400 (3:1 ratio)

✅ Is payback period acceptable?
   → Yes - 6 months (standard for SaaS)

✅ Can we profitably acquire customers at scale?
   → Yes - unit economics are healthy

Evidence:
- LTV/CAC: 3:1 (healthy, target is >3)
- Payback: 6 months (acceptable)
- Gross margin: 85% (strong for SaaS)
- Churn: 20% annual (room for improvement but not blocking)

Confidence: ✅ VALIDATED

Why: Unit economics are solid. Model supports the channel.

However: If channel saturation continues (CPCs rising), this fit could degrade.

---

FIT #4: MODEL ↔ MARKET (⚠️ NEEDS WORK)

Questions:
✅ Can this market support our pricing?
   → Yes - SMBs can pay $20/user/month

⚠️ Is our TAM large enough for our ambitions?
   → Maybe - 10M SMBs globally, but hard to reach

❌ Can we expand within accounts?
   → Struggling - average team size is 8 users, not growing

❌ Does this market align with our long-term model?
   → Questionable - SMBs have high churn (limited budgets)

Evidence:
- TAM: 10M SMBs (large enough for $100M+ business)
- Average deal size: $160/month (8 users × $20)
- Expansion revenue: Only 10% (most teams don't grow)
- Market churn: Higher than enterprise (budget sensitivity)

Confidence: ⚠️ NEEDS WORK

Issues:
1. Limited account expansion (teams don't grow)
2. SMB churn higher than enterprise
3. Hard to reach upper end of SMB market (50-person teams)

📋 Fixes Required:
1. Add enterprise tier to expand upmarket (bigger teams, lower churn)
2. Increase expansion revenue (upsells, premium features)
3. Consider moving upmarket to mid-market (50-200 employees)

Alternative: Accept SMB limitations, optimize for efficiency vs growth

---

📊 OVERALL ASSESSMENT

Fit Alignment: 2/4 Validated, 2/4 Need Work

| Fit | Status | Blocking Scale? |
|-----|--------|-----------------|
| Market ↔ Product | ✅ Validated | No |
| Product ↔ Channel | ⚠️ Needs Work | Yes |
| Channel ↔ Model | ✅ Validated | No |
| Model ↔ Market | ⚠️ Needs Work | Partially |

---

🚨 SCALE READINESS: ❌ NOT READY

Recommendation: **DO NOT SCALE YET**

Why:
- Product-Channel fit needs fixing (onboarding too slow, channel saturating)
- Model-Market fit needs work (limited expansion, high churn)
- Scaling now would burn cash without compounding returns

---

🎯 PRIORITIZED FIXES (Before Scaling)

Priority 1 (Blocking): Product ↔ Channel Fit
1. Reduce time-to-value from 7 days → 2 days
   - Impact: Activation rate 30% → 50%+
   - Effort: 1-2 months
   - Validation: A/B test new onboarding flow

2. Build viral loop to diversify channels
   - Impact: Reduce paid dependency
   - Effort: 1 quarter
   - See: /growth-loops

3. Scale content SEO from 5% → 30% of traffic
   - Impact: Lower blended CAC
   - Effort: 6-12 months (but start now)

Priority 2 (Important): Model ↔ Market Fit
4. Move upmarket to mid-market (50-200 employee companies)
   - Impact: Lower churn, higher expansion
   - Effort: 2-3 quarters
   - Validation: Run 10 mid-market pilots

5. Increase expansion revenue (upsells)
   - Impact: LTV increases 20-30%
   - Effort: 1-2 quarters

---

📅 TIMELINE TO SCALE READINESS

Conservative estimate: 9-12 months

Month 1-3: Fix Product-Channel fit
- Ship faster onboarding
- Build viral invite loop
- Start content SEO program

Month 4-6: Validate improvements
- Measure activation rate improvement
- Track viral coefficient
- Monitor SEO traffic growth

Month 7-9: Address Model-Market fit
- Launch mid-market offering
- Pilot with 10 larger customers
- Build upsell/expansion features

Month 10-12: Final validation
- Rerun /four-fits assessment
- Validate all fits are aligned
- THEN scale

Impatient timeline: 6 months (risky)
Could fix Product-Channel fit in 3 months, validate in 3 more, then scale.
Risk: Model-Market issues could bite later.

---

💡 KEY INSIGHTS

✅ STRENGTHS:
- Strong product-market fit (retention, NPS, PMF survey all excellent)
- Healthy unit economics (3:1 LTV/CAC)
- Clear customer pain point

⚠️ BLOCKERS:
- Onboarding too slow for paid acquisition (7-day time-to-value)
- Paid channel saturating (CPCs up 40%)
- Limited account expansion (SMB teams don't grow)

🔄 INTERDEPENDENCIES:
- Fixing Product-Channel fit enables scaling content/viral (slower onboarding → higher activation → better viral loops)
- Moving upmarket fixes Model-Market fit BUT requires different messaging/features
- All four fits must align before aggressive scaling

📋 NEXT ACTIONS:
1. Run /lno-prioritize on roadmap - focus on Leverage work (onboarding, viral loop)
2. Prototype faster onboarding experience (2-week spike)
3. A/B test new onboarding vs current (measure activation improvement)
4. Design viral invite loop (see /growth-loops)
5. Rerun /four-fits after fixes (6 months)

Full framework: frameworks/growth/four-fits.md
```

## Four Fits Deep Dive

### Fit #1: Market ↔ Product

**The question:** Do customers want this?

**Validation signals:**
- High retention (>80% for SaaS)
- Strong NPS (>40)
- PMF survey >40% "very disappointed"
- Organic word-of-mouth
- Customers choose you over alternatives

**Anti-patterns:**
- Low retention (<60%)
- Building features customers don't use
- Winning on price, not value

**See:** `/pmf-survey` for validation

---

### Fit #2: Product ↔ Channel

**The question:** Can we reach customers efficiently through this channel?

**Validation signals:**
- Customers discover you naturally
- CAC is sustainable (<1/3 of LTV)
- Acquisition is repeatable and scalable
- Product is suited to channel (e.g., viral product + viral channel)

**Anti-patterns:**
- CAC > LTV (unsustainable)
- Channel is saturated (CPCs rising)
- Product onboarding too slow for channel
- Can't scale channel 10x

**Channel types:**
- Paid (Google Ads, Facebook, etc.)
- Viral (referrals, word-of-mouth)
- Content (SEO, owned media)
- Sales (outbound, inside sales)

---

### Fit #3: Channel ↔ Model

**The question:** Does our business model support acquisition costs?

**Validation signals:**
- LTV/CAC > 3 (healthy)
- Payback period acceptable (< 12 months)
- Gross margins support channel costs
- Can profitably acquire at scale

**Anti-patterns:**
- LTV/CAC < 2 (unprofitable)
- Payback > 18 months (too long)
- Thin margins can't support CAC
- Model doesn't scale with volume

**See:** `/ai-cost-check` for cost modeling

---

### Fit #4: Model ↔ Market

**The question:** Can we monetize this market profitably?

**Validation signals:**
- Market can afford your pricing
- TAM is large enough for ambitions
- Can expand within accounts
- Model aligns with market buying behavior

**Anti-patterns:**
- Market can't afford pricing (too expensive for segment)
- TAM too small for goals
- No expansion revenue (one-and-done)
- Mismatch in sales cycle vs model

---

## Diagnostic Mode

```
/four-fits --diagnose
```

Helps identify WHICH fit is blocking growth:

**Symptoms → Diagnosis:**

**Low retention, high churn**
→ Market-Product fit issue
→ Run: `/pmf-survey`

**High CAC, can't scale acquisition**
→ Product-Channel fit issue
→ Consider: Different channel or improve activation

**Unprofitable customer acquisition**
→ Channel-Model fit issue
→ Run: `/ai-cost-check` or raise prices

**Can't expand, limited TAM**
→ Model-Market fit issue
→ Consider: Different market segment or business model

---

## Integration Options

### Manual
- Guided assessment through questions
- Outputs fit-by-fit analysis
- Provides validation checklists

### With Linear
- Analyzes product strategy issues
- Tags with fit type
- Creates validation backlog

### With GitHub
- Reviews strategy docs
- Identifies fit gaps

## Requirements

- ✅ PM Thought Partner plugin installed
- ✅ **Optional:** Linear MCP for issue integration

## Common Use Cases

### Pre-Scale Validation
```
/four-fits --validate
```
Before raising funding or scaling spend

### Growth Diagnosis
```
/four-fits --diagnose
```
Identify why growth isn't compounding

### Strategic Planning
```
/four-fits
```
Annual or quarterly strategy review

### Pivot Validation
```
/four-fits --market "Enterprise"
```
Validate moving upmarket or new segment

## Learn More

**Full frameworks:**
- `frameworks/growth/four-fits.md` - Brian Balfour's complete framework
- `frameworks/growth/growth-loops.md` - Elena Verna on sustainable growth
- `frameworks/measurement/pmf-survey.md` - Validate Market-Product fit

**Related commands:**
- `/pmf-survey` - Validate Market-Product fit specifically
- `/growth-loops` - Design Product-Channel fit via loops
- `/lno-prioritize` - Prioritize work to fix misaligned fits
- `/ai-cost-check` - Validate Channel-Model economics

---

**Framework:** Four Fits (Brian Balfour)
**Best for:** Validating sustainable scaling readiness
**Key insight:** "All four fits must align for $100M+ growth. Scaling with misaligned fits burns cash."
**Remember:** Fix fits in order - Market-Product first, then Product-Channel, then Channel-Model, then Model-Market. Don't skip ahead.
