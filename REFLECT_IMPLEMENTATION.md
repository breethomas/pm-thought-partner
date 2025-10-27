# /reflect Implementation Guide

## Quick Start

**Goal:** Add session persistence to `/strategy-session` and build `/reflect` command.

**Time estimate:** 2-4 hours for MVP

## Step 1: Update /strategy-session to save sessions

### Edit: commands/strategy-session.md

**Find this section (around line 290):**

```markdown
Want me to:
1. Create Linear issues for user research + data analysis
2. Save this summary
3. Continue exploring
4. Wrap up
```

**Replace with:**

```markdown
Want me to:
1. Create Linear issues for user research + data analysis
2. Save this session for future reflection
3. Continue exploring
4. Wrap up
```

**Add new section after examples:**

```markdown
## Session Persistence

When PM chooses "Save this session", you should:

### 1. Create sessions directory

Check if `sessions/` directory exists in plugin root. If not:
- Create it
- Add note: "Created sessions/ directory (gitignored by default)"

### 2. Generate filename

Format: `YYYY-MM-DD-topic-slug.md`

Example: `2025-01-27-recommendation-engine.md`

**Rules:**
- Use system date (run `date +%Y-%m-%d` command to get it, don't guess)
- Topic slug: lowercase, hyphens, max 50 chars, derived from session topic
- If file exists, append number: `recommendation-engine-2.md`

### 3. Write session file

Use this template:

```markdown
# Strategy Session: [Topic]
**Date:** [Full date]
**Duration:** [Estimate from conversation length]
**Frameworks Applied:** [List frameworks you applied]

## Context
[Project name, current state, what triggered this session]

## Core Decisions
[Bullet list of concrete decisions made]

## Key Risks Identified
[Risks with severity levels: HIGH/MEDIUM/LOW]

## Prototypes to Build
[List of prototypes discussed]

## Open Questions
[Questions to answer, with action items if any]

## Next Actions
[Concrete next steps]

## Linear Issues Created
[List with issue IDs if any were created]

---
*Session saved by PM Thought Partner*
```

### 4. Confirm save

Message: "Session saved to sessions/2025-01-27-recommendation-engine.md. Run `/reflect` anytime to see patterns across your sessions."
```

## Step 2: Create /reflect command

### Create: commands/reflect.md

See REFLECT_SPEC.md for full command file content.

**Key implementation points:**

1. **Read session files:**
   - Use bash `find sessions/ -name "*.md"` to list files
   - Filter by date based on time range argument
   - Read each file with Read tool

2. **Parse sessions:**
   - Extract topic from `# Strategy Session: [Topic]`
   - Extract date from `**Date:** [Date]`
   - Extract decisions from `## Core Decisions` section
   - Extract frameworks from `**Frameworks Applied:**`
   - Extract open questions from `## Open Questions`

3. **Identify patterns:**
   - Count framework usage
   - Look for repeated themes in decisions
   - Track unresolved questions across sessions
   - Note changes in priorities over time

4. **Generate reflection:**
   - Use reflection template from spec
   - Be specific with examples
   - Highlight patterns clearly
   - Suggest actionable next steps

5. **Offer to save:**
   - If PM wants to save, write to `reflections/YYYY-wWW.md` (weekly) or `reflections/YYYY-MM.md` (monthly)

## Step 3: Update .gitignore

### Edit: .gitignore

Add:

```
# Strategy sessions and reflections (may contain sensitive product info)
sessions/
reflections/

# Users can opt-in to committing by removing from .gitignore
```

## Step 4: Update README

### Edit: README.md

**In "What This Does" section, add:**

```markdown
### Strategic Reflection

**`/reflect` - Pattern recognition across your decisions**

Review your strategic thinking over time:
- See patterns in decision-making
- Track which frameworks you use most
- Identify unresolved questions
- Weekly/monthly reflection ritual

Sessions are saved locally (gitignored by default for privacy).

**Start:** `/reflect` or `/reflect "this month"`
```

**In "What's Next" section, update to show /reflect as shipped:**

```markdown
## What's Next

This has a long way to go, but we're shipping to learn. Recently shipped:

- ✅ **Strategic reflection** - `/reflect` command to see patterns in your thinking over time

On the horizon:

- **PM onboarding workflows** - New job? Plugin reads repos, docs, recent issues, gives you a strategic brief on the domain and key decisions
- **Bidirectional sync** - Write comments, update issues, not just read them
- **Analytics tool integrations** - Bring product data (Amplitude, Mixpanel) into strategic conversations
- **Claude marketplace submission** - When it's ready

Want to contribute? See [Contributing](#contributing) below.
```

## Step 5: Test It

### Test Case 1: Save a session

```bash
# In Claude Code
/strategy-session "test feature"

# Have conversation
# At end, choose "Save this session"

# Verify:
ls sessions/  # Should see YYYY-MM-DD-test-feature.md
cat sessions/YYYY-MM-DD-test-feature.md  # Should see structured markdown
```

### Test Case 2: Run reflection with one session

```bash
/reflect

# Should see analysis of the one session
# Should prompt to run more sessions for better patterns
```

### Test Case 3: Run reflection with multiple sessions

```bash
# After saving 3-5 sessions over a few days
/reflect

# Should see:
# - List of all sessions
# - Pattern recognition
# - Framework usage
# - Unresolved questions
# - Suggested next steps
```

### Test Case 4: Time ranges

```bash
/reflect "last 2 weeks"
/reflect "this month"
/reflect "all time"
```

### Test Case 5: Save reflection

```bash
/reflect
# Say yes when asked to save
# Verify:
ls reflections/  # Should see YYYY-wWW.md
cat reflections/YYYY-wWW.md  # Should see reflection content
```

## Phase 1 MVP Checklist

- [ ] Update `/strategy-session` command to offer "Save this session"
- [ ] Implement session file creation with structured format
- [ ] Add sessions/ to .gitignore
- [ ] Create `/reflect` command file
- [ ] Implement basic reflection (last 7 days)
- [ ] Test with multiple sessions
- [ ] Update README to mention /reflect
- [ ] Commit and push

## Phase 2 Enhancements (Later)

- [ ] Time range parsing ("this month", "last 2 weeks")
- [ ] Save reflections to reflections/ directory
- [ ] Better pattern recognition
- [ ] Search across sessions
- [ ] Export reflections to different formats

## Tips for Implementation

**1. Use Claude Code to build it:**
- Ask Claude to read REFLECT_SPEC.md
- Ask Claude to implement based on spec
- Test iteratively

**2. Start simple:**
- Get session saving working first
- Then build basic /reflect
- Add enhancements later

**3. Use actual strategy sessions:**
- Run real /strategy-session conversations
- Save them
- Test /reflect with real data
- This will surface edge cases

**4. Demo in LinkedIn post:**
- Show /reflect output in your launch post
- "Here's a reflection on my last week of product thinking"
- Very shareable content

## Common Issues

**Issue: Claude doesn't know the date**
- Solution: Always run `date +%Y-%m-%d` command, don't let Claude guess

**Issue: Session files have weird formatting**
- Solution: Use exact template from spec, test markdown preview

**Issue: /reflect can't find sessions**
- Solution: Check sessions/ directory exists, files are .md, paths are correct

**Issue: Pattern recognition is generic**
- Solution: Be specific in prompts, use actual examples from sessions

## Ready to Implement?

You can either:

1. **Build it yourself:** Use this guide + REFLECT_SPEC.md
2. **Ask Claude Code to build it:** Share both docs with Claude and ask it to implement
3. **Pair on it:** Start with session saving, test, then build /reflect

Once built, you'll have a feature nobody else has. 🚀
