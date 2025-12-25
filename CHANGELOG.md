# Changelog

All notable changes to PM Thought Partner will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
