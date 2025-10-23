---
name: four-risks
description: Run Marty Cagan's Four Risks assessment on a Linear issue (value, usability, feasibility, viability)
---

# Four Risks Assessment Command

Apply **Marty Cagan's Four Risks Framework** to assess a Linear issue before building.

## What This Does

Evaluates a feature/project against the four critical risks:
- **Value:** Will customers use/buy this?
- **Usability:** Can users figure it out?
- **Feasibility:** Can we build it?
- **Viability:** Does it work for our business?

## Usage

```
/four-risks [issue-id]
```

**Examples:**
- `/four-risks ENG-245` - Assess specific issue
- `/four-risks --current-sprint` - Assess all current sprint issues
- `/four-risks --add-comment` - Add assessment as Linear comment

## What Happens

1. **Fetches Linear issue** details via MCP
2. **Applies Four Risks framework:**
   - Analyzes issue description
   - Asks clarifying questions if needed
   - Assesses each risk dimension
3. **Returns risk assessment** with:
   - Risk level for each dimension (High/Medium/Low)
   - Key questions to de-risk
   - Recommended discovery activities
4. **Optionally adds comment** to Linear issue with assessment

## Example Output

```
🎯 Four Risks Assessment: [ENG-245] AI-powered email composer

📊 RISK SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1️⃣ VALUE RISK: 🔴 HIGH
   Will customers use/buy this?

   ⚠️  Concerns:
   - No customer interviews validating demand
   - Competitive AI email tools exist (Grammarly, Jasper)
   - Unclear differentiation

   ✅ To de-risk:
   - Run 10 customer interviews about email pain points
   - Test prototype with 5 users
   - Validate willingness to pay

2️⃣ USABILITY RISK: 🟡 MEDIUM
   Can users figure it out?

   ⚠️  Concerns:
   - AI output needs review UX
   - Tone/voice customization complexity

   ✅ To de-risk:
   - Create clickable prototype
   - Run usability tests with 5 users
   - Test with non-technical users

3️⃣ FEASIBILITY RISK: 🟢 LOW
   Can we build it?

   ✅ Confidence:
   - Team has AI integration experience
   - OpenAI API well-documented
   - Spike completed successfully

   ⚠️ Minor concerns:
   - Inference costs at scale (needs modeling)

4️⃣ VIABILITY RISK: 🟡 MEDIUM
   Does it work for our business?

   ⚠️  Concerns:
   - Unit economics unclear (AI costs)
   - Legal review needed for AI-generated content
   - Competitive differentiation weak

   ✅ To de-risk:
   - Model costs at 10K, 100K, 1M emails/month
   - Legal review of AI content liability
   - Define unique value prop

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎯 RECOMMENDATION: DO NOT BUILD YET

Highest risk: VALUE (customers may not want/pay for this)

📋 Discovery Plan:
Week 1: Customer interviews (10 users)
Week 2: Build throwaway prototype
Week 3: Usability testing (5 users)
Week 4: Unit economics modeling

Only proceed if:
✓ 60%+ of interviews validate strong need
✓ Prototype test shows clear value
✓ Unit economics support freemium model
```

## Requirements

- ✅ PM Thought Partner plugin installed
- ✅ Linear MCP server configured
- ✅ Access to issue details

## Without Linear MCP

You can still use the framework manually:

```
Run a four risks assessment on this feature: [describe feature]
```

## Learn More

See the full Four Risks framework at:
`frameworks/discovery/four-risks.md`

---

**Framework:** Marty Cagan (SVPG)
**Best for:** Pre-build validation, discovery planning, reducing waste
**AI-era adaptation:** Prototype to test risks in hours, not weeks
