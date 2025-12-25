---
description: /project-health [project-name] - Deep-dive health check on a single Linear project
---

# Project Health Check

Analyze a single Linear project against execution best practices. Produces a health assessment: On Track / At Risk / Stalled.

## Prerequisites

- Linear MCP must be configured
- Run `/linear-calibrate` first to identify projects worth investigating

## Usage

```
/project-health [project-name]
```

Examples:
- `/project-health AI Video`
- `/project-health "HBN for Agent Customers"`

## Instructions

### Step 1: Find the Project

```
get_project(query: "[project-name]")
```

If not found, list similar projects and ask user to clarify.

If project status is **Canceled**, stop and report:
```
Project "[name]" has been canceled. Canceled projects are excluded from health checks.

If you'd like to understand why it was canceled or review its history, I can help with that instead.
```

### Step 2: Fetch Project Issues

```
list_issues(project: "[project-name]", limit: 150)
```

Collect:
- Total issue count
- Issues by state (Done, In Progress, To Do, etc.)
- Blocked issues (state contains "blocked" or has blocking relations)
- Unique teams represented
- Most recent `updatedAt` timestamp

### Step 3: Apply Thresholds

**CRITICAL: Use these EXACT thresholds. Display threshold values in the report.**

**Status-based adjustments:** Some thresholds change based on project status.

#### 1. Ownership
| Status | Rating |
|--------|--------|
| Lead assigned | 🟢 |
| No lead | 🔴 |

#### 2. Timeline

**For In Progress / Paused / Shaping / Ready for Kickoff:**
| Condition | Rating |
|-----------|--------|
| Has start + target date, not overdue | 🟢 |
| Has dates but overdue | 🟡 |
| Missing start OR target date | 🟡 |
| Missing both dates | 🔴 |

**For Done / Completed:** Skip this check (timeline already resolved)

**For Drafting:**
| Condition | Rating |
|-----------|--------|
| Has target date | 🟢 |
| No target date | 🟡 |

*(Drafting projects are expected to be planning; missing dates is less severe)*

#### 3. Progress

Calculate: `completion_pct = done_issues / total_issues * 100`

**For In Progress:**
| Condition | Rating |
|-----------|--------|
| Activity in last 7 days AND >10% complete | 🟢 |
| Activity in last 14 days OR >5% complete | 🟡 |
| No activity 14+ days AND <5% complete | 🔴 |

**For Drafting:** Skip progress check (not expected to have started)

**For Done / Completed:** Always 🟢 (work is finished)

**For Paused:**
| Condition | Rating |
|-----------|--------|
| Was >25% complete when paused | 🟢 |
| Was <25% complete when paused | 🟡 |

#### 4. Scope Clarity

Measure description character count.

| Description Length | Rating |
|--------------------|--------|
| >300 characters | 🟢 |
| 50-300 characters | 🟡 |
| <50 characters or empty | 🔴 |

#### 5. Issue Distribution

| Issue Count | Rating |
|-------------|--------|
| 5-100 issues | 🟢 |
| 1-4 issues OR 101-150 issues | 🟡 |
| 0 issues OR 150+ issues | 🔴 |

**Exception:** For Drafting status, 0 issues = 🟡 (not 🔴)

#### 6. Blockers

Calculate: `blocked_pct = blocked_issues / open_issues * 100`

| Percentage Blocked | Rating |
|--------------------|--------|
| <5% of open issues | 🟢 |
| 5-15% | 🟡 |
| >15% | 🔴 |

If 0 open issues, skip this check (🟢).

#### 7. Staleness

Measure days since most recent issue activity in the project.

**For In Progress:**
| Last Activity | Rating |
|---------------|--------|
| Within 7 days | 🟢 |
| 8-30 days | 🟡 |
| 31+ days | 🔴 |

**For Drafting / Paused:**
| Last Activity | Rating |
|---------------|--------|
| Within 14 days | 🟢 |
| 15-45 days | 🟡 |
| 46+ days | 🔴 |

**For Done / Completed:** Skip staleness check (finished projects naturally go quiet)

### Step 4: Calculate Overall Rating

| Condition | Overall Status |
|-----------|----------------|
| Any 🔴 | **Stalled** |
| 2+ 🟡 (no 🔴) | **At Risk** |
| 0-1 🟡 | **On Track** |

### Step 5: Output Report

**USE THIS EXACT FORMAT:**

```markdown
# Project Health Report: [Project Name]

**Status:** [Linear project status]
**Lead:** [name or "None assigned"]
**Dates:** [start] → [target] (or "Not set")
**Last Activity:** [date] ([N] days ago)

---

## Health Assessment: [On Track / At Risk / Stalled] [emoji]

| Dimension | Value | Threshold | Rating |
|-----------|-------|-----------|--------|
| Ownership | [Lead name or "None"] | Lead assigned 🟢 / None 🔴 | 🟢/🔴 |
| Timeline | [status] | Has dates 🟢 / Missing 🟡 / Both missing 🔴 | 🟢/🟡/🔴 |
| Progress | [N]% complete ([X] of [Y]) | >10% + recent 🟢 / >5% 🟡 / <5% stale 🔴 | 🟢/🟡/🔴 |
| Scope Clarity | [N] chars | >300 🟢 / 50-300 🟡 / <50 🔴 | 🟢/🟡/🔴 |
| Issue Distribution | [N] issues | 5-100 🟢 / 1-4 or 101-150 🟡 / 0 or 150+ 🔴 | 🟢/🟡/🔴 |
| Blockers | [N]% ([X] of [Y] open) | <5% 🟢 / 5-15% 🟡 / >15% 🔴 | 🟢/🟡/🔴 |
| Staleness | [N] days | <7d 🟢 / 8-30d 🟡 / 31d+ 🔴 | 🟢/🟡/🔴 |

**Summary:** [1-2 sentence assessment of project health]

---

## Issues at a Glance

| State | Count | % |
|-------|-------|---|
| Done | [N] | [X]% |
| In Progress | [N] | [X]% |
| To Do / Backlog | [N] | [X]% |
| Blocked | [N] | [X]% |

**Total:** [N] issues

---

## Red Flags

[List any dimensions rated 🔴 or 🟡 with specific context]

**FORMATTING: Do NOT number the "Ask Claude:" sections - they are sub-sections under each red flag.**

1. **[Dimension]** (🔴/🟡): [Specific problem]

   **Ask Claude:**
   - "[Actionable follow-up prompt]"
   - "[Another follow-up prompt]"

(Continue for all red flags. If none: "No red flags. This project is healthy.")

---

## Recommendations

### Immediate
[1-2 specific actions for any 🔴 items]

### This Week
[1-2 specific actions for any 🟡 items]

---

*Generated by PM Thought Partner /project-health*
```

### Step 6: Offer Next Steps

After the report, ask:
```
What would you like to do?
1. Fix a specific red flag (I can help update the project)
2. See the blocked issues in detail
3. Review issues missing descriptions
4. Run /project-health on another project
5. Export this report
```

## Edge Cases

### Project Not Found
```
I couldn't find a project named "[name]".

Did you mean one of these?
- [similar project 1]
- [similar project 2]

Or you can run `/linear-calibrate` to see all projects.
```

### Very Large Project (150+ issues)
```
⚠️ This project has [N] issues (fetched first 150 for analysis).

Large projects often indicate scope creep. Consider:
- Breaking into sub-projects
- Archiving completed phases
- Moving backlog items to a separate "future" project
```

### Drafting Project with No Issues
This is normal and expected. Rate Issue Distribution as 🟡 (not 🔴) and note:
```
This project is in Drafting status with no issues yet - this is expected during planning.
Focus on getting the description and dates set before adding issues.
```

### Done Project
Skip Staleness and Timeline checks. Focus on:
- Was it completed on time? (compare target vs completion date if available)
- Final issue count (was scope reasonable?)
- Any issues left incomplete?

## Relationship to Other Commands

```
/linear-calibrate        → Workspace-level (flags "497 projects, 86% missing dates")
         ↓
/project-health [name]   → THIS COMMAND - deep-dive on flagged projects
         ↓
/team-health [name]      → Team workflow analysis (coming soon)
```

---

*Part of PM Thought Partner Linear analysis suite*
