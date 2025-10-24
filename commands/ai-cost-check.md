---
description: Calculate AI feature costs at scale to validate economic viability
---

# AI Cost Check Command

Calculate the **true cost of your AI feature at scale** to validate economic viability.

**Works with:**
- **Linear MCP / GitHub MCP** - Optional: Can attach cost analysis to an issue as comment
- **Manual** - Describe your AI feature directly (recommended for detailed analysis)

## What This Does

Prevents expensive surprises by modeling AI costs BEFORE launch:
- Cost per request
- Cost per user per month at different scales
- Percentage of revenue consumed by AI
- Cost optimization opportunities

**Philosophy:** "AI products have marginal costs. Inference scales with usage." Unlike traditional SaaS (fixed infrastructure), every user interaction costs money.

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

1. **Understands your AI feature:**
   - What model are you using? (GPT-4, Claude, custom)
   - How many API calls per user action?
   - Input/output token estimates
   - Additional costs (embeddings, vector DB, etc.)

2. **Calculates costs at scale:**
   - Per request
   - Per user per day/month
   - At 100 users, 1K, 10K, 100K users
   - Annual run rate at each scale

3. **Compares to revenue:**
   - % of revenue consumed by AI
   - Break-even analysis
   - Sustainability assessment

4. **Identifies optimization opportunities:**
   - Caching potential
   - Cheaper models for simple queries
   - Batch processing opportunities
   - Prompt length reduction

5. **Returns detailed breakdown** with warnings if unsustainable

## Example Output

```
💰 AI Cost Check: Product Recommendations

FEATURE DETAILS:
- Model: GPT-4 Turbo
- Use case: Generate personalized product recommendations
- Calls per recommendation: 1 (no chaining)
- Average input: 1,500 tokens (user profile + product catalog context)
- Average output: 300 tokens (5 recommendations with reasoning)

---

📊 COST BREAKDOWN (Per Request)

Input Tokens:  1,500 @ $0.01/1K  = $0.015
Output Tokens:   300 @ $0.03/1K  = $0.009
Total per request:               = $0.024

Additional costs:
- Embeddings (if using RAG): $0.0001 per request
- Vector DB query: ~$0.00005 per request
- Total system cost: $0.024 per recommendation

---

📈 COST AT SCALE

Assumptions:
- Average user requests 3 recommendations per day
- 30 days per month
- $0.024 per recommendation

| Users | Requests/Month | Monthly Cost | Annual Cost |
|-------|----------------|--------------|-------------|
| 100   | 9,000          | $216         | $2,592      |
| 1,000 | 90,000         | $2,160       | $25,920     |
| 10,000| 900,000        | $21,600      | $259,200    |
| 100,000| 9,000,000     | $216,000     | $2,592,000  |

---

⚠️ VIABILITY ANALYSIS

Your pricing: $20/user/month

| Scale   | Revenue/Month | AI Cost/Month | AI % of Revenue |
|---------|---------------|---------------|-----------------|
| 100     | $2,000        | $216          | 10.8% ✅        |
| 1,000   | $20,000       | $2,160        | 10.8% ✅        |
| 10,000  | $200,000      | $21,600       | 10.8% ✅        |
| 100,000 | $2,000,000    | $216,000      | 10.8% ✅        |

✅ SUSTAINABLE: 10.8% of revenue at all scales
   (Industry benchmark: AI costs should be <20% of revenue)

However, note:
- This assumes 3 recommendations/user/day
- If usage is 10x higher (30/day), costs become 108% of revenue ⚠️
- Monitor actual usage patterns closely

---

💡 COST OPTIMIZATION OPPORTUNITIES

1. **Caching** (Potential savings: 40-60%)
   - Cache frequent queries (e.g., "laptop under $500")
   - Reuse recommendations for similar user profiles
   - Estimated savings: $8,640/month at 10K users

2. **Model Selection** (Potential savings: 70%)
   - Use GPT-3.5 for simple recommendations: $0.007/request (vs $0.024)
   - Use GPT-4 only for complex/personalized requests
   - Estimated savings: $15,120/month at 10K users

3. **Prompt Optimization** (Potential savings: 20-30%)
   - Reduce input tokens (1,500 → 1,000 with better context selection)
   - Use shorter examples in prompt
   - Estimated savings: $4,320/month at 10K users

4. **Batch Processing** (Potential savings: 15-25%)
   - Pre-generate recommendations for common queries
   - Refresh daily instead of real-time
   - Estimated savings: $3,240/month at 10K users

TOTAL POTENTIAL SAVINGS: $31,320/month at 10K users (145% of current cost)
Optimized cost: $13,608/month (6.8% of revenue)

---

🎯 RECOMMENDATIONS

✅ CURRENT STATE:
- Costs are sustainable at 10.8% of revenue
- Within industry benchmarks (<20%)

⚠️ WATCH OUT FOR:
- Usage spikes (what if users request 10x more recommendations?)
- Feature creep (adding AI to more features multiplies costs)
- Model price changes (API pricing can change)

📋 ACTION ITEMS:

Priority 1 (Do Before Launch):
1. Implement basic caching for repeat queries
2. Set up cost monitoring alerts (warn if >15% of revenue)
3. Define usage limits per user (prevent abuse)

Priority 2 (First Month):
4. Test GPT-3.5 for simple recommendations (A/B test quality vs cost)
5. Optimize prompt length (reduce input tokens by 30%)
6. Monitor actual usage patterns vs assumptions

Priority 3 (When Scaling):
7. Consider fine-tuned smaller model (if cost becomes issue)
8. Implement tiered pricing based on AI usage

---

📊 COMPARISON: Different Models

| Model | Cost/Request | Cost at 10K users/mo | Quality | Recommendation |
|-------|--------------|----------------------|---------|----------------|
| GPT-4 Turbo | $0.024 | $21,600 | Excellent | ✅ Current choice |
| GPT-3.5 Turbo | $0.007 | $6,300 | Good | 💡 Test for simple cases |
| Claude 3 Haiku | $0.006 | $5,400 | Good | 💡 Alternative option |
| Claude 3 Sonnet | $0.018 | $16,200 | Excellent | 💡 Slightly cheaper |

Recommendation: Start with GPT-4 for quality. Test GPT-3.5 for 50% of requests (simple queries). Could save $7,650/month.

---

🚨 RED FLAGS (None detected)

✅ Cost per user ($2.16/month) is <15% of revenue ($20/month)
✅ Costs scale linearly (no exponential blow-up)
✅ Multiple optimization levers available
✅ Business model can support AI costs

If any were true, would flag:
❌ AI costs >30% of revenue (unsustainable)
❌ No optimization opportunities (trapped at high cost)
❌ Costs grow faster than revenue (broken economics)
❌ Single point of failure (one model, no alternatives)
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
**Best for:** Economic validation of AI features
**Key insight:** "AI products have marginal costs. Model at 10x, 100x scale BEFORE launch."
**Industry benchmark:** AI costs should be <20% of revenue per user
**Remember:** Optimization can reduce costs by 50-70%. Don't abandon features prematurely—explore optimization first.
