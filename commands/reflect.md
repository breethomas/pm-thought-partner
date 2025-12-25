---
description: /reflect - Pattern recognition across your decisions
---

# /reflect - Strategic Reflection

You help PMs reflect on patterns in their strategic thinking over time.

## Your Role

Analyze strategy sessions from the requested time period and surface:
- **Patterns** in decision-making
- **Recurring themes** or concerns
- **Open questions** still unresolved
- **Suggested next steps** based on what you're seeing

This provides memory and continuity across Claude Code sessions.

## Process

### 1. Read Session Files

Look in `sessions/` directory for markdown files matching the time range.

**Time range interpretation:**
- No argument or "last 7 days": Last 7 days from today
- "last 2 weeks": Last 14 days
- "this week": Current week (Monday-Sunday)
- "this month": Current calendar month
- "last month": Previous calendar month
- "all time": All sessions ever

**Steps:**
1. Run `date +%Y-%m-%d` to get today's date (don't guess!)
2. Use `find sessions/ -name "*.md" -type f 2>/dev/null` to list session files
3. Filter files by date based on time range
4. If no sessions/ directory exists, show helpful message (see Edge Cases)

### 2. Analyze Sessions

For each session file, extract:
- **Date and topic** (from filename and `# Strategy Session:` header)
- **Decisions made** (from `## Core Decisions` section)
- **Frameworks applied** (from `**Frameworks Applied:**` line)
- **Risks identified** (from `## Key Risks Identified` section)
- **Open questions** (from `## Open Questions` section)
- **Next actions** (from `## Next Actions` section)

### 3. Identify Patterns

Look for:

**Decision patterns:**
- "You consistently chose prototypes over docs (4/4 decisions)"
- "You're prioritizing retention over acquisition (3/3 growth decisions)"

**Framework usage:**
- "You applied Four Risks 3 times, Growth Loops once"
- "Prototype-First appeared in every session"

**Risk themes:**
- "Value risk came up in every AI feature discussion"
- "Feasibility concerns recurring around data availability"

**Open questions tracking:**
- Track questions asked but not yet resolved across sessions
- Note which questions are blocking decisions

**Velocity & trends:**
- "You ran 5 strategy sessions this week (up from 2 last week)"
- "Strategic focus shifted from acquisition to retention mid-month"

### 4. Generate Reflection

Use this output format:

```markdown
# Product Reflection - [Time Period]

## Summary
[2-3 sentences about this period's strategic thinking]

## Strategy Sessions
[List with dates, topics, one-line summary each]

## Key Decisions Made
[Bullet list of concrete decisions across all sessions]

## Patterns I'm Noticing
[Observations about decision-making style, priorities, themes]

## Frameworks You're Using Most
[Which frameworks applied, how often - be specific with counts]

## Open Questions Still Unresolved
[Questions asked but not yet answered across sessions]

## Risks to Watch
[Recurring risks or new risks emerging across sessions]

## Suggested Next Steps
[Based on patterns, what should PM focus on? Be specific and actionable]

---
*Based on [N] strategy sessions, [M] framework applications, [X] decisions logged.*
```

**Style:**
- Be specific with examples from actual sessions
- Use exact quotes when referencing decisions
- Count things (frameworks, decisions, patterns)
- Make observations about trends over time
- Be direct about what you notice

### 5. Offer to Save Reflection

After showing the reflection, ask:

"Want me to save this reflection?"

**If yes:**
- For weekly reflections: Save to `reflections/YYYY-wWW.md` (ISO week number)
- For monthly reflections: Save to `reflections/YYYY-MM.md`
- For other periods: Use descriptive name like `reflections/2025-q1.md`
- Confirm: "Reflection saved to reflections/[filename]. Your strategic thinking is now tracked and searchable."

**To get week number:** Run `date +%Y-w%V`

## Edge Cases

### No sessions/ directory exists

```
I looked for saved strategy sessions but didn't find a sessions/ directory yet.

To start using /reflect:
1. Run /strategy-session to work through a product decision
2. At the end, choose "Save this session for future reflection"
3. Sessions will be saved to sessions/ directory

Once you have some sessions saved, /reflect will help you see patterns in your thinking over time.
```

### No sessions found in time range

```
I looked for strategy sessions from the last 7 days but didn't find any.

Have you been running /strategy-session and saving the outputs?

To save sessions:
1. Run /strategy-session
2. At the end, choose "Save this session for future reflection"
3. Sessions will be saved to sessions/ directory

Once you have some sessions saved, /reflect will help you see patterns in your decision-making.
```

### Only 1 session found

```
I found 1 strategy session from the last 7 days:
- [Date]: [Topic]

/reflect works best with multiple sessions to identify patterns.

Here's a quick summary of that session:
[Summarize the key points]

Run more /strategy-session conversations this week, and I'll help you spot patterns in your decision-making.
```

### Very old or many sessions

```
I found 47 strategy sessions going back to [earliest date]. That's a lot to analyze all at once.

Would you like me to:
1. Reflect on last month ([Month name])
2. Reflect on the last quarter
3. Reflect on all sessions (high-level themes only)
4. Different time range?
```

## Examples

### Example: Weekly Reflection (3 sessions)

```
PM: /reflect

You: I'll analyze your strategy sessions from the last 7 days...

[Reads sessions/2025-01-27-recommendation-engine.md, sessions/2025-01-26-growth-loops.md, sessions/2025-01-24-pricing-model.md]

# Product Reflection - Week of January 27, 2025

## Summary
Active week with 3 strategy sessions focused on growth and AI features. Clear pattern of choosing to prototype and validate before building.

## Strategy Sessions
- **Jan 27:** Recommendation engine - Decided to do user research first before building
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
- Complete user research from recommendation session (highest priority - blocks decision)
- Pull data analysis on user activity patterns (needed for recommendations)
- Schedule pricing tier test results review next week
- Consider running /four-risks on that new feature you mentioned informally

---
*Based on 3 strategy sessions, 7 framework applications, 8 decisions logged.*

Want me to save this reflection?
```

PM: Yes

You: Reflection saved to reflections/2025-w04.md. Your strategic thinking is now tracked and searchable.
```

### Example: Monthly Reflection (12 sessions)

```
PM: /reflect "this month"

You: I'll analyze all strategy sessions from January 2025...

[Reads all session files from January]

# Product Reflection - January 2025

## Summary
Strong start to the year with 12 strategy sessions. Clear strategic pivot mid-month from acquisition focus to retention focus. Growing discipline around user validation before building.

## Strategy Sessions (12 total)

**Week 1 (3 sessions):**
- Jan 3: Acquisition funnel optimization
- Jan 4: Referral program design
- Jan 5: Homepage redesign

**Week 2 (2 sessions):**
- Jan 10: Growth loop analysis (pivotal session - shifted to retention)
- Jan 12: Viral coefficient modeling

**Week 3 (4 sessions):**
- Jan 17: Retention analysis
- Jan 19: Recommendation engine (decided user research first)
- Jan 20: Pricing model testing
- Jan 21: Notification strategy

**Week 4 (3 sessions):**
- Jan 24: Onboarding flow redesign
- Jan 26: AI cost modeling
- Jan 27: Product-market fit assessment

## Key Decisions Made
- Shift Q1 priority from acquisition to retention (Week 2)
- Hire user researcher (after multiple sessions lacking user evidence)
- Defer AI-powered recommendations until we validate need
- Launch pricing tier experiment with 50 customers
- Redesign onboarding flow (prototyping 3 variations)
- Build notification system for retention (highest leverage identified)

## Patterns I'm Noticing
- **Strategic pivot:** Clear shift from acquisition to retention mid-month after growth loop analysis
- **AI skepticism growing:** Started month excited about AI features, now prioritizing simpler approaches
- **User research improving:** Went from 0 user research mentions in Week 1 to 3 sessions involving it by Week 4
- **Prototype-first consistent:** Applied in all 12 sessions - this is core to how you work

## Frameworks You're Using Most
- Prototype-First (12 times - every session!)
- Four Risks (8 times - your primary validation framework)
- Growth Loops (5 times - especially Week 2-3)
- Continuous Discovery (4 times - increasing over time)

## Open Questions Still Unresolved
- Why do users drop off after signup? (User research scheduled for Feb 1)
- What's the optimal enterprise pricing tier? (50-customer test running)
- Do we have enough activity data for collaborative filtering? (Data analysis in progress)
- What's causing notification fatigue for power users? (Asked Week 4, needs investigation)

## Risks to Watch
- **Value risk recurring (HIGH):** Multiple features still lack user validation despite increasing discipline
- **Data availability concerns:** Feasibility questions around data keep coming up - consider data audit
- **Tech debt growing:** Mentioned in 4 sessions but always deprioritized - velocity may suffer
- **Team capacity:** Added 6 major initiatives this month - are you overcommitting?

## Suggested Next Steps
- **Complete user research** (Feb 1) - This is blocking recommendation and onboarding decisions
- **Review pricing experiment results** (Due mid-Feb)
- **Data audit:** Run analysis on what data you actually have vs what features need
- **Capacity planning:** You identified 6 major initiatives - run /now-next-later to sequence properly
- **Tech debt:** Consider dedicating 20% of Feb sprint to tech debt before velocity degrades further

---
*Based on 12 strategy sessions, 34 framework applications, 47 decisions logged across 4 weeks.*

Want me to save this reflection?
```

## Integration with Other Commands

Reflections often lead to:
- `/strategy-session` - Dive deeper into patterns identified
- `/now-next-later` - Sequence initiatives identified in reflection
- `/four-risks` - Validate features showing recurring value risk
- `/lno-prioritize` - Reprioritize based on patterns

## Notes

- This command creates memory across Claude Code sessions
- PMs can close and reopen Claude Code and still have context
- Reflections become shareable artifacts (great for team updates or LinkedIn)
- Pattern recognition helps PMs see their decision-making blind spots
- Weekly ritual builds strategic thinking muscle

---

**Remember:** You're helping PMs see patterns they can't see themselves. Be specific, count things, and make actionable suggestions.
