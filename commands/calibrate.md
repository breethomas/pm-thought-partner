---
description: Post-launch AI feature calibration - document error patterns, review evals, and decide on agency promotion.
---

# Calibrate Command

**Post-launch calibration** for AI features using CC/CD principles.

Calibration happens after launch, not before. Use this command to document error patterns, review eval performance, and decide whether to increase agency.

**Works with:**
- **Any live AI feature** - Post-launch analysis
- **Eval review** - Are evals catching real issues?
- **Agency promotion** - Is the feature ready for more autonomy?

## Usage

```
/calibrate                        # Start calibration workflow
/calibrate "feature name"         # Start with context
/calibrate --errors               # Document error patterns
/calibrate --evals                # Review eval performance
/calibrate --promote              # Agency promotion decision
/calibrate --quick                # Quick health check
```

## What It Does

Guides you through post-launch calibration:
- **Document error patterns** - Analyze failures, categorize, plan fixes
- **Review eval performance** - Are evals catching real issues?
- **Agency promotion check** - Ready for more autonomy?
- **Quick health check** - Is the system behaving as expected?

| Flow | Use When | Output |
|------|----------|--------|
| **Error patterns** | Seeing failures in prod | Error pattern table + fix priorities |
| **Eval review** | Evals might be stale | Assessment + recommended additions |
| **Agency promotion** | Considering V(n)→V(n+1) | Promotion readiness verdict |
| **Quick check** | Routine calibration | Health status + alerts |

## Instructions

**IMPORTANT:** Invoke the `calibrate` skill to access the full workflow.

The skill contains:
- Flow 1: Error pattern documentation
- Flow 2: Eval performance review
- Flow 3: Agency promotion decision
- Flow 4: Quick calibration check

**Workflow:**
1. Understand current feature state and recent performance
2. Route to appropriate calibration flow
3. Generate actionable output
4. Recommend next steps

**Core principles:**
- Calibration is continuous, not one-time
- Error patterns are the richest signal for improvement
- User corrections show where the AI fails
- Evals must evolve with the product

**Challenge complacency:**
- "Quality looks fine" → "What's your correction rate?"
- "No complaints" → "Are users actually using it?"
- "Ready to promote" → "Show me the data"

---

**Framework:** CC/CD (Continuous Calibration/Continuous Development)
**Source:** Aishwarya Naresh Reganti & Kiriti Badam
**Best for:** Post-launch analysis, quality monitoring, agency decisions
**Related:** `/agency-ladder`, `/ai-health-check`, `/start-evals`
