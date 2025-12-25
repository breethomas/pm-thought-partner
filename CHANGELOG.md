# Changelog

All notable changes to PM Thought Partner will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.3.0] - 2025-12-25

### Added - `/issue-audit` Command

New command for discovering issue patterns and quality - designed for PMs onboarding to new teams.

**Use Case:**
PM joins a team with an existing Linear backlog. `/issue-audit` helps them understand how the team works and where quality gaps exist.

**What It Analyzes:**

1. **Organization Patterns**
   - Parent/child issue structure (epics vs sub-tasks)
   - Labels used and frequency
   - Milestones and cycles in use

2. **Quality Patterns**
   - Description completeness (% with content)
   - Quality by issue type (parents vs children, features vs bugs)
   - Example well-written issues to use as templates
   - Example sparse issues that need attention

3. **Backlog Profile**
   - Age distribution (recent, medium, legacy)
   - Status distribution
   - Stale issues (open but untouched 60+ days)
   - Quality trend over time (improving or declining)

4. **Active Work Gaps**
   - Issues in progress with no description
   - Parent issues missing structured content
   - Vague titles

**Scope Options:**
- `/issue-audit [project]` - Audit a specific project
- `/issue-audit team:[team]` - Audit all issues for a team

**Updated Command Hierarchy:**
```
/linear-calibrate        → Workspace-wide health
         ↓
    ┌────┴────┐
    ↓         ↓
/project-health       /issue-audit
[project]             [project or team]
(execution health)    (patterns + quality)
```

`/project-health` and `/issue-audit` are peer commands - both drill down from `/linear-calibrate` but examine different dimensions (execution vs quality).

### Changed
- Skipped `/team-health` command - Linear Insights + Cycles already cover team metrics (velocity, WIP, cycle time). Team health is more engineering manager territory than PM.

---

## [1.2.0] - 2025-12-25

### Added - `/project-health` Command

New command for deep-dive health checks on individual Linear projects:

**Dimensions Analyzed (7 total):**
- **Ownership** - Lead assigned or not
- **Timeline** - Has dates, overdue status
- **Progress** - Activity + completion percentage
- **Scope Clarity** - Description length (>300 chars = healthy)
- **Issue Distribution** - Issue count (5-100 = healthy)
- **Blockers** - Percentage of open issues blocked
- **Staleness** - Days since last activity

**Smart Features:**
- **Status-based logic** - Thresholds adjust based on project status (Drafting, In Progress, Done, Paused, Canceled)
- **Canceled project handling** - Excluded from health checks entirely
- **Drafting project allowances** - 0 issues and missing dates are less severe for planning-phase projects
- **Done project handling** - Staleness and timeline checks skipped for completed work

**Output:**
- Overall assessment: On Track / At Risk / Stalled
- Health indicators table with explicit thresholds
- Issue state breakdown
- Red flags with "Ask Claude" follow-up prompts
- Specific recommendations

**Relationship to `/linear-calibrate`:**
```
/linear-calibrate        → Workspace-level (30,000 ft view)
         ↓
/project-health [name]   → Deep-dive on specific projects
```

### Fixed
- `/linear-calibrate` "Ask Claude" section numbering glitch - added explicit formatting instructions

### Changed
- README updated to show Linear command hierarchy

---

## [1.1.0] - 2025-12-25

### Added - `/linear-calibrate` Command Overhaul

Major improvements to the Linear workspace health check command:

**New Features:**
- **Issue Quality Trend analysis** - Time-bucketed sampling (Recent 0-30d, Medium 30-90d, Legacy 90d+) shows whether issue hygiene is improving or declining
- **Two-phase project counting** - Designed to get accurate total count when API returns capped results (note: may still show "250+" if pagination not followed)
- **Project Count dimension** - New metric with thresholds: 1-50 (healthy), 51-150 (sprawling), 151+ (audit needed)
- **"Ask Claude" follow-up prompts** - Every red flag now includes 2-3 actionable prompts for deeper investigation

**Engineer-friendly Improvements:**
- **Explicit thresholds in output** - Health Indicators table now shows exact threshold values (e.g., "4-15 / 16-30 / 31+")
- **Exact counts with percentages** - All metrics show "N% (X of Y)" format
- **Data Quality Notes** - Explains methodology when data is sampled or capped, including API calls made
- **Sample markers** - Metrics based on sampled data marked with in table

**Reliability Improvements:**
- Reduced API batch sizes to avoid "Too many subrequests" errors
- Better handling of API limits and pagination
- Clearer instructions for threshold application

### Changed
- `health-indicators.md` reference updated to match canonical thresholds in `/linear-calibrate`
- Summary table now includes Threshold column

### Fixed
- Team count accuracy (was sometimes truncated due to context compaction)
- Threshold values now consistently respected in output

## [1.0.0] - 2025-12-XX

### Added
- Initial release
- `/strategy-session` - Conversational product strategy partner
- `/reflect` - Pattern recognition across decisions
- `/linear-calibrate` - Linear workspace health check
- `/lno-prioritize` - Backlog categorization by impact
- `/four-risks` - Marty Cagan's risk assessment
- `/now-next-later` - Roadmap generation
- `/growth-loops` - Growth mechanics analysis
- `/four-fits` - Market fit assessment
- `/ai-cost-check` - AI feature cost analysis
- `/ai-health-check` - Pre-launch AI feature check
- `/start-evals` - AI evaluation setup
- `/pmf-survey` - Product-market fit survey
- `/competitive-research` - Competitive analysis
- `/coder` - Organizational AI adoption framework
- `/prd` - Modern PRD writing
- `/prompt-engineering` - Prompt optimization
- Skills: workspace-calibration, pm-frameworks, agent-workflow, prd-writer, prompt-engineering
