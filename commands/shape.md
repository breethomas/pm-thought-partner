---
description: Shape work using Shape Up methodology - walk through the 4-step process to create pitches ready for betting.
---

# Shape Command

**Shape work** using the Shape Up methodology (Ryan Singer, Basecamp).

Walk through the 4-step shaping process:
1. Set boundaries (appetite + problem)
2. Find the elements (breadboard/sketch)
3. Address risks (rabbit holes)
4. Write the pitch (5 ingredients)

**Works with:**
- **Linear MCP** - Create issues from pitches, fetch existing work
- **Manual** - Describe what you're shaping

## Usage

```
/shape                     # Start shaping workflow
/shape "feature idea"      # Start with context
/shape --review            # Review an existing pitch
/shape --established       # Established product mode (full rigor)
/shape --new-product       # New product mode (looser constraints)
```

## What It Does

Guides you through shaping work at the right level of abstraction:
- **Rough** - Leaves room for team creativity
- **Solved** - Main elements connected
- **Bounded** - Explicit appetite and no-gos

**Output:** A pitch with 5 ingredients ready for the betting table.

| Flow | Use When | Output |
|------|----------|--------|
| **Shape new work** | Starting from raw idea or problem | Pitch document |
| **Review pitch** | Have a pitch, want feedback | Review + improvements |
| **Quick pitch** | Know what you want, skip coaching | Pitch document |

## Product Modes

Shape Up adapts based on product maturity:

**Established product:**
- Fixed time, variable scope (full rigor)
- Strict appetites (1-2 weeks or 6 weeks)
- Circuit breaker applies
- Output ready for betting table

**New product / exploration:**
- Looser constraints, faster iteration
- Flexible appetite
- Goal: validate direction, not ship yet
- Pitch as working document

## Instructions

**IMPORTANT:** Invoke the `shape-up` skill to access the full shaping workflow.

The skill contains:
- Product mode check (established vs new product)
- Step 1: Set Boundaries (appetite, problem definition)
- Step 2: Find the Elements (breadboarding, fat marker sketches)
- Step 3: Address Risks (rabbit holes, no-gos, de-risking)
- Step 4: Write the Pitch (5 ingredients)
- Pitch review flow

**Workflow:**
1. Determine product mode (established vs new product)
2. Ask about appetite first (how much time is this worth?)
3. Dig into the specific problem (not surface-level requests)
4. Guide through solution sketching (breadboard or fat marker)
5. Walk through de-risking (find rabbit holes, patch or cut)
6. Compile pitch with all 5 ingredients
7. Offer to create in Linear or export

**Core principles:**
- Appetite drives scope, not the reverse
- Shaped work is rough but solved
- No-gos must be explicit
- If it can't ship in the appetite, reshape or cut

**Challenge weak shaping:**
- "Customers want X" → "What's the specific friction?"
- "Team will figure it out" → "What specifically?"
- No no-gos → "What are you explicitly NOT building?"

---

**Framework:** Shape Up by Ryan Singer (Basecamp)
**Best for:** Cycle planning, pitch writing, coaching PMs on shaping
**Related:** `/spec --pitch` for quick pitch format only
