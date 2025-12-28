---
description: /linear-calibrate - Analyze Linear workspace health with explicit thresholds
---

# Linear Workspace Calibration

Analyze a Linear workspace against Linear methodology best practices. Produces a structured health report with explicit pass/fail thresholds.

## Prerequisites

- Linear MCP must be configured
- Run this from any directory with Linear access

## Instructions

### Step 1: Fetch Data

Use pagination to get complete data for teams and projects. Use time-bucketed sampling for issues.

#### 1a. Teams (paginated for complete data)
```
cursor = null
all_teams = []
do:
  result = list_teams(limit: 25, after: cursor)
  all_teams.append(result.teams)
  cursor = result.next_cursor
while result.count == 25

Total teams: len(all_teams) (actual - complete data)
```

#### 1b. Projects (one-more-page counting, active only)

**MANDATORY: Always fetch one more page if capped to get accurate count.**

**IMPORTANT: Fetch projects BEFORE other calls (not in parallel) to avoid "Too many subrequests" API errors.**

**IMPORTANT: Exclude Completed and Canceled projects.** These have served their purpose and shouldn't count toward workspace health metrics. Filter by checking `project.state.type` - exclude `completed` and `canceled` types.

**Step 1 - Get sample for analysis:**
```
page1 = list_projects(limit: 250)
all_projects = page1.projects
active_projects = filter(all_projects, state.type NOT IN ["completed", "canceled"])

# Group active projects by state.type for breakdown
by_status = group_by(active_projects, state.type)
# Linear status types (not custom names):
#   backlog - early stage, not yet planned (yellow dotted icons)
#   planned - ready to start (empty circle icons)
#   started - in progress (green partial circle icons)
#   paused  - on hold (orange pause icons)
#   completed - done (green checkmark) - EXCLUDED
#   canceled - won't do (X icon) - EXCLUDED
```

**Step 2 - If capped (count = 250), fetch ONE more page:**
```
if page1.count == 250:
  page2 = list_projects(limit: 250, after: page1.cursor)
  all_projects = page1.projects + page2.projects
  active_projects = filter(all_projects, state.type NOT IN ["completed", "canceled"])

  if page2.count < 250:
    # Page 2 is the last page - we have EXACT count
    total_fetched = 250 + page2.count
    Report: "[active_count] active ([total_fetched] total, excludes completed/canceled)"
  else:
    # Page 2 also capped - estimate range
    Report: "[active_count] active (500+ total, excludes completed/canceled)"
else:
  Report: "[active_count] active ([total] total, excludes completed/canceled)"
```

**Why exclude completed/canceled:** A workspace with 200 projects where 150 are completed is healthy - they shipped. A workspace with 200 *active* projects is concerning. Health metrics should reflect current load, not historical output.

**Why one-more-page:** Most workspaces have <500 projects, so 2 API calls gets exact count (e.g., 250 + 247 = 497). Only workspaces with 500+ projects get an estimate range. This is fast (max 2 calls) and much more precise than "250+".

#### 1c. Labels (single fetch, usually <250)
```
list_issue_labels(limit: 250)
If count = 250, note as capped.
```

#### 1d. Issues (time-bucketed sampling for trend analysis)

Fetch three samples to show quality trends over time. **Use limit: 20 to avoid token overflow.**

```
Recent (last 30 days):
  list_issues(createdAt: "-P30D", limit: 20)

Medium (30-90 days ago):
  list_issues(createdAt: "-P90D", limit: 20)
  Filter to exclude issues from last 30 days

Legacy (90+ days ago):
  list_issues(createdAt: "-P180D", limit: 20)
  Filter to exclude issues from last 90 days
```

This reveals whether issue quality is improving, declining, or persistent.

**Data status tracking:**
- Teams: Should always be **actual** (complete) due to pagination
- Projects: **actual** count via two-phase approach; **active only** (excludes completed/canceled); analysis based on sample if capped
- Labels: **actual** if count < 250, **capped** if count = 250
- Issues: **sampled** (intentionally limited, time-bucketed)

If pagination fails due to API errors, note as **partial** and document the error.

### Step 2: Apply Thresholds

**CRITICAL: Use these EXACT thresholds. Do not interpret, round, or modify them. Display these exact threshold values in the report.**

#### Team Structure
| Count | Rating | Meaning |
|-------|--------|---------|
| 4-15 teams | 🟢 | Healthy - matches Linear guidance |
| 16-30 teams | 🟡 | Review - may have team proliferation |
| 31+ teams | 🔴 | Problem - likely labels-as-teams or org debt |

#### Team Size (members per team)
| Average | Rating | Meaning |
|---------|--------|---------|
| 4+ members | 🟢 | Healthy team sizes |
| 2-3 members | 🟡 | Small teams - consider consolidating |
| 0-1 members | 🔴 | Ghost teams - archive or consolidate |

#### Archive Teams (teams with no activity 90+ days)
| Percentage | Rating | Meaning |
|------------|--------|---------|
| <10% | 🟢 | Well-maintained |
| 10-25% | 🟡 | Some cleanup needed |
| >25% | 🔴 | Significant workspace debt |

#### Project Health
| Projects without leads | Rating |
|------------------------|--------|
| <10% | 🟢 |
| 10-30% | 🟡 |
| >30% | 🔴 |

| Projects without dates | Rating |
|------------------------|--------|
| <20% | 🟢 |
| 20-50% | 🟡 |
| >50% | 🔴 |

#### Backlog Staleness (issues untouched 60+ days)
| Percentage | Rating |
|------------|--------|
| <20% | 🟢 |
| 20-40% | 🟡 |
| >40% | 🔴 |

#### Label Hygiene
| Count | Rating | Meaning |
|-------|--------|---------|
| 10-25 labels | 🟢 | Minimal and focused |
| 26-50 labels | 🟡 | Getting complex |
| 51+ labels | 🔴 | Label sprawl - needs cleanup |

#### Project Count
| Count | Rating | Meaning |
|-------|--------|---------|
| 1-50 projects | 🟢 | Manageable scope |
| 51-150 projects | 🟡 | Getting sprawling - consider consolidation |
| 151+ projects | 🔴 | Project sprawl - audit and archive |

#### Issue Quality (time-bucketed trend analysis)

For each time bucket (Recent/Medium/Legacy), check for:
- User story format ("As a...") = 🔴 per Linear methodology
- Vague titles (<4 words, no verb) = 🟡
- Missing descriptions = 🟡

**Trend Rating:**
| Pattern | Rating | Meaning |
|---------|--------|---------|
| Recent better than Legacy | 🟢 | Improving - current process is working |
| Consistent across all buckets | 🟡 | Persistent - never been enforced |
| Recent worse than Legacy | 🔴 | Declining - check intake process |

**Quality Rating (based on Recent bucket):**
| Recent issues with problems | Rating |
|-----------------------------|--------|
| <10% | 🟢 |
| 10-25% | 🟡 |
| >25% | 🔴 |

### Step 3: Output Report

**USE THIS EXACT FORMAT:**

```markdown
# Linear Workspace Calibration Report

**Workspace:** [name]
**Date:** [YYYY-MM-DD]
**Analyzed:**
- Teams: [N] (actual) - paginated, complete data
- Projects: [N] active ([M] total, excludes completed/canceled)
  - Backlog: [N] (e.g., Drafting, To Do, icebox)
  - Planned: [N] (e.g., Shaping, Ready for Kickoff)
  - Started: [N] (e.g., In Progress, QA)
  - Paused: [N]
- Labels: [N] (actual/capped)
- Issues: [N] (sampled) - time-bucketed for trend analysis

**Data Quality Notes:** (required if any status is capped, sampled, or partial)
```
[For each non-actual status, explain what happened, including API call and methodology:]

Projects (one-more-page): list_projects(limit: 250) returned 250 results (capped).
Fetched page 2: list_projects(limit: 250, after: cursor) returned 247 results.
Total: 497 projects fetched. Filtered to 312 active (excludes 185 completed/canceled).
Breakdown by type: 145 backlog, 32 planned, 110 started, 25 paused.
Project Ownership and Project Dates metrics are based on active projects only.

Labels (capped): list_issue_labels(limit: 250) returned exactly 250 results.
Actual label count may be higher.

Projects (partial): Pagination failed at page 3. list_projects(limit: 250, after: xyz)
returned "Too many subrequests". Retrieved 250 of unknown total.
```

⚠️ *Metrics marked with † are based on sampled data, not the full dataset.*

---

## Health Indicators

**IMPORTANT: Always include exact counts alongside percentages using format: N% (X of Y)**
**IMPORTANT: Show the exact threshold from Step 2 in the Threshold column - do not paraphrase**

| Dimension | Value | Threshold | Rating | Finding |
|-----------|-------|-----------|--------|---------|
| Team Count | [N] | 4-15 🟢 / 16-30 🟡 / 31+ 🔴 | 🟢/🟡/🔴 | [one-line assessment] |
| Team Sizes | [avg] | 4+ 🟢 / 2-3 🟡 / 0-1 🔴 | 🟢/🟡/🔴 | [one-line assessment] |
| Stale Teams | [N% (X of Y)] | <10% 🟢 / 10-25% 🟡 / >25% 🔴 | 🟢/🟡/🔴 | [one-line assessment] |
| Project Count | [N] active | 1-50 🟢 / 51-150 🟡 / 151+ 🔴 | 🟢/🟡/🔴 | [one-line assessment] (excludes completed/canceled) |
| Project Ownership † | [N% (X of Y) missing] | <10% 🟢 / 10-30% 🟡 / >30% 🔴 | 🟢/🟡/🔴 | [one-line assessment] (active projects only) |
| Project Dates † | [N% (X of Y) missing] | <20% 🟢 / 20-50% 🟡 / >50% 🔴 | 🟢/🟡/🔴 | [one-line assessment] (active projects only) |
| Backlog Staleness | [N% (X of Y)] | <20% 🟢 / 20-40% 🟡 / >40% 🔴 | 🟢/🟡/🔴 | [one-line assessment] |
| Label Count | [N] | 10-25 🟢 / 26-50 🟡 / 51+ 🔴 | 🟢/🟡/🔴 | [one-line assessment] |
| Issue Quality | See trend ↓ | <10% 🟢 / 10-25% 🟡 / >25% 🔴 | 🟢/🟡/🔴 | [one-line assessment based on Recent bucket] |
| Issue Quality Trend | — | Recent < Legacy 🟢 / Equal 🟡 / Recent > Legacy 🔴 | 🟢/🟡/🔴 | [Improving / Persistent / Declining] |

**Overall Health:** [🟢 Healthy / 🟡 Needs Attention / 🔴 Action Required]

(Overall = 🔴 if any dimension is 🔴, 🟡 if any is 🟡, else 🟢)

† = Metric based on sampled data. See Data Quality Notes for sample size and methodology.

---

## Issue Quality Trend

**Time-bucketed analysis showing whether issue hygiene is improving or declining.**

| Period | Sample Size | Missing Descriptions | Vague Titles | User Story Format |
|--------|-------------|---------------------|--------------|-------------------|
| Recent (0-30 days) | [N] | [N% (X of Y)] | [N% (X of Y)] | [N% (X of Y)] |
| Medium (30-90 days) | [N] | [N% (X of Y)] | [N% (X of Y)] | [N% (X of Y)] |
| Legacy (90+ days) | [N] | [N% (X of Y)] | [N% (X of Y)] | [N% (X of Y)] |

**Trend Analysis:**
- Missing Descriptions: [🟢 Improving / 🟡 Persistent / 🔴 Declining] - [one sentence explanation]
- Vague Titles: [🟢 Improving / 🟡 Persistent / 🔴 Declining] - [one sentence explanation]
- User Story Format: [🟢 Improving / 🟡 Persistent / 🔴 Declining] - [one sentence explanation]

**What this means:**
- 🟢 **Improving**: Recent issues are cleaner than old ones. Current process is working.
- 🟡 **Persistent**: Quality is consistent across time. This was never enforced.
- 🔴 **Declining**: Recent issues are worse than old ones. Check your intake process.

---

## Red Flags

List ALL dimensions rated 🔴 or 🟡. **Always include exact counts (X of Y) in explanations.**

**REQUIRED: For EVERY red flag, include an "Ask Claude:" section with 2-3 actionable prompts. Use the example prompts table below as reference. Do not skip this section.**

**FORMATTING: Use this exact structure. The "Ask Claude:" line must NOT be numbered - it's a sub-section under each numbered red flag.**

1. **[Dimension]** (🔴/🟡): [Specific problem with counts, e.g., "62 teams exceeds threshold of 31+ (🔴)"]

   **Ask Claude:**
   - "[List question to see specific items]"
   - "[Analysis question to understand priority]"
   - "[Action question to fix it]"

2. **[Dimension]** (🔴/🟡): [Specific problem with counts, e.g., "427 of 497 projects (86%) missing target dates"]

   **Ask Claude:**
   - "[Contextual prompt 1]"
   - "[Contextual prompt 2]"
   - "[Contextual prompt 3]"

(Continue this pattern for all red flags. Do NOT restart numbering or number the "Ask Claude:" lines.)

**Example prompts by dimension:**

| Dimension | List | Analyze | Act |
|-----------|------|---------|-----|
| Team Count | "List all teams with fewer than 3 members" | "Which teams have no activity in 90 days?" | "Show issues in [team] so I can move them before archiving" |
| Project Ownership | "List all projects without leads" | "Which unowned projects have the most issues?" | "Assign me as lead to [project]" |
| Project Dates | "List projects without target dates" | "Which undated projects are in progress?" | "Set target date for [project] to [date]" |
| Stale Teams | "List teams with no activity in 90+ days" | "How many issues are in each stale team?" | "Archive [team] after moving its issues" |
| Backlog Staleness | "List issues untouched for 60+ days" | "Which stale issues are still assigned?" | "Close stale issues in [team] backlog" |
| Label Sprawl | "List all labels with usage counts" | "Which labels have fewer than 5 issues?" | "Merge [label1] and [label2]" |
| Issue Quality | "List active issues missing descriptions" | "Which in-progress issues have vague titles?" | "Add description to [issue]" |
| Issue Quality Trend | "Compare issue quality by team for last 30 days" | "Which teams have declining issue quality?" | "Show [team]'s recent issues that need cleanup" |

**Note on issue prompts:** Use `state: "In Progress"` or `state: "To Do"` filters to focus on active work. Historical issues are for trend analysis; active issues are for action.

If no red flags: "No red flags identified. Workspace follows Linear best practices."

---

## Teams Overview

**Active Teams ([N]):**
[List teams with recent activity, grouped by function]

**Stale/Archive Teams ([N]):**
[List teams with no activity 90+ days - candidates for archival]

---

## Recommendations

### Immediate (This Week)
[List 1-3 specific actions for any 🔴 items]

### Near-Term (This Month)
[List 1-3 specific actions for any 🟡 items]

### Maintenance
[List ongoing practices to maintain health]

---

## Methodology

Thresholds based on Linear Method (linear.app/method):
- Teams should be durable groups, not topics (4-15 recommended)
- Issues not user stories
- Projects need owners and dates
- Keep backlogs lean

---

*Generated by PM Thought Partner /linear-calibrate*
```

### Step 4: Offer Next Steps

After the report, ask:
```
What would you like to explore?
1. Deep-dive on a specific red flag
2. Run /lno-prioritize on a specific team's backlog
3. See team details for consolidation candidates
4. Export this report
```

## Edge Cases

### No Linear MCP
```
Linear MCP is not configured. To run workspace calibration:
1. Get a Linear API key (Settings > Account > Security & Access)
2. Configure the Linear MCP server

Alternatively, describe your workspace and I'll help analyze it manually.
```

### Very Large Workspace (250+ teams)
If team count equals 250:
```
⚠️ This workspace has 250+ teams (API limit reached).
This is an extreme case of team proliferation.

Rating: 🔴 SEVERE
Recommendation: Immediate audit required. Linear recommends 4-15 teams.
```

### Empty/New Workspace
If <5 teams and <10 projects:
```
This appears to be a new or minimal workspace.
Instead of a health check, would you like guidance on:
- Setting up team structure
- Establishing conventions
- Avoiding common pitfalls
```
