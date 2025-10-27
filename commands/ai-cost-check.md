---
description: Calculate AI feature costs and challenge if you actually need it
---

# AI Cost Check Command

Before you build an AI feature, answer two questions:
1. **Do you actually need this feature?**
2. **Can you afford it?**

Most PMs skip #1 and regret #2 later.

**Works with:**
- **Linear MCP / GitHub MCP** - Optional: Can attach analysis to an issue as comment
- **Manual** - Describe your AI feature directly (recommended for detailed analysis)

## What This Does

**Challenges you first:**
- Is this solving a real problem or feature theater?
- Have you validated users want this?
- Could a simpler approach work?

**Then models the economics:**
- Cost per user at 100, 1K, 10K, 100K scale
- % of revenue consumed by AI inference
- Break-even analysis

**Philosophy:** AI products have marginal costs that scale with usage. Every user interaction costs money. Model this BEFORE building, not after launch when you're hemorrhaging cash.

## Usage

```
/ai-cost-check [feature-name]
```

**Examples:**
- `/ai-cost-check "product recommendations"` - Calculate recommendation costs
- `/ai-cost-check ENG-245` - Analyze Linear issue for AI costs
- `/ai-cost-check --model gpt-4` - Specify model explicitly
- `/ai-cost-check "email composer" --scale 10000` - Model at 10K users
- `/ai-cost-check --compare` - Compare cost across different models

## What Happens

### Step 1: Challenge the Premise

Before calculating anything, I'll ask:

**"Why are you building this?"**
- What problem does this solve?
- Have you validated users want this? (Not "we think" — actual evidence)
- Could you solve this without AI? (Simpler is usually better)

**Real talk:** Most AI features are solutions looking for problems. If you can't answer these questions clearly, stop. Prototype something simple and test with 10 users FIRST.

### Step 2: Model the Economics

If you have real evidence users want this, let's calculate if you can afford it:

1. **Cost per request** (input tokens + output tokens + infrastructure)
2. **Cost at scale** (100 → 100K users)
3. **Revenue comparison** (% of revenue consumed)
4. **Sustainability assessment** (can your business model support this?)

### Step 3: Give You Options

Based on the numbers:

**If sustainable (AI costs <15% of revenue):**
- ✅ Economics work. Here's how to optimize further.
- **Your call:** Want to prototype this in Cursor/Claude Code today?

**If marginal (15-30% of revenue):**
- ⚠️ Expensive but viable. You MUST optimize.
- **Before building:** Prototype the optimization strategy first (caching, cheaper models, etc.)
- **Your call:** Build full feature OR build cost-optimized version first?

**If unsustainable (>30% of revenue):**
- 🚨 **Economics don't work. Don't build this.**
- **Options:**
  1. Raise prices 2-3x (have you validated willingness to pay?)
  2. Gate this feature for premium tier only
  3. Rebuild with fundamentally cheaper approach
  4. **Don't build it** (saying no is valid)

## Example Output

```
💰 AI Cost Check: Product Recommendations

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
WAIT — Before We Calculate Costs
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

❓ Why are you building AI recommendations?

You said: "Users struggle to discover relevant products"

Evidence you have:
- ❌ No user interviews validating this is the problem
- ❌ No data on search/browse abandonment rates
- ❌ Haven't tested simpler approaches (better search, filters, trending)

🚨 HOLD UP: You don't have evidence this solves a real problem.

Before modeling costs, validate the problem:

1. **Talk to 10 users this week:**
   - "When you're looking for products, what's frustrating?"
   - "Would AI recommendations help or just add noise?"
   - "What would make discovery easier?"

2. **Prototype in 2 hours with Cursor/Claude Code:**
   - Add a "Trending this week" section (no AI, just sorted by orders)
   - Deploy to 50 beta users
   - See if this solves discovery WITHOUT AI costs

3. **A/B test simpler options:**
   - 50% see trending products (no AI)
   - 50% see basic collaborative filtering (cheap, no LLM)
   - Measure conversion lift

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Okay, assuming you validated users want this, here are the economics:

FEATURE DETAILS:
- Model: GPT-4 Turbo
- Use case: Generate personalized recommendations
- Calls per recommendation: 1
- Input: 1,500 tokens (user profile + catalog context)
- Output: 300 tokens (5 recommendations)

📊 COST BREAKDOWN

Per request: $0.024
Per user/month (3 requests/day): $2.16

| Scale | Monthly Cost | Your Revenue | AI % of Revenue |
|-------|-------------|--------------|-----------------|
| 100   | $216        | $2,000       | 10.8% ✅         |
| 1K    | $2,160      | $20,000      | 10.8% ✅         |
| 10K   | $21,600     | $200,000     | 10.8% ✅         |
| 100K  | $216,000    | $2M          | 10.8% ✅         |

✅ VERDICT: Sustainable at 10.8% of revenue

BUT — this assumes:
- Users request exactly 3 recommendations/day (what if it's 10x?)
- Pricing stays at $20/month (can you raise prices if needed?)
- You optimize caching/models (saving 40-60%)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎯 YOUR DECISION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Economics work IF your assumptions hold.

Before building the full feature:

**Option A: Validate the problem first (RECOMMENDED)**
- Prototype a simpler solution in 2 hours (trending products, better filters)
- Test with 50 users this week
- See if AI is actually needed
- Want me to create this validation spike in Linear?

**Option B: Prototype AI version cheaply**
- Build with Cursor/Claude Code in 4 hours
- Use GPT-3.5 first (70% cheaper) to validate quality is good enough
- Deploy to 20 beta users
- Measure conversion lift vs cost
- Want me to create this prototype task in Linear?

**Option C: Build full production feature**
- Implement with GPT-4 + caching
- Set up cost monitoring alerts (warn if >15% revenue)
- Define usage limits (prevent cost blow-up)
- Want me to create these implementation tasks in Linear?

What's your call?

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💡 OPTIMIZATION PATHS (if you proceed)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. **Caching** (saves 40-60%): $8,640/month at 10K users
2. **Model selection** (saves 70%): Use GPT-3.5 for simple cases
3. **Prompt optimization** (saves 20-30%): Reduce input tokens
4. **Batch processing** (saves 15-25%): Pre-generate common queries

Total potential: Reduce from $21,600 → $9,000/month (58% savings)
```

## Cost Check Dimensions

### 1. Direct Model Costs
- Input tokens × input price
- Output tokens × output price
- API call overhead
- Multiple calls (if chaining)

### 2. Indirect Costs
- Embeddings (for RAG/semantic search)
- Vector database queries
- Data preprocessing
- Storage costs
- Bandwidth

### 3. Scale Modeling
- Cost per user per day/month
- At different user scales (100, 1K, 10K, 100K)
- Usage pattern variations (light vs heavy users)
- Peak load handling

### 4. Revenue Comparison
- AI cost as % of revenue per user
- Break-even analysis
- Margin impact
- Pricing sustainability

### 5. Optimization Opportunities
- Caching potential
- Model selection (cheaper for simple cases)
- Prompt optimization
- Batch processing
- Fine-tuning ROI

## Interactive Mode

```
/ai-cost-check --interactive
```

Guided wizard that helps you model costs:

```
💰 Let's calculate your AI feature costs

Q1: What model are you using?
> GPT-4 Turbo

Q2: How many API calls per user action?
> 1 call to generate recommendations

Q3: Average input token count?
> ~1,500 tokens (user profile + product context)

Q4: Average output token count?
> ~300 tokens (5 recommendations)

Q5: How often does a typical user trigger this AI feature?
> 3 times per day

Q6: What's your pricing per user per month?
> $20/month

Q7: Any additional AI costs? (embeddings, vector DB, etc.)
> Yes, embeddings for product catalog

Calculating...

[Shows full cost breakdown]
```

## Model Price Reference

The command includes current pricing for common models:

**OpenAI:**
- GPT-4 Turbo: $0.01/1K input, $0.03/1K output
- GPT-3.5 Turbo: $0.0005/1K input, $0.0015/1K output

**Anthropic:**
- Claude 3 Opus: $0.015/1K input, $0.075/1K output
- Claude 3 Sonnet: $0.003/1K input, $0.015/1K output
- Claude 3 Haiku: $0.00025/1K input, $0.00125/1K output

**Embeddings:**
- OpenAI ada-002: $0.0001/1K tokens
- Voyage AI: $0.0001/1K tokens

*(Prices as of January 2025, subject to change)*

## Integration Options

### With Linear
- Adds cost analysis as issue comment
- Creates "AI Cost Analysis" label
- Flags issues with "high-ai-cost" if unsustainable
- Can create follow-up issues for optimization

### With GitHub
- Adds cost breakdown as issue comment
- Tags with "ai-cost-check" label

### Manual
- Returns markdown breakdown
- CSV export for spreadsheet modeling
- Can adjust assumptions and rerun

## Requirements

- ✅ PM Thought Partner plugin installed
- ✅ **Optional:** Linear MCP server for issue integration

## Common Use Cases

### Before Committing to AI Feature
```
/ai-cost-check "customer support automation"
```
Validate economics BEFORE building

### Comparing Model Options
```
/ai-cost-check "product recommendations" --compare
```
See costs across GPT-4, Claude, GPT-3.5

### Scaling Validation
```
/ai-cost-check "email composer" --scale 100000
```
Model costs at target scale

### Optimization Review
```
/ai-cost-check ENG-245
```
Run monthly to track cost trends and optimization opportunities

## Learn More

**Full frameworks:**
- `frameworks/ai-era-practices/ai-unit-economics.md` - Complete economic modeling
- `frameworks/ai/production-ai-systems.md` - Cost optimization strategies (Chip Huyen)
- `frameworks/discovery/four-risks.md` - Viability risk assessment

**Related commands:**
- `/ai-health-check` - Overall AI feature readiness
- `/four-risks` - Includes viability (business model) risk
- `/pmf-survey` - Validate willingness to pay

---

**Framework:** AI Unit Economics
**Best for:** Economic validation of AI features AND challenging if you need the feature
**Key insight:** "Most AI features are solutions looking for problems. Validate the problem before modeling costs."
**Industry benchmark:** AI costs should be <15% of revenue (sustainable), <20% (viable), >30% (unsustainable)
