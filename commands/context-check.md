---
description: Fast 5-point context quality check before shipping an AI feature. Catches problems before users do.
---

# Context Check Command

**Quick validation** of context quality before shipping or during review.

5 checks. 5 minutes. Use before launch or during code review.

## Usage

```
/context-check                    # Check a prompt/feature
/context-check --prompt           # Paste a prompt/payload to analyze
/context-check LIN-123            # Check context for Linear issue
```

## The 5 Checks

### 1. RELEVANCE
**Is everything here necessary?**

More context ≠ better. Irrelevant context confuses the model, increases cost, and slows responses.

- Does every piece of context directly contribute to the task?
- Is there anything "kind of related" that could be cut?
- Is there decorative metadata that doesn't help reasoning?

### 2. FRESHNESS
**Is the data current enough?**

Stale context = stale outputs. A model reasoning about yesterday's data will give yesterday's answers.

- Are timestamps recent enough for this task?
- Are metrics, dashboards, logs up to date?
- Could cached data be invalid for this request?

### 3. SUFFICIENCY
**Does the model have enough to reason?**

Missing context forces the model to guess. Guessing = hallucinating.

- Are all required entities present?
- Are dependencies, relationships, history included?
- Could the model answer correctly without guessing?

### 4. STRUCTURE
**Is context organized clearly?**

Dumping raw text forces the model to parse meaning. Structured, labeled sections reduce ambiguity.

- Is context broken into labeled sections?
- Are relationships explicitly described (not implied)?
- Is domain knowledge structured (not prose blobs)?

### 5. CONSTRAINTS
**Are the rules explicit?**

Prompts are suggestions. The model will eventually ignore them. Hard rules must be enforced outside the prompt or stated as non-negotiable.

- Are business rules explicitly stated?
- Are tone, formatting, domain rules included?
- Is permission logic represented accurately?
- Are prohibited actions clearly listed?

## Output

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 CONTEXT QUALITY CHECK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  ┌─────────────┬────────────┐
  │ Check       │ Result     │
  ├─────────────┼────────────┤
  │ Relevance   │ ✓ PASS     │
  │ Freshness   │ ✓ PASS     │
  │ Sufficiency │ ⚠ NEEDS WORK │
  │ Structure   │ ✓ PASS     │
  │ Constraints │ ⚠ NEEDS WORK │
  └─────────────┴────────────┘

  Overall: 3/5 PASSING

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

ISSUES TO FIX:

• Sufficiency: Missing user's role/permissions - model may suggest
  actions user can't take
• Constraints: No explicit list of prohibited topics - model may
  drift into off-topic responses

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

## When to Use

**Before shipping:**
- Final check before launching AI feature
- Part of your pre-launch checklist

**During review:**
- Code review for prompt changes
- Reviewing teammate's context design

**When debugging:**
- Quick check to rule out context issues
- Before diving into full `/ai-debug` audit

## Instructions

**Workflow:**
1. Ask what they're checking (prompt, feature spec, Linear issue)
2. If prompt pasted, analyze directly
3. Walk through each of the 5 checks
4. Score each: PASS / NEEDS WORK / FAIL
5. List specific issues to fix
6. Offer to export or add to Linear

**For each check, ask:**
- "Looking at [check name]... [specific question]"
- Give concrete feedback, not just pass/fail

**Key insight:** All hallucinations are context failures before they're model failures. This checklist catches problems before users do.

---

**Framework:** Context Quality Checklist (4D Context Canvas)
**Best for:** Pre-ship validation, code review, quick context audits
