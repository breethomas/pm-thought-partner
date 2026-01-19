# Changelog

All notable changes to PM Thought Partner will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.8.0] - 2026-01-19

### Added - CC/CD Framework Integration

**CC/CD (Continuous Calibration/Continuous Development)** - For companies transitioning from traditional SaaS to AI features, CC/CD provides the operational framework for building AI products differently.

Based on Aishwarya Naresh Reganti & Kiriti Badam's article "Why your AI product needs a different development lifecycle" (Lenny's Newsletter, August 2025).

**Three new components embed CC/CD thinking at different moments:**

| Component | Type | Purpose | When Used |
|-----------|------|---------|-----------|
| `/spec --ai` (enhanced) | Skill update | Force CC/CD thinking at spec time | Before building |
| `/agency-ladder` | New command + skill | Map v1→v2→v3 progression | Planning/conversations |
| `/calibrate` | New command + skill | Post-launch error patterns, agency promotion | After launch |

### `/spec --ai` Enhancements

Added three new required sections for AI feature specs:

**Phase 4: Agency Progression Plan**
- Map v1→v2→v3 autonomy progression
- Define what you're testing at each level
- Identify which version you're speccing now

**Phase 5: Control Handoffs**
- Override mechanism (how users correct AI)
- Escalation path (when AI defers to human)
- Feedback capture (how corrections improve system)

**Phase 6: Reference Dataset**
- 20-100 examples of expected behavior before building
- Forces alignment on what "good" looks like
- Becomes baseline for evals

### `/agency-ladder` - New Command + Skill

Plan the agency ladder for any AI feature:

```
/agency-ladder                    # Start planning workflow
/agency-ladder "feature name"     # Start with context
/agency-ladder --review           # Map existing feature's level
/agency-ladder --promote          # Check promotion readiness
/agency-ladder --export           # Generate stakeholder artifact
```

**Four flows:**
1. Plan new feature (full ladder from scratch)
2. Review existing feature (map current state)
3. Promotion check (readiness assessment)
4. Export for stakeholder discussion

**Output: Flywheel table**

| Version | What You're Testing | What You Learn | What Feeds Next Loop |
|---------|---------------------|----------------|----------------------|
| V1 | ... | ... | ... |
| V2 | ... | ... | ... |
| V3 | ... | ... | ... |

### `/calibrate` - New Command + Skill

Post-launch calibration workflow:

```
/calibrate                        # Start calibration workflow
/calibrate --errors               # Document error patterns
/calibrate --evals                # Review eval performance
/calibrate --promote              # Agency promotion decision
/calibrate --quick                # Quick health check
```

**Four flows:**
1. Document error patterns (categorize, analyze, prioritize fixes)
2. Review eval performance (gaps, staleness, effectiveness)
3. Agency promotion decision (checklist + verdict)
4. Quick calibration check (health status)

**Error Pattern Table output:**

| Error Pattern | Category | Likely Reason | Potential Fix | Priority |
|---------------|----------|---------------|---------------|----------|
| ... | ... | ... | ... | P1/P2/P3 |

### New Skill Files

```
skills/
├── agency-ladder/
│   ├── SKILL.md
│   └── references/
│       └── ladder-examples.md
├── calibrate/
│   ├── SKILL.md
│   └── references/
│       └── error-pattern-template.md
└── spec/
    └── references/
        └── agency-progression.md   # NEW
```

### Updated Files

- `skills/spec/SKILL.md` - Added Phases 4-6 for CC/CD sections
- `templates/ai-product-spec.md` - Added Agency Progression, Control Handoffs, Reference Dataset sections
- `frameworks/ai-era-practices/continuous-calibration.md` - Added "Operationalizing CC/CD" section with command links
- `sources.yml` - Added Aishwarya Naresh Reganti & Kiriti Badam as thought leaders, updated continuous_calibration entry
- `README.md` - Added new commands to Top Commands section

### Philosophy

**Core insight from CC/CD:**
- AI products earn autonomy, they don't start with it
- Every increase in AI agency means surrendering human control
- Calibration happens after launch, not before
- Reference datasets force alignment before building

**The ladder:**
| Version | Control | Agency | Pattern |
|---------|---------|--------|---------|
| V1 | High | Low | AI suggests, human decides |
| V2 | Medium | Medium | AI handles routine, escalates edge cases |
| V3 | Low | High | AI acts autonomously, human spot-checks |

---

## [1.7.0] - 2026-01-19

### Added - Agent Architecture

**7 new specialized agents** for research and analysis tasks. Agents run autonomously and return structured output. Commands become thin wrappers that invoke agents.

| Agent | Purpose | Tools |
|-------|---------|-------|
| `linear-workspace-analyzer` | Workspace health against Linear methodology | Linear MCP |
| `project-health-checker` | Single project deep-dive | Linear MCP |
| `team-organization-analyzer` | Team conventions and patterns | Linear MCP |
| `ai-cost-analyzer` | AI feature economics and viability | Read, Grep, Glob |
| `ai-implementation-auditor` | Pre-launch readiness (6 dimensions) | Read, Grep, Glob |
| `competitor-researcher` | Individual competitor analysis | WebFetch, WebSearch |
| `eval-generator` | Create AI test cases | Write, Linear MCP |

**Why agents?**
- Agents are auto-discovered from `agents/` directory
- YAML frontmatter defines metadata: `name`, `description`, `tools`, `model`
- Commands stay conversational; agents handle the heavy lifting
- Structured output for each agent type

**New directory structure:**
```
pm-thought-partner/
├── agents/                          # NEW - 7 specialized agents
│   ├── linear-workspace-analyzer.md
│   ├── project-health-checker.md
│   ├── team-organization-analyzer.md
│   ├── ai-cost-analyzer.md
│   ├── ai-implementation-auditor.md
│   ├── competitor-researcher.md
│   └── eval-generator.md
├── commands/                        # Refactored to thin wrappers
│   └── ... (7 commands invoke agents, 11 unchanged)
└── ...
```

### Changed

**Commands refactored to thin wrappers:**
- `/linear-calibrate` → invokes `linear-workspace-analyzer` agent
- `/project-health` → invokes `project-health-checker` agent
- `/issue-audit` → invokes `team-organization-analyzer` agent
- `/ai-cost-check` → invokes `ai-cost-analyzer` agent
- `/ai-health-check` → invokes `ai-implementation-auditor` agent
- `/competitive-research` → invokes `competitor-researcher` agent
- `/start-evals` → invokes `eval-generator` agent

**Commands unchanged (11):**
- `/strategy-session`, `/four-risks`, `/growth-loops`, `/four-fits`, `/pmf-survey`
- `/lno-prioritize`, `/now-next-later`, `/reflect`
- `/shape`, `/spec`, `/prd`

### Documentation

- **README.md** - Added Agents section with table and link to agents directory
- Agent files include full workflow, output format, and edge case handling

---

## [1.6.0] - 2026-01-11

### Added - Shape Up Methodology

**`/shape` - Shape Up shaping workflow**

New command for walking through Ryan Singer's Shape Up methodology. Guides you through the 4-step shaping process to create pitches ready for betting:

1. **Set Boundaries** - Choose appetite (Small Batch 1-2 weeks, Big Batch 6 weeks), narrow the problem
2. **Find the Elements** - Breadboard the solution, fat marker sketches if visual
3. **Address Risks** - Identify rabbit holes, patch or cut, declare no-gos
4. **Write the Pitch** - Compile 5 ingredients (Problem, Appetite, Solution, Rabbit Holes, No-Gos)

**Product mode awareness:**
- **Established product** - Full rigor, circuit breaker, betting table ready
- **New product** - Looser constraints, validation focus

**Usage:**
```
/shape                     # Start shaping workflow
/shape "feature idea"      # Start with context
/shape --review            # Review an existing pitch
/shape --established       # Established product mode (full rigor)
/shape --new-product       # New product mode (looser constraints)
```

**New skill: `shape-up`**

Full Shape Up methodology implementation with three flows:
- Shape New Work (full 4-step process)
- Review Existing Pitch (challenge and improve)
- Quick Pitch (via `/spec --pitch`)

Reference files in `skills/shape-up/references/`:
- `methodology.md` - Core philosophy, fixed time/variable scope, circuit breaker
- `techniques.md` - Breadboarding, fat marker sketches, de-risking
- `pitch-template.md` - 5 ingredients with examples

**`/spec --pitch` - Quick pitch format**

New option on `/spec` command for users who want pitch format without the full shaping workflow.

**New thought leader: Ryan Singer**

Added Ryan Singer (Shape Up creator, former Head of Strategy at Basecamp) to:
- `thought-leaders/ryan-singer.md` - Full profile
- `sources.yml` - Attribution with frameworks and key works

### Changed

- **`/spec`** - Added `--pitch` option routing to shape-up skill
- **README.md** - Added Ryan Singer to thought leaders, updated spec table and skills table

---

## [1.5.0] - 2026-01-11

### Added - Unified Spec System

**`/spec` - Progressive disclosure specification command**

New unified entry point for all spec work. Routes to the right depth based on what you're building:

| Level | Use When | Output |
|-------|----------|--------|
| `/spec --quick` | Hours to days, clear scope | Linear issue |
| `/spec --feature` | 1-3 weeks, needs alignment | Lite PRD |
| `/spec --ai` | Any AI/ML/LLM work | Full spec with context requirements |

**Philosophy:** Write what's needed. Skip what's not. Embeds Linear Method principles (brevity, clarity, momentum).

**Deep dive options:**
- `--deep context` - Full 4D Canvas walkthrough
- `--deep examples` - Expand to 15-25 behavior examples
- `--deep rollout` - Detailed phased rollout with gates
- `--deep full-prd` - Complete 5-stage PRD framework

**New supporting commands:**

- **`/ai-debug`** - Diagnose why an AI feature is underperforming, hallucinating, or behaving inconsistently. Uses 4D audit (Demand, Data, Discovery, Defense) to find root cause.

- **`/context-check`** - Fast 5-point quality check before shipping. Validates: Relevance, Freshness, Sufficiency, Structure, Constraints.

**New skill: `spec`**

Core skill with progressive disclosure routing:
- Level 1: Quick task flow (Linear issue format)
- Level 2: Feature flow (Lite PRD)
- Level 3: AI feature flow (full spec + context requirements)
- Level 4: Deep dive expansions

Reference files in `skills/spec/references/`:
- `philosophy.md` - Linear Method principles
- `context-table.md` - Context requirements format guide
- `behavior-examples.md` - How to write good/bad/reject cases

### Changed

- **`/prd`** - Now routes through `/spec --feature` for unified experience. Use `/prd --deep` for full 5-stage PRD framework.

- **`prd-writer` skill** - Repositioned as deep reference for complex features. Use via `/spec --deep full-prd`.

- **`templates/ai-product-spec.md`** - Added Context Requirements section with availability table and fallback guidance.

### Archived

- **`context-engineering` skill** - Paths extracted to standalone commands:
  - Path 1 (Spec new) → `/spec --ai`
  - Path 2 (Diagnose) → `/ai-debug`
  - Path 3 (Quality check) → `/context-check`

  Original skill remains as reference for full 4D Context Canvas framework.

---

## [1.4.0] - 2026-01-XX

### Added - `/context-engineering` Skill

New skill for context engineering with AI features. Based on the 4D Context Canvas framework from Aakash Gupta and Miqdad Jaffer (OpenAI).

---

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
