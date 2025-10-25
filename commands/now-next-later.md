---
description: Generate a Now-Next-Later roadmap using Janna Bastow's framework
---

# Now-Next-Later Roadmap Command

Create a **Now-Next-Later roadmap** using Janna Bastow's framework.

**Works with:**
- **Linear MCP** - Reads your projects and generates roadmap automatically
- **GitHub MCP** - Reads your projects/milestones and generates roadmap automatically
- **Manual** - Describe your projects directly

## What This Does

Transforms your projects into a roadmap that communicates **sequence and certainty** without false dates.

## Usage

```
/now-next-later
```

**Optional parameters:**
- `/now-next-later --team [team-name]` - Roadmap for specific team
- `/now-next-later --export` - Generate markdown/mermaid diagram
- `/now-next-later --send-to-linear` - Create Linear issues from roadmap

## What Happens

1. **Fetches projects** from Linear or GitHub (if MCPs configured)
2. **Applies Janna Bastow's framework:**
   - **NOW:** High certainty, committed work (current sprint/cycle)
   - **NEXT:** Medium certainty, exploring solutions (next 1-2 cycles)
   - **LATER:** Low certainty, ideas and options (future, TBD)
3. **Categorizes projects** based on:
   - Certainty level
   - Dependencies
   - Discovery state
   - Team capacity
4. **Generates roadmap** showing sequence without dates

## Linear Integration

When you use `--send-to-linear`, the command creates Linear issues with clear categorization:

### How Issues Are Categorized

Each issue gets:
- **Title prefix:** `[NOW]`, `[NEXT]`, or `[LATER]` for instant visibility
- **Description:** Includes priority category, rationale, dependencies, and success criteria
- **Priority level:** Set appropriately (1 for NOW, 2 for NEXT, 0 for LATER)

### Finding Your Roadmap Issues in Linear

**Create saved views** to organize roadmap items:

1. **Go to your team's Issues page in Linear**
2. **Click Filters** button
3. **Add filter:** Select **Content** → type `[NOW]` (or `[NEXT]` or `[LATER]`)
4. **Click "Save as View"** - Name it "🎯 NOW Roadmap Items"
5. **Repeat for NEXT and LATER**

**Recommended views:**
- 🎯 **NOW Roadmap Items** - Filter: `Content: [NOW]`
- ➡️ **NEXT Roadmap Items** - Filter: `Content: [NEXT]`
- 🔮 **LATER Roadmap Items** - Filter: `Content: [LATER]`

These views can be **shared with your team** for roadmap visibility.

### Why Title Prefixes?

This approach:
- ✅ Works immediately for any team (no setup required)
- ✅ Doesn't conflict with existing labels or taxonomies
- ✅ Visible at a glance in issue lists
- ✅ Easy to filter and create custom views
- ✅ Works for both new and existing Linear workspaces

### Optional: Use Labels Instead

If you prefer to use Linear labels:
1. Create NOW/NEXT/LATER labels in Linear settings
2. Share the label IDs with Claude during command execution
3. Claude will apply labels and optionally remove title prefixes

## Example Output

```
📅 Now-Next-Later Roadmap

🎯 NOW (High certainty - we're building this)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✓ [PROJ-12] Mobile app redesign
  Status: In progress, 60% complete
  Why Now: User research done, designs validated, eng capacity allocated

✓ [PROJ-18] Payment flow optimization
  Status: Ready to build
  Why Now: Critical for Q1 revenue goal, solution de-risked

➡️ NEXT (Medium certainty - we're exploring)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
○ [PROJ-24] AI recommendation engine
  Status: Discovery phase
  Why Next: Technical feasibility confirmed, need to validate value
  Dependencies: Waiting on data pipeline completion

○ [PROJ-31] Team collaboration features
  Status: Solution being explored
  Why Next: Customer demand validated, choosing between 3 approaches

🔮 LATER (Low certainty - we're considering)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
◌ API v3 rewrite
  Why Later: Need to validate API v2 usage first

◌ Enterprise SSO
  Why Later: Depends on enterprise market traction

◌ Mobile widgets
  Why Later: Interesting idea, needs customer validation

💡 Roadmap Principles:
- NOW = Committed (we're doing this)
- NEXT = Probable (we're likely doing this if discovery goes well)
- LATER = Possible (we might do this, many options)
- No fake dates - communicate sequence and certainty instead
```

## Requirements

- ✅ PM Thought Partner plugin installed
- ✅ **Optional:** Linear MCP or GitHub MCP for automatic project fetching ([setup guide](../INSTALL_PLUGIN.md#connect-your-issue-tracker))
- ✅ **Manual mode:** Works without MCP - describe your projects directly

## Integration Options

**With Linear MCP:**
Automatically fetches Linear projects and roadmap data.

**With GitHub MCP:**
Automatically fetches GitHub Projects and Milestones.

**Manual mode:**
Describe your projects and the command will organize them:
```
Help me organize these projects into a Now-Next-Later roadmap: [paste projects]
```

## Learn More

See the full Now-Next-Later framework at:
`frameworks/planning/now-next-later.md`

---

**Framework:** Janna Bastow (ProdPad, Mind the Product)
**Best for:** Roadmap communication, stakeholder alignment, embracing uncertainty
**AI-era adaptation:** Roadmaps update faster with rapid prototyping - keep them flexible
