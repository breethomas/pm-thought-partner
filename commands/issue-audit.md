---
description: /issue-audit [project or team] - Discover issue patterns and quality for PM onboarding
---

# Issue Audit

Analyze how a project or team writes issues. Helps PMs onboarding to new teams understand patterns, see examples of well-written issues, and identify quality gaps.

## Prerequisites

- Linear MCP must be configured

## Usage

```
/issue-audit [project or team name]
```

**Defaults to project scope.** To audit a team's issues across all projects, prefix with `team:`:

```
/issue-audit Customer Experience          # Audits project named "Customer Experience"
/issue-audit team:Customer Experience     # Audits all issues for the team
```

Examples:
- `/issue-audit AI Video`
- `/issue-audit "HBN for Agent Customers"`
- `/issue-audit team:Platform`

## Instructions

### Step 1: Find and Fetch Issues

**IMPORTANT:** Linear API can return large payloads. Use limit: 25 to avoid token overflow.

**For project scope:**
```
get_project(query: "[name]")
list_issues(project: "[name]", limit: 25)
```

**For team scope:**
```
get_team(query: "[name]")
list_issues(team: "[name]", limit: 25)
```

If not found, list similar options and ask user to clarify.

**If you need more issues for accuracy:** Fetch in batches of 50 using the `after` cursor, but analyze incrementally rather than loading all at once.

### Step 2: Analyze Organization Patterns

From the issues, extract:

**Structure:**
- Count of parent issues (issues with children)
- Count of child issues (issues with `parentId`)
- Count of standalone issues (neither parent nor child)
- Depth: Are there sub-sub-issues?

**Labels:**
- Which labels are used?
- Frequency of each label
- Are labels used consistently?

**Milestones:**
- Which milestones exist?
- How many issues per milestone?

**Cycles:**
- Are issues assigned to cycles?
- What % have cycle assignments?

### Step 3: Analyze Quality Patterns

**Description completeness:**
- Count issues with description >50 chars (has content)
- Count issues with description 1-50 chars (minimal)
- Count issues with empty description

**Calculate by issue type:**
- Parent issues: % with descriptions >50 chars
- Child issues: % with descriptions >50 chars
- By label (if Feature vs Bug labels exist): % with descriptions

**Identify examples:**
- **Well-written:** 2 issues with longest/most structured descriptions
- **Sparse:** 2 issues in active states (In Progress, In Review, Selected for Development) with empty or minimal descriptions

### Step 4: Analyze Backlog Profile

**Age distribution (based on `createdAt`):**
- Recent: Created in last 30 days
- Medium: Created 30-90 days ago
- Legacy: Created 90+ days ago

**Status distribution:**
- Done / Completed
- In Progress / In Review
- Backlog / To Do / Selected for Development
- Blocked
- Canceled

**Stale issues:**
- Open issues (not Done/Canceled) with `updatedAt` older than 60 days
- List up to 5 with identifiers

**Quality by age (if pattern exists):**
- Compare description completeness: Recent vs Legacy
- Note if team is improving or declining

### Step 5: Identify Active Work Gaps

Find issues that are actively being worked on but missing quality:

**Active states:** In Progress, In Review, Selected for Development

**Quality gaps:**
1. Active issues with empty descriptions
2. Parent issues (any state) with description <100 chars
3. Active issues with vague titles (contains only: "fix", "update", "changes", "bug", "issue", "WIP")

List up to 10 issues with gaps, showing:
- Identifier (e.g., CSX-901)
- Title
- What's missing

### Step 6: Output Report

**USE THIS EXACT FORMAT:**

```markdown
# Issue Audit: [Project or Team Name]

**Scope:** [Project / Team]
**Issues Analyzed:** [N] (limit: 25)
**Date Range:** [oldest createdAt] → [newest createdAt]

---

## Organization Patterns

### Structure
- **Parent issues (epics):** [N]
- **Child issues (sub-tasks):** [N]
- **Standalone issues:** [N]

[If parent/child used]: "This [project/team] uses parent-child hierarchy for organizing work."
[If not]: "Issues are flat - no parent-child hierarchy detected."

### Labels
| Label | Count | % of Issues |
|-------|-------|-------------|
| [label] | [N] | [X]% |
| ... | ... | ... |
| (none) | [N] | [X]% |

### Milestones
[If milestones exist]:
| Milestone | Issues |
|-----------|--------|
| [name] | [N] |

[If no milestones]: "No milestones in use."

### Cycles
- **Issues in cycles:** [N] ([X]%)
- **Issues without cycle:** [N] ([X]%)

---

## Quality Patterns

### Description Completeness
| Category | Count | % |
|----------|-------|---|
| Has content (>50 chars) | [N] | [X]% |
| Minimal (1-50 chars) | [N] | [X]% |
| Empty | [N] | [X]% |

### Quality by Issue Type
| Type | Has Description | % |
|------|-----------------|---|
| Parent issues | [N] of [M] | [X]% |
| Child issues | [N] of [M] | [X]% |
| [Label: Feature] | [N] of [M] | [X]% |
| [Label: Bug] | [N] of [M] | [X]% |

### Example: Well-Written Issue
**[IDENTIFIER]:** [Title]
> [First 200 chars of description]...

[What makes it good: "Has clear problem statement, acceptance criteria as checklist, linked to milestone"]

### Example: Sparse Issue (Active)
**[IDENTIFIER]:** [Title]
Status: [status]
Description: [empty / minimal content]

---

## Backlog Profile

### Age Distribution
| Age | Count | % |
|-----|-------|---|
| Recent (0-30 days) | [N] | [X]% |
| Medium (30-90 days) | [N] | [X]% |
| Legacy (90+ days) | [N] | [X]% |

### Status Distribution
| Status | Count | % |
|--------|-------|---|
| Done | [N] | [X]% |
| In Progress | [N] | [X]% |
| In Review | [N] | [X]% |
| Backlog/To Do | [N] | [X]% |
| Blocked | [N] | [X]% |

### Quality Trend
[If pattern detected]:
"Recent issues (30d) have descriptions [X]% of the time vs [Y]% for legacy issues → [Improving / Declining / Stable]"

[If no clear pattern]: "No clear trend in description quality over time."

### Stale Issues
[If any]: "[N] open issues haven't been updated in 60+ days:"
- [IDENTIFIER]: [Title] (last updated [date])
- ...

[If none]: "No stale issues detected."

---

## Active Work Gaps

[If gaps found]:
**[N] issues in active work are missing quality:**

| Issue | Title | Gap |
|-------|-------|-----|
| [ID] | [title] | No description |
| [ID] | [title] | Vague title |
| [ID] | [title] | Parent issue, minimal description |

[If no gaps]: "All active issues have descriptions and clear titles."

---

## Recommendations

### Learn From
- **[IDENTIFIER]** is a good template for how this team writes feature issues
- [Other patterns observed]

### Quick Wins
[Based on gaps found]:
- Add descriptions to [N] active issues currently in progress
- Consider using `/prd` on parent issue [IDENTIFIER] to add structure

### Patterns to Note
[Observations that help PM understand how team works]:
- "This team uses labels consistently for Bug vs Feature distinction"
- "Parent issues tend to be well-specified; child issues are lightweight"
- "Most issues come from Slack (descriptions start with '@name said:')"

---

*Generated by PM Thought Partner /issue-audit*
```

### Step 7: Offer Next Steps

After the report, ask:
```
What would you like to explore?
1. See full details on a specific issue
2. Audit another project or team
3. Run /project-health on this project
4. Get help writing a PRD for a sparse parent issue
```

## Relationship to Other Commands

```
/linear-calibrate        → Workspace-wide health (30,000 ft view)
         ↓
    ┌────┴────┐
    ↓         ↓
/project-health       /issue-audit
[project]             [project or team]
(execution health)    (patterns + quality)
```

- `/linear-calibrate` flags "68% of issues missing descriptions" workspace-wide
- `/issue-audit` drills into a specific project/team to understand the patterns and see examples
- `/project-health` checks if a specific project is on track (dates, lead, progress)

---

*Part of PM Thought Partner Linear analysis suite*
