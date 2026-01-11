---
description: Write specs at the right depth - from quick issues to full AI feature specs. Progressive disclosure based on what you're building.
---

# Spec Command

Write **specifications** at the right depth for any project.

**Works with:**
- **Linear MCP** - Pull issue details, create issues/projects
- **Manual** - Describe what you're building

## Usage

```
/spec                     # Start fresh, choose level
/spec --quick             # Quick task (Linear issue)
/spec --feature           # Feature (Lite PRD)
/spec --ai                # AI feature (full spec)
/spec --pitch             # Shape Up pitch format
/spec LIN-123             # Start from Linear issue
```

## What It Does

Routes you to the right spec depth:

| Level | Use When | Output |
|-------|----------|--------|
| **Quick task** | Hours to days, clear scope | Linear issue |
| **Feature** | 1-3 weeks, needs alignment | Lite PRD |
| **AI feature** | Any AI/ML/LLM work | Full spec with context requirements |
| **Pitch** | Shape Up workflow | 5-ingredient pitch |

**Philosophy:** Write what's needed. Skip what's not.

## Instructions

**IMPORTANT:** Invoke the `spec` skill to access the full progressive disclosure framework.

The skill contains:
- Level 1: Quick task flow (uses `templates/linear-issue.md`)
- Level 2: Feature flow (uses `templates/lite-prd.md`)
- Level 3: AI feature flow (uses `templates/ai-product-spec.md` + context requirements)
- Level 4: Deep dive expansions (`--deep context`, `--deep examples`, `--deep rollout`, `--deep full-prd`)

**Workflow:**
1. If no level specified, ask what they're building and route appropriately
2. If Linear issue ID provided, fetch and pre-populate
3. Walk through the appropriate level's questions
4. Generate spec output
5. Offer to create in Linear or export

**Core principles:**
- Short specs get read, long specs get skipped
- Prototype > documentation
- Make decisions, not descriptions
- Evals are non-negotiable (for AI features)

---

**Frameworks:** Linear Method, Aakash Gupta (PRD/AI Spec), 4D Context Canvas, Shape Up (Ryan Singer)
**Best for:** Any spec work - from quick tasks to complex AI features
**Related:** `/shape` for full Shape Up shaping workflow (coaching through all 4 steps)
