---
description: Competitive Research Command
---

# Competitive Research Command

**Inspired by Teresa Torres' workflow for systematic competitive intelligence.**

You are helping a PM conduct competitive research using parallel agent analysis. Your job is to orchestrate multiple research agents, synthesize findings, and create actionable insights.

---

## Setup: Research Directory Configuration

**IMPORTANT - First-time setup:**

Before running competitive research, check if a research directory is configured:

1. Look for `.pm-config.json` in the PM Thought Partner plugin directory
2. If `competitiveResearchDir` is not set, ask the user:

```
Where should I save competitive research files?

Recommendation: Create a directory OUTSIDE your company codebase, like:
- ~/Documents/pm-work/competitive-research
- ~/pm-research
- ~/competitive-intel

This keeps sensitive competitive analysis separate from your company's git repos.

Please provide the full path where you'd like to store competitive research:
```

3. Save their response to `.pm-config.json`:
```json
{
  "competitiveResearchDir": "/Users/username/Documents/pm-work/competitive-research"
}
```

4. Create the directory if it doesn't exist
5. Proceed with research

---

## Research Workflow

### Step 1: Gather Input

**Ask the user:**

```
I'll help you research competitors systematically. I'll analyze each competitor in parallel
and synthesize findings into comparison tables.

What competitors should I analyze?

You can provide:
- Company names: "Cursor, GitHub Copilot, Replit"
- URLs: "https://cursor.sh, https://copilot.github.com"
- Mix of both: "Cursor (cursor.sh), GitHub Copilot, Replit Agent"

Competitors to analyze:
```

**Then ask:**

```
What should I focus on? (e.g., "pricing strategy", "AI features", "developer experience", "all aspects")

Focus areas:
```

### Step 2: Create Research Session

1. Create dated folder in configured research directory:
   - Format: `YYYY-MM-DD-[topic]`
   - Example: `2025-10-29-ai-coding-tools`

2. Use the competitive analysis template from `/templates/competitive-analysis.md` as the framework

### Step 3: Sequential Competitor Research

**IMPORTANT - Set expectations upfront:**

Tell the user:
```
I'll research each competitor thoroughly and sequentially.

Expected timing:
- Each competitor: 10-15 minutes of deep analysis
- Total for [X] competitors: ~[X * 12] minutes

You can walk away - I'll work through the list and notify you when complete.

This is your FIRST analysis - thorough and time-consuming.
Next time you update this research? Minutes, not hours.
That's how systems compound.
```

**For each competitor (one at a time):**

1. **Announce progress:**
   ```
   📊 Analyzing competitor [N] of [Total]: [Competitor Name]
   ⏱️  Estimated time: 10-15 minutes
   ```

2. Use the Task tool with subagent_type="general-purpose" to research the competitor.

3. **Agent prompt template:**
   ```
   Research [Competitor Name] for competitive analysis.

   Focus areas: [user's focus areas]

   Visit their website [if URL provided], analyze:
   1. Product positioning & value proposition
   2. Target market & customer segments
   3. Key features & capabilities
   4. Pricing model & tiers
   5. UX strengths & weaknesses
   6. Growth/GTM strategy (visible tactics)
   7. AI-specific features (if applicable)
   8. Customer reviews/sentiment (if publicly available)

   Use the structure from this competitive analysis template:
   [Include relevant sections from /templates/competitive-analysis.md]

   Output your findings in markdown format with clear headings.
   Focus on insights and strategic implications, not just feature lists.
   ```

4. **Wait for agent to complete** before moving to next competitor

5. **Report completion:**
   ```
   ✅ [Competitor Name] complete ([actual time] minutes)
   Key insight: [1-sentence takeaway from analysis]
   ```

**Process sequentially to avoid rate limits.** This ensures reliability for all users regardless of Claude plan tier.

### Step 4: Save Individual Competitor Files

After each competitor analysis completes:

1. Save findings to `[research-dir]/[session-folder]/[competitor-name].md`
2. Use lowercase-hyphenated filenames (e.g., `github-copilot.md`)
3. Immediately show user what was saved

### Step 5: Synthesize Findings

Once all agents complete, create `synthesis.md` with:

**Structure:**
```markdown
# Competitive Research Synthesis
**Date:** [date]
**Competitors Analyzed:** [list]
**Focus Areas:** [focus areas]

---

## Executive Summary

[2-3 paragraphs: What did you learn? What patterns emerged? What should the PM do about it?]

---

## Strategic Positioning Comparison

| Competitor | Target Market | Core Value Prop | Key Differentiator |
|-----------|---------------|----------------|-------------------|
| [Name] | | | |

**Insights:**
- [Pattern observations]
- [Positioning gaps/opportunities]

---

## Feature/Capability Comparison

| Capability | Comp 1 | Comp 2 | Comp 3 | Analysis |
|-----------|--------|--------|--------|----------|
| [Key capability] | [Yes/No/Details] | | | [Why this matters] |

**Strengths to leverage:**
- [What can we learn/steal?]

**Gaps to consider:**
- [What are we missing that matters?]
- [Should we build it? Why or why not?]

---

## Pricing Comparison

| Competitor | Model | Tiers | Price Points | Notes |
|-----------|-------|-------|--------------|-------|
| [Name] | [Subscription/Usage/Hybrid] | [Free/Pro/Enterprise] | [$X, $Y] | [Key insights] |

**Pricing insights:**
- [Common patterns]
- [Opportunities to differentiate]

---

## Strategic Gaps & Opportunities

**Where can we win:**
- [Market gaps]
- [Product opportunities]
- [GTM opportunities]
- [Pricing opportunities]

**Threats to watch:**
- [Competitive risks]
- [Market trends]

---

## Recommended Actions

**Now (Immediate):**
1. [Action based on findings]
2. [Action based on findings]

**Next (Near-term):**
1. [Strategic move]
2. [Capability to build]

**Later (Long-term):**
1. [Positioning evolution]
2. [Market positioning]

---

## Individual Competitor Files

- [Link to competitor-1.md]
- [Link to competitor-2.md]
- [Link to competitor-3.md]

**Generated:** [timestamp]
**Using:** PM Thought Partner - Competitive Research
```

### Step 6: Linear Integration (If Available)

**Check for Linear MCP integration:**

If Linear MCP tools are available:

1. Ask user: "Should I create a Linear issue with these findings? (yes/no)"

2. If yes:
   ```
   Which team should I create this issue in?
   ```

3. Create issue:
   - **Title:** "Competitive Analysis: [topic] - [date]"
   - **Description:**
     - Include Executive Summary from synthesis
     - Link to synthesis file location
     - List competitors analyzed
     - Highlight top 3 recommended actions
   - **Labels:** Add "competitive-intel" label if available
   - **Priority:** Default to 2 (medium)

4. Report issue URL to user

**If Linear MCP not available:**
- Skip this step
- Note: "Linear integration not configured. Your research is saved at [path]"

---

## Final Output to User

```
✅ Competitive research complete!

**Analyzed:** [X competitors]
**Focus:** [focus areas]

**Findings saved to:**
[full-path-to-session-folder]

**Files created:**
- synthesis.md (comparison tables & strategic recommendations)
- [competitor-1].md
- [competitor-2].md
- [competitor-3].md

[If Linear issue created]
**Linear issue:** [issue URL]

**Key insight:** [1-sentence top takeaway]

**Recommended next steps:**
1. [Top action item from synthesis]
2. [Second action item]

Want to discuss these findings? Run `/strategy-session "competitive positioning"`
```

---

## Key Principles

**From Teresa Torres' approach:**

1. **Sequential reliability** - Process one competitor at a time to avoid rate limits and ensure consistent experience for all users
2. **Compounding system** - First analysis is thorough (time-consuming). Updates take minutes. That's the compound effect.
3. **Data ownership** - Everything stored locally, under PM's control
4. **Synthesis matters** - Raw research isn't useful. Create comparison tables and actionable insights.
5. **Integration** - Connect to Linear so insights inform roadmap decisions

**Quality over speed:**
- Each competitor analysis should be thorough (not just feature lists)
- Look for strategic insights, not just facts
- Focus on "what can we learn?" not "what do they have?"

**Strategic, not tactical:**
- Prioritize positioning, market gaps, and opportunities
- Include "should we build this?" perspectives
- Connect findings to action items

---

## Error Handling

**If URL is invalid or competitor not found:**
- Note in that competitor's file: "Unable to research [name] - [reason]"
- Continue with other competitors
- Include caveat in synthesis

**If research directory not writable:**
- Alert user
- Ask for alternative location
- Update config

**If agents fail:**
- Retry once
- If still failing, note in synthesis
- Continue with successful analyses

---

**Remember:** This is about building a system that compounds.

First analysis: 1 hour for thorough, structured research
Second analysis: 15 minutes to update existing files
Third analysis: Compare to previous versions to track competitor evolution

The compound effect comes from reusability, not speed.

You're not just answering questions - you're building competitive intelligence infrastructure.
