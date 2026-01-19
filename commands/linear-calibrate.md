---
description: /linear-calibrate - Analyze Linear workspace health with explicit thresholds
---

# Linear Workspace Calibration

Analyze your Linear workspace against methodology best practices. Produces a structured health report with explicit pass/fail thresholds.

## Prerequisites

- Linear MCP must be configured
- Run this from any directory with Linear access

## Usage

```
/linear-calibrate
```

## What Happens

1. Invokes the **linear-workspace-analyzer** agent
2. Agent fetches teams, projects, labels, and issue samples from Linear
3. Applies thresholds based on Linear Method (linear.app/method)
4. Generates structured health report with ratings

## Output

The agent produces a comprehensive report including:

- **Health Indicators**: Team count, team sizes, stale teams, project health, backlog staleness, label hygiene, issue quality
- **Issue Quality Trend**: Time-bucketed analysis showing if quality is improving or declining
- **Red Flags**: Every dimension rated yellow or red with actionable "Ask Claude" prompts
- **Recommendations**: Immediate, near-term, and maintenance actions

## After the Report

Explore further with:

1. **Deep-dive on a specific red flag** - Ask about any flagged dimension
2. **Run /project-health [name]** - Check individual project health
3. **Run /issue-audit [team]** - Understand how a team organizes work
4. **See team details** - Identify consolidation candidates

## Relationship to Other Commands

```
/linear-calibrate        → Workspace-level health (30,000 ft view)
         ↓
    ┌────┴────┐
    ↓         ↓
/project-health       /issue-audit
[project]             [team]
(execution health)    (organization patterns)
```

## Thresholds Reference

Based on Linear Method best practices:

| Dimension | Green | Yellow | Red |
|-----------|-------|--------|-----|
| Team Count | 4-15 | 16-30 | 31+ |
| Team Sizes | 4+ avg | 2-3 avg | 0-1 avg |
| Stale Teams | <10% | 10-25% | >25% |
| Project Count | 1-50 | 51-150 | 151+ |
| Project Ownership | <10% missing | 10-30% missing | >30% missing |
| Project Dates | <20% missing | 20-50% missing | >50% missing |
| Backlog Staleness | <20% | 20-40% | >40% |
| Label Count | 10-25 | 26-50 | 51+ |
| Issue Quality | <10% issues | 10-25% issues | >25% issues |

---

*Part of PM Thought Partner Linear analysis suite*
