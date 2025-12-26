# Changelog

All notable changes to PM Thought Partner will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.3.0] - 2025-12-25

### Added - `/issue-audit` Command

New command for understanding how a team organizes work in Linear - designed for PMs onboarding to new teams.

**Use Case:**
PM joins a team with an existing Linear backlog. `/issue-audit` helps them understand conventions, see examples, and know what questions to ask.

**Approach: Metadata-First**

Previous versions tried to bulk-fetch issues for analysis, which hit token limits. This version uses a smarter approach:

1. **Phase 1: Organization Structure** (lightweight, no token issues)
   - Workflow states (team's process)
   - Label taxonomy (what categories exist)
   - Cycle cadence (sprint structure)

2. **Phase 2: Surgical Samples** (9 issues max)
   - 3 issues in progress (active work)
   - 3 recently completed (what "done" looks like)
   - 3 in backlog (what's waiting)

3. **Phase 3: Pattern Analysis**
   - Observe patterns from the 9 samples
   - Infer conventions to follow
   - No bulk percentages - just what's visible

4. **Phase 4: Drill-Down Prompts**
   - Offers specific follow-up questions
   - User-driven exploration by label, state, or specific issue

**Usage:**
```
/issue-audit [team name]
```

**Updated Command Hierarchy:**
```
/linear-calibrate        → Workspace-wide health
         ↓
    ┌────┴────┐
    ↓         ↓
/project-health       /issue-audit
[project]             [team]
(execution health)    (organization patterns)
```

### Changed
- `/issue-audit` now team-scoped (was project or team) - labels, statuses, and cycles are team-level concepts
- Removed bulk issue fetching - replaced with surgical 9-issue sampling
- Skipped `/team-health` command - Linear Insights + Cycles already cover team metrics

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
