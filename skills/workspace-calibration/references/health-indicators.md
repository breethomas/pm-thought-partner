# Workspace Health Indicators

Dimensions to analyze when calibrating a Linear workspace.

---

## 1. Team Structure

**What to analyze:**
- Total team count
- Members per team (active users)
- Team naming patterns
- Activity distribution across teams

**Healthy signals:**
- 4-15 teams for most orgs (scales with company size)
- Each team has 4+ active members
- Teams named after durable groups or product areas
- Work distributed across teams (not concentrated in 1-2)

**Warning signals:**
- 30+ teams (likely labels-as-teams)
- Many teams with 0-3 members
- Teams named after topics ("Bugs", "Tech Debt", "Ideas")
- Many teams with zero activity in 90 days

**Gut-check questions:**
- Can you explain what each team owns in one sentence?
- Are these real squads or "labels-as-teams"?
- Could you consolidate to 8-15 without losing anything?
- Does a new PM know where to file any given issue within 2 clicks?

---

## 2. Issue Quality

**What to analyze:**
- Title patterns (clear vs vague)
- User story format usage
- Description completeness
- Scope clarity

**Healthy signals:**
- Action-oriented titles (verb + subject + context)
- No "As a user, I want..." format
- Issues have clear, concrete outcomes
- Minimal but sufficient descriptions

**Warning signals:**
- Vague titles ("Fix bug", "Update page", "Improvements")
- User story format everywhere
- Issues that are really epics (need breaking down)
- Missing descriptions on complex issues

**Patterns to detect:**
- Titles starting with "As a..."
- Single-word titles
- Titles that are questions
- Issues with no description and vague titles

---

## 3. Backlog Health

**What to analyze:**
- Total open issues
- Age distribution (how old are open issues?)
- Recent activity (touched in last 30/60/90 days)
- Issues per team/project

**Healthy signals:**
- Most open issues touched within 30 days
- Backlog size manageable (not thousands of stale items)
- Regular archiving of abandoned work
- Clear prioritization (not everything is "high")

**Warning signals:**
- 100+ issues untouched for 90+ days
- Backlogs with 500+ items per team
- No clear prioritization pattern
- Duplicate or overlapping issues

**Staleness thresholds:**
- Green: <20% issues older than 60 days
- Yellow: 20-40% issues older than 60 days
- Red: >40% issues older than 60 days

---

## 4. Project Health

**What to analyze:**
- Projects with/without leads
- Projects with/without target dates
- Active vs stale projects
- Project scope (issues per project)

**Healthy signals:**
- All projects have assigned leads
- Projects have start/target dates (even approximate)
- Projects are time-bound (not indefinite)
- Reasonable scope (10-50 issues typically)

**Warning signals:**
- Projects without owners
- Projects with no dates ("someday" projects)
- Projects with 100+ issues (too big)
- Projects with 0 activity for 60+ days
- Projects named as ongoing work ("Maintenance", "Bugs")

---

## 5. Cycle Usage

**What to analyze:**
- Which teams use cycles
- Cycle length and consistency
- Completion rates
- Carryover patterns

**Healthy signals:**
- Teams have consistent cycle rhythm
- 1-2 week cycles
- Reasonable completion rates (60-80%)
- Carryover is intentional, not just overflow

**Warning signals:**
- No cycles (no planning rhythm)
- Inconsistent cycle lengths
- Very low completion rates (<40%)
- Massive carryover every cycle

**Note:** Some teams intentionally don't use cycles (continuous flow). This isn't necessarily unhealthy - just different.

---

## 6. Workflow Complexity

**What to analyze:**
- Number of statuses per team
- Custom vs default workflows
- Status usage distribution

**Healthy signals:**
- Using Linear defaults or minimal customization
- 4-6 statuses total
- Clear progression (not circular)
- All statuses actually used

**Warning signals:**
- 10+ statuses (over-engineered)
- Mimicking Jira complexity
- Statuses that are never used
- Confusing status names

---

## 7. Triage Usage

**What to analyze:**
- Is triage enabled?
- Volume in triage
- Time-to-triage (how long do items sit?)
- Triage → accepted ratio

**Healthy signals:**
- Triage enabled and actively used
- Items reviewed within 1-2 days
- Clear ownership of triage duty
- Most items accepted or declined (not lingering)

**Warning signals:**
- Triage disabled or ignored
- 50+ items sitting in triage
- Items in triage for weeks
- No clear triage process

---

## 8. Label Hygiene

**What to analyze:**
- Total label count
- Label naming consistency
- Labels vs teams overlap
- Label usage distribution

**Healthy signals:**
- Minimal labels (10-20 max)
- Consistent naming (no "Bug" vs "bug" vs "Bugs")
- Labels complement teams (not duplicate)
- Most labels actually used

**Warning signals:**
- 50+ labels (chaos)
- Inconsistent naming conventions
- Labels that should be teams
- Many labels with <5 issues

---

## 9. Cross-Team Patterns

**What to analyze:**
- Projects spanning multiple teams
- Dependencies between teams
- Shared views usage
- Initiative structure

**Healthy signals:**
- Cross-team projects have clear ownership
- Dependencies are tracked (blocking/blocked)
- Shared views for leadership visibility
- Initiatives group related work

**Warning signals:**
- Cross-team work with no coordination
- Hidden dependencies (not tracked)
- No workspace-level visibility
- Siloed teams with no shared context

---

## Calibration Output Summary

After analysis, produce ratings for each dimension:

| Dimension | Status | Key Finding |
|-----------|--------|-------------|
| Team Structure | 🟢/🟡/🔴 | [summary] |
| Issue Quality | 🟢/🟡/🔴 | [summary] |
| Backlog Health | 🟢/🟡/🔴 | [summary] |
| Project Health | 🟢/🟡/🔴 | [summary] |
| Cycle Usage | 🟢/🟡/🔴 | [summary] |
| Workflow Complexity | 🟢/🟡/🔴 | [summary] |
| Triage Usage | 🟢/🟡/🔴 | [summary] |
| Label Hygiene | 🟢/🟡/🔴 | [summary] |
| Cross-Team Patterns | 🟢/🟡/🔴 | [summary] |

Plus:
- Top 3 recommendations
- Conventions guide (how this org uses Linear)
- Red flags requiring attention
