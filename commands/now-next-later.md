---
description: Generate a Now-Next-Later roadmap using Janna Bastow's framework
---

# Now-Next-Later Roadmap Command

Create a **Now-Next-Later roadmap** using Janna Bastow's framework.

**Works with:**
- **Linear** - Full integration via Linear MCP
- **GitHub** - Full integration via GitHub MCP
- **Manual** - Works without any MCP configuration

## What This Does

Transforms your projects into a roadmap that communicates **sequence and certainty** without false dates.

## Usage

```
/now-next-later
```

**Optional parameters:**
- `/now-next-later --team [team-name]` - Roadmap for specific team
- `/now-next-later --export` - Generate markdown/mermaid diagram
- `/now-next-later --update-linear` - Create Linear projects for Now/Next/Later

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
