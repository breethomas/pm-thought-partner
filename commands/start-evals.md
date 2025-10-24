---
description: Start AI evals without overengineering - create your first 20 test cases in a spreadsheet
---

# Start Evals Command

Launch your AI evaluation process using the **PM-Friendly Evals approach** (Aman Khan + Hamel Husain).

**Works with:**
- **Linear MCP / GitHub MCP** - Optional: Can create eval project with test case issues
- **Manual** - Generate test cases as markdown/spreadsheet (recommended for quick start)

## What This Does

Helps PMs start testing AI quality **without overengineering**. Generates your first 20 test cases and sets up a lightweight eval process.

**Philosophy:** Start with 20 test cases in a spreadsheet. Scale when ready. Error analysis > automation.

## Usage

```
/start-evals [feature-name]
```

**Examples:**
- `/start-evals "AI product recommendations"` - Generate test cases for recommendation feature
- `/start-evals --create-project` - Create Linear project for eval tracking
- `/start-evals --interactive` - Step-by-step wizard
- `/start-evals "customer support AI" --count 50` - Generate 50 test cases instead of 20

## What Happens

1. **Understands your AI feature**
   - What does it do?
   - Who uses it?
   - What's the critical user flow?

2. **Generates 20 starter test cases** including:
   - 15 happy path cases (should work)
   - 5 edge cases (might be tricky)
   - Expected outputs for each
   - Pass/fail criteria

3. **Creates tracking structure:**
   - Spreadsheet template (Google Sheets/Excel format)
   - Or Linear project with test case issues (if Linear configured)
   - Or markdown checklist

4. **Provides next steps:**
   - How to run tests manually
   - How to track results
   - When to graduate to "Better" or "Best" approach

## Example Output

```
🧪 AI Evals Starter Kit: Product Recommendations

Your first 20 test cases (Good → Better → Best approach):

📋 HAPPY PATH (15 cases):

1. Input: "Recommend a laptop under $800 for college"
   Expected: Mid-range laptops with student-friendly features, under budget
   Pass criteria: All recommendations < $800, suitable for students

2. Input: "Best phone for photography"
   Expected: High-end phones with excellent cameras (iPhone 15 Pro, Pixel 8 Pro)
   Pass criteria: Focus on camera quality, not price

3. Input: "Gaming desktop under $1500"
   Expected: Gaming PCs with good GPU/CPU, under budget
   Pass criteria: Specs appropriate for gaming, under $1500

[...15 more cases]

🔍 EDGE CASES (5 cases):

16. Input: "Phone for elderly person"
    Expected: Simple, large screen, easy to use (not flagship)
    Pass criteria: Prioritizes simplicity over features

17. Input: "Laptop for both work and gaming"
    Expected: Balance specs (good CPU, decent GPU)
    Pass criteria: Addresses both use cases

[...3 more cases]

📊 TRACKING TEMPLATE:

I've created a spreadsheet template with these columns:
- Test ID
- Input
- Expected Output
- Actual Output (fill after running)
- Pass/Fail
- Notes

[Would you like me to create a Linear project for this? Reply "yes" to create.]

🎯 NEXT STEPS:

Week 1 (2-3 hours):
1. Copy test cases to spreadsheet
2. Run your AI against each input
3. Record actual outputs
4. Mark pass/fail
5. Look for patterns in failures

After 1-2 weeks:
- If passing 80%+ → Add 10 more test cases
- If passing <80% → Fix issues, rerun
- When you have 50-100 cases → Graduate to "Better" approach

See the full guide: frameworks/ai/pm-friendly-evals-guide.md
```

## Interactive Mode

If you run `/start-evals --interactive`, you'll get a guided wizard:

```
🧪 Let's set up your first AI evals!

Question 1: What does your AI feature do? (in one sentence)
> "It generates personalized product recommendations based on user preferences"

Question 2: Who's the primary user?
> "E-commerce shoppers looking for products"

Question 3: What's the ONE critical use case you want to test first?
> "User asks for product recommendation with price constraint"

Question 4: What would be an embarrassing failure?
> "Recommending products way over their budget"

Question 5: How will you judge quality? (accuracy, relevance, tone, safety, etc.)
> "Accuracy (matches requirements), Relevance (appropriate for use case), Budget compliance"

Perfect! Generating your first 20 test cases...
```

## Integration Options

### With Linear (Recommended)

Creates an "AI Evals" project with:
- Test case issues organized by priority
- Labels: "happy-path", "edge-case", "passed", "failed"
- Custom view for tracking pass/fail status
- Comment template for recording results

```
/start-evals "product recommendations" --create-project
```

### With GitHub Issues

Creates issues tagged "eval" with:
- Test case descriptions
- Pass/fail checkboxes
- Labels for organization

### Manual (No integration)

Outputs:
- Markdown checklist
- CSV format for spreadsheet
- Copy/paste into Google Sheets

## Requirements

- ✅ PM Thought Partner plugin installed
- ✅ **Optional:** Linear MCP server for project creation
- ✅ **Optional:** GitHub for issue tracking

## Without Linear/GitHub

**You can still use this command!**

The command will generate:
1. Markdown formatted test cases
2. CSV format for importing to spreadsheet
3. Instructions for manual tracking

```
/start-evals "customer support AI"

[Generates markdown/CSV output you can copy]
```

## Good, Better, Best Progression

### 🟢 Good: Start This Week (You Are Here)
- 20 test cases
- Manual review
- Spreadsheet tracking
- **This is what `/start-evals` gives you**

### 🟡 Better: 1-2 Months In
- 50-100 test cases
- LLM-as-judge for consistency
- Weekly review meetings
- Pass rate tracking over time

When ready, see: `frameworks/ai/pm-friendly-evals-guide.md`

### 🔵 Best: 3+ Months In
- 200+ test cases
- Automated regression testing
- Production monitoring
- CI/CD integration

When ready, see: `frameworks/ai/ai-evals.md`

## Common Questions

**Q: I already have some test cases. Can I expand them?**
A: Yes! Run `/start-evals [feature] --expand` and paste your existing cases. It'll suggest additional coverage.

**Q: 20 seems like too few. Should I start with 100?**
A: No. Start small. 20 cases covering your core use case > 100 cases you never run. Add more as you find issues.

**Q: How long does running 20 tests take?**
A: First time: 30-60 min. After that: 15-20 min per run. That's the point—lightweight enough to actually do.

**Q: What if my AI feature does multiple things?**
A: Pick ONE use case for your first 20 tests. Once that's working, add another use case.

**Q: Do I need special tools?**
A: No. Spreadsheet works great. Graduate to tools when manual process gets painful.

## Learn More

**Full guides:**
- `frameworks/ai/pm-friendly-evals-guide.md` - Complete Good/Better/Best approach
- `frameworks/ai/ai-evals.md` - Comprehensive systematic testing (when ready)
- `frameworks/ai/production-ai-systems.md` - Chip Huyen on monitoring quality

**Real-world example:**
See the PM Sarah case study in pm-friendly-evals-guide.md - Week 1 (20 cases) → Month 4 (200 cases, production monitoring)

---

**Framework:** PM-Friendly Evals (Aman Khan + Hamel Husain)
**Best for:** Starting AI quality testing without overengineering
**Key insight:** "Error analysis is the most important activity. Start with 20 cases in a spreadsheet."
**Next step:** Run the tests. Look at failures. Learn what matters. Scale from there.
