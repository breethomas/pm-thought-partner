---
description: Apply Aakash Gupta's LNO framework to categorize issues by impact (Leverage, Neutral, Overhead)
---

# LNO Prioritize Command

Apply the **LNO Prioritization Framework** (Aakash Gupta) to categorize your issues by impact level.

**Works with:**
- **Linear MCP** - Analyzes your issues and auto-labels by priority (L/N/O)
- **GitHub MCP** - Analyzes your issues and auto-labels by priority (L/N/O)
- **Manual** - Paste your issues if no MCP configured

## What This Does

Analyzes your issues and categorizes them as:
- **Leverage (L):** 10x impact tasks - your highest priority strategic work
- **Neutral (N):** Regular impact tasks - important but not transformational
- **Overhead (O):** Minimal impact tasks - necessary evils to minimize

## Usage

```
/lno-prioritize
```

**Optional parameters:**
- `/lno-prioritize --team [team-name]` - Categorize specific team's issues
- `/lno-prioritize --project [project-name]` - Categorize specific project
- `/lno-prioritize --label` - Auto-add Linear labels (leverage/neutral/overhead)
- `/lno-prioritize --current-sprint` - Only analyze current sprint issues

## What Happens

1. **Fetches issues** from Linear or GitHub (if MCPs configured)
2. **Applies LNO framework** from PM Thought Partner skill
3. **Categorizes each issue** based on:
   - Strategic importance
   - Impact potential
   - Time investment required
   - Compounding value
4. **Returns analysis** with:
   - Issue title and ID
   - LNO category assignment
   - Reasoning for categorization
   - Recommended time allocation
5. **Optionally updates source** with labels (if `--label` flag used and using Linear)

## Example Output

```
📊 LNO Prioritization Results

🚀 LEVERAGE (10x impact - be a perfectionist):
- [ENG-245] Rebuild recommendation engine
  Reason: Core product differentiator, compounds over time

- [ENG-198] Product strategy for Q2
  Reason: Foundational decision affecting all downstream work

📈 NEUTRAL (Regular impact - do good enough work):
- [ENG-301] Update onboarding flow copy
  Reason: Important but not transformational

- [ENG-276] Add analytics to checkout page
  Reason: Useful data but incremental improvement

⚙️ OVERHEAD (Minimal impact - do quickly):
- [ENG-312] Reformat PRD template
  Reason: Administrative work, no strategic value

- [ENG-288] Update Linear labels
  Reason: Organizational cleanup

💡 Recommendations:
- Spend 60% of PM time on Leverage tasks
- Spend 30% on Neutral tasks (aim for C+/B- quality)
- Minimize Overhead to 10% (automate or delegate where possible)
```

## Requirements

- ✅ PM Thought Partner plugin installed
- ✅ **Optional:** Linear MCP or GitHub MCP for automatic issue fetching ([setup guide](../INSTALL_PLUGIN.md#connect-your-issue-tracker))
- ✅ **Manual mode:** Works without MCP - paste your issue list

## Integration Options

**With Linear MCP:**
Automatically fetches Linear issues and can add L/N/O labels.

**With GitHub MCP:**
Automatically fetches GitHub issues and can add labels.

**Manual mode:**
Paste your issues and the command will categorize them:
```
Apply the LNO framework to these issues: [paste issue list]
```

## Learn More

See the full LNO Prioritization framework at:
`frameworks/planning/lno-prioritization.md`

---

**Framework:** Aakash Gupta (based on Shreyas Doshi)
**Best for:** Sprint planning, backlog grooming, time management
**AI-era adaptation:** Focus on leverage work (vision, strategy) while AI handles neutral/overhead tasks
