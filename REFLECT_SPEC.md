# /reflect Command - Specification

## Overview

The `/reflect` command helps PMs consolidate their strategic thinking over time by analyzing patterns across strategy sessions. It provides memory and continuity across Claude Code sessions.

## Problem Being Solved

**Current state:**
- Strategy sessions are ephemeral (lost when Claude Code closes)
- No way to see patterns in decision-making over time
- No memory of what was discussed yesterday/last week
- Hard to share strategic thinking with team

**With `/reflect`:**
- Persistent session history
- Pattern recognition across decisions
- Weekly/monthly reflection ritual
- Shareable strategic artifacts

## File Structure

```
pm-thought-partner/
├── commands/
│   ├── strategy-session.md (existing)
│   └── reflect.md (NEW)
├── sessions/           (NEW - gitignored by default, user can opt-in)
│   ├── 2025-01-27-recommendation-engine.md
│   ├── 2025-01-26-growth-loops.md
│   └── 2025-01-24-pricing-model.md
└── reflections/        (NEW - gitignored by default, user can opt-in)
    ├── 2025-w04.md
    └── 2025-01.md
```

### Why gitignore by default?

Sessions contain company strategy, product decisions, competitive insights. Most PMs won't want this in their repo.

**But:** Provide `.gitignore.example` that users can modify if they DO want to commit their strategic thinking.

## Session File Format

**File name:** `YYYY-MM-DD-topic-slug.md`

**Example:** `2025-01-27-recommendation-engine.md`

**Content structure:**

```markdown
# Strategy Session: Recommendation Engine
**Date:** January 27, 2025
**Duration:** 23 minutes
**Frameworks Applied:** Four Risks, Prototype-First, Fine-tuning vs RAG

## Context
- Project: E-commerce Platform (Next.js + Rails)
- Current state: 50K active users, post-signup engagement drop
- Trigger: PM exploring AI-powered recommendations

## Core Decisions
- Target post-signup engagement drop (not homepage recommendations)
- Start with user interviews before building
- If we build: collaborative filtering first, not AI (simpler, faster to test)

## Key Risks Identified
- **Value (HIGH):** No evidence users want recommendations here
- **Feasibility (MEDIUM):** Cold start problem - need 500+ users with activity
- **Viability (LOW):** Adds 150ms page load - acceptable?

## Prototypes to Build
- 3 recommendation UI patterns to test (after user research)
- Static recommendations (human-curated) vs algorithmic

## Open Questions
- Why do users drop off after signup? (Talk to 10 users)
- Do we have enough activity data for collaborative filtering?
- What's our cold start strategy for new users?

## Next Actions
- Schedule user interviews this week
- Pull user activity data analysis
- Don't build yet - validate problem first

## Linear Issues Created
- ENG-245: User research - post-signup drop-off interviews
- ENG-246: Data analysis - user activity patterns for recommendations

---
*Session saved by PM Thought Partner*
```

## /strategy-session Updates

**At end of session, after showing summary:**

```
Want me to:
1. Create Linear issues for user research + data analysis
2. Save this session for future reflection
3. Continue exploring
4. Wrap up
```

**If PM chooses "Save this session":**

1. Create `sessions/` directory if it doesn't exist
2. Generate filename: `YYYY-MM-DD-topic-slug.md`
3. Write session file with full structured output
4. Confirm: "Session saved to sessions/2025-01-27-recommendation-engine.md. Run `/reflect` anytime to see patterns across your sessions."

**Implementation notes:**
- Use date from system (not Claude's potentially wrong date)
- Topic slug: lowercase, hyphens, max 50 chars
- If file exists, append number: `2025-01-27-recommendation-engine-2.md`

## /reflect Command

### Usage

```bash
/reflect                    # Last 7 days
/reflect "last 2 weeks"     # Last 14 days
/reflect "this month"       # Current month
/reflect "last month"       # Previous month
/reflect "all time"         # Everything
```

### Command File: commands/reflect.md

```markdown
# /reflect - Strategic Reflection

You help PMs reflect on patterns in their strategic thinking over time.

## Your Role

Analyze strategy sessions from the requested time period and surface:
- **Patterns** in decision-making
- **Recurring themes** or concerns
- **Open questions** still unresolved
- **Suggested next steps** based on what you're seeing

## Process

### 1. Read Session Files

Look in `sessions/` directory for markdown files matching the time range.

**Time range interpretation:**
- "last 7 days" / no argument: Last 7 days
- "last 2 weeks": Last 14 days
- "this week": Current week (Mon-Sun)
- "this month": Current calendar month
- "last month": Previous calendar month
- "all time": All sessions ever

### 2. Analyze Sessions

For each session file, extract:
- Date and topic
- Decisions made
- Frameworks applied
- Risks identified
- Open questions
- Next actions

### 3. Identify Patterns

Look for:
- **Decision patterns:** "You consistently chose prototypes over docs (4/4 decisions)"
- **Framework usage:** "You applied Four Risks 3 times, Growth Loops once"
- **Risk themes:** "Viability risk mentioned in every AI feature discussion"
- **Open questions still unresolved:** Track what's been asked but not answered
- **Velocity:** "You ran 5 strategy sessions this week (up from 2 last week)"

### 4. Generate Reflection

**Output format:**

```markdown
# Product Reflection - [Time Period]

## Summary
[2-3 sentences about this period]

## Strategy Sessions
[List with dates, topics, one-line summary each]

## Key Decisions Made
[Bullet list of concrete decisions]

## Patterns I'm Noticing
[Observations about decision-making style, priorities, themes]

## Frameworks You're Using Most
[Which frameworks applied, how often]

## Open Questions Still Unresolved
[Questions asked but not yet answered across sessions]

## Risks to Watch
[Recurring risks or new risks emerging]

## Suggested Next Steps
[Based on patterns, what should PM focus on?]

---
*Based on [N] strategy sessions, [M] framework applications, [X] decisions logged.*
```

### 5. Offer to Save

Ask if PM wants to save this reflection:
- If yes: Save to `reflections/YYYY-wWW.md` (for weekly) or `reflections/YYYY-MM.md` (for monthly)
- Weekly reflections: ISO week number (w01, w02, etc.)
- Monthly reflections: Month number (01, 02, etc.)

## Examples

### Example 1: Weekly Reflection

```
PM: /reflect

You: I'll analyze your strategy sessions from the last 7 days...

[Reads sessions/2025-01-27-recommendation-engine.md, sessions/2025-01-26-growth-loops.md, sessions/2025-01-24-pricing-model.md]

# Product Reflection - Week of January 27, 2025

## Summary
Active week with 3 strategy sessions focused on growth and AI features. Clear pattern of choosing to prototype and validate before building.

## Strategy Sessions
- **Jan 27:** Recommendation engine - Decided to do user research first
- **Jan 26:** Growth loops - Identified retention loop as priority over acquisition
- **Jan 24:** Pricing model - Prototyping 3 pricing tiers with 10 customers

## Key Decisions Made
- Prototype recommendation engine UI before building infrastructure
- Focus on retention loop this quarter (defer acquisition loop)
- Test 3 pricing tiers with existing customers before launch
- Use collaborative filtering over AI recommendations (simpler, faster)

## Patterns I'm Noticing
- **Prototype-first:** You chose to prototype over document in all 3 sessions
- **User validation:** Consistently prioritizing talking to customers before building
- **Simplicity bias:** Choosing simpler approaches when they'll work (collaborative filtering over AI)

## Frameworks You're Using Most
- Four Risks (3 times) - Your go-to for feature validation
- Prototype-First (3 times) - Core to your decision-making
- Growth Loops (1 time)

## Open Questions Still Unresolved
- Why do users drop off after signup? (Asked Jan 27, user research scheduled)
- What's optimal pricing for enterprise tier? (Asked Jan 24, testing in progress)
- Do we have enough data for collaborative filtering? (Asked Jan 27, needs data analysis)

## Risks to Watch
- **Value risk recurring:** Multiple features lacking user evidence (recommendations, pricing tiers)
- **Data gaps:** Questions about whether we have enough data keep coming up

## Suggested Next Steps
- Complete user research from recommendation session (highest priority)
- Pull data analysis on user activity patterns (blocks recommendation decision)
- Schedule pricing tier test results review
- Consider running /four-risks on that new feature you mentioned informally

---
*Based on 3 strategy sessions, 7 framework applications, 8 decisions logged.*

Want me to save this reflection?
```

PM: Yes

You: Reflection saved to reflections/2025-w04.md. Your strategic thinking is now tracked and searchable.
```

### Example 2: Monthly Reflection

```
PM: /reflect "this month"

You: I'll analyze all strategy sessions from January 2025...

[Reads all January session files]

# Product Reflection - January 2025

## Summary
Strong start to the year with 12 strategy sessions across growth, AI features, and monetization. Clear shift mid-month from acquisition focus to retention focus.

## Strategy Sessions (12 total)
**Week 1 (3 sessions):**
- Acquisition funnel optimization
- Referral program design
- Homepage redesign

**Week 2 (2 sessions):**
- Growth loop analysis
- Viral coefficient modeling

**Week 3 (4 sessions):**
- Retention analysis
- Recommendation engine (pivoted to user research)
- Pricing model testing
- Notification strategy

**Week 4 (3 sessions):**
- Onboarding flow redesign
- AI cost modeling
- Product-market fit assessment

## Key Decisions Made
[List of major decisions across month]

## Patterns I'm Noticing
- **Strategic pivot:** Shifted from acquisition to retention focus mid-month
- **AI skepticism growing:** Started month excited about AI features, now prioritizing simpler approaches
- **User research cadence improving:** Went from 0 to 3 user research sessions planned

## Frameworks You're Using Most
- Four Risks (8 times)
- Growth Loops (5 times)
- Prototype-First (12 times - every session!)

## Open Questions Still Unresolved
[Track questions across entire month]

## Risks to Watch
[Month-long themes]

## Suggested Next Steps
[Strategic recommendations for February]

---
*Based on 12 strategy sessions, 34 framework applications, 47 decisions logged.*

Want me to save this reflection?
```

## Edge Cases

### No Sessions Found

```
You: I looked for strategy sessions from the last 7 days but didn't find any.

Have you been running /strategy-session and saving the outputs?

To save sessions:
1. Run /strategy-session
2. At the end, choose "Save this session"
3. Sessions will be saved to sessions/ directory

Once you have some sessions saved, /reflect will help you see patterns in your thinking.
```

### Only 1 Session Found

```
You: I found 1 strategy session from the last 7 days (Jan 27 - Recommendation Engine).

/reflect works best with multiple sessions to identify patterns.

For now, here's a quick summary of that session:
[Summarize the one session]

Run more /strategy-session conversations this week, and I'll help you spot patterns in your decision-making.
```

### Very Old Sessions

```
You: I found 47 strategy sessions from 2024. That's a lot to analyze all at once.

Would you like me to:
1. Reflect on last month (December 2024)
2. Reflect on Q4 2024
3. Reflect on all of 2024 (high-level themes only)
4. Something else?
```

## .gitignore Updates

Add to `.gitignore`:

```
# Strategy sessions and reflections (may contain sensitive product info)
sessions/
reflections/

# Users can opt-in to committing by removing from .gitignore
```

Add to README "Installation" section:

```markdown
### Privacy Note

By default, `/strategy-session` outputs and `/reflect` summaries are saved locally but gitignored.

**If you want to commit your strategic thinking:**
1. Remove `sessions/` and `reflections/` from `.gitignore`
2. Commit to your repo (or team repo)
3. Now your product thinking is version-controlled and searchable

**Why gitignore by default?** Sessions contain company strategy, competitive insights, and product decisions that most PMs won't want in their git history.
```

## Success Metrics

PM should be able to:

1. ✅ Run strategy session Monday
2. ✅ Close Claude Code
3. ✅ Open Claude Code Friday
4. ✅ Run `/reflect` and see Monday's session
5. ✅ Identify patterns in their decision-making
6. ✅ Share weekly reflection with their team
7. ✅ Search old sessions for specific topics

## Implementation Priority

**Phase 1 (MVP):**
- [ ] Add "Save session" option to `/strategy-session`
- [ ] Create session file with structured format
- [ ] Build `/reflect` command (last 7 days only)
- [ ] Update .gitignore

**Phase 2 (Polish):**
- [ ] Add time range options ("last 2 weeks", "this month")
- [ ] Save reflections to `reflections/` directory
- [ ] Better pattern recognition (ML-style insights)

**Phase 3 (Future):**
- [ ] `/search-sessions "pricing"` - Search across all sessions
- [ ] `/compare` - Compare decisions across time periods
- [ ] Export reflections to different formats (slides, PDF)

---

*This spec is ready for implementation. Start with Phase 1 MVP.*
