---
description: Plan the v1→v2→v3 agency progression for an AI feature - map how autonomy increases over time.
---

# Agency Ladder Command

**Plan the agency ladder** for an AI feature using CC/CD principles.

AI products earn autonomy. This command helps you map the v1→v2→v3 progression before building.

**Works with:**
- **Any AI feature** - Planning new or reviewing existing
- **Stakeholder conversations** - Export for alignment discussions
- **Spec integration** - Complements `/spec --ai`

## Usage

```
/agency-ladder                    # Start planning workflow
/agency-ladder "feature name"     # Start with context
/agency-ladder --review           # Map existing feature's current level
/agency-ladder --promote          # Check if ready for next agency level
/agency-ladder --export           # Generate artifact for stakeholder discussion
```

## What It Does

Guides you through defining how autonomy increases:
- **V1:** AI suggests, human decides
- **V2:** AI handles routine, escalates edge cases
- **V3:** AI acts autonomously, human spot-checks

**Output:** Flywheel table showing what you're testing at each level and what feeds the next loop.

| Flow | Use When | Output |
|------|----------|--------|
| **Plan new feature** | Starting from scratch | Ladder + promotion criteria |
| **Review existing** | Feature already in prod | Current level map + gaps |
| **Promotion check** | Considering agency increase | Readiness assessment |
| **Export for discussion** | Need stakeholder alignment | Formatted artifact |

## Instructions

**IMPORTANT:** Invoke the `agency-ladder` skill to access the full workflow.

The skill contains:
- Flow 1: Plan new feature (full ladder from scratch)
- Flow 2: Review existing feature (map current state)
- Flow 3: Promotion check (criteria for V(n)→V(n+1))
- Flow 4: Export for stakeholder discussion

**Workflow:**
1. Understand the AI feature context
2. Define V1 (minimum agency that tests the hypothesis)
3. Map V2 and V3 progression
4. Identify what you're testing and learning at each level
5. Define promotion criteria
6. Generate flywheel table output

**Core principles:**
- Start with low agency, earn autonomy
- Each version tests a specific hypothesis
- Promotion requires proven reliability
- Control handoffs must be designed, not assumed

**Challenge weak ladders:**
- "Let's just ship V3" → "What happens when it fails?"
- "Users will trust it" → "How do you know?"
- "We'll figure out V2 later" → "What must V1 prove?"

---

**Framework:** CC/CD (Continuous Calibration/Continuous Development)
**Source:** Aishwarya Naresh Reganti & Kiriti Badam
**Best for:** AI feature planning, stakeholder alignment, spec augmentation
**Related:** `/spec --ai`, `/calibrate`
