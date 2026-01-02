---
description: Spec AI features using the 4D Context Canvas so they don't fail in production
---

# Context Canvas Command

**Most AI features fail before they reach the model.**

They fail because nobody defined the model's actual job. Nobody mapped what context it needs. Nobody figured out how to get that context at runtime. Nobody designed what happens when it breaks.

The 4D Context Canvas forces you to answer these questions *before* engineering starts.

**Works with:**
- **Linear MCP** - Can pull issue details, add spec as comment
- **Manual** - Describe the AI feature directly

## What This Does

Walks you through four dimensions that determine whether your AI feature ships or dies:

1. **DEMAND** - What's the model's actual job? (Not "make it smart")
2. **DATA** - What context does it need? Where does it live?
3. **DISCOVERY** - How will you get that context at runtime?
4. **DEFENSE** - What happens when it fails?

Output: A spec your engineers can actually build from.

## Usage

```
/context-canvas [issue-id or feature description]
```

**Examples:**
- `/context-canvas ENG-312` - Spec the AI feature in this issue
- `/context-canvas "AI-powered property recommendations"` - Spec from description
- `/context-canvas --add-comment` - Add spec to Linear issue

## What Happens

1. **Asks pointed questions** about each dimension
2. **Challenges vague answers** ("make it personalized" is not a spec)
3. **Surfaces hidden dependencies** you didn't know you had
4. **Produces an engineering-ready spec** with clear requirements

## Example Output

```
 4D CONTEXT CANVAS: AI Property Recommendations

Feature: Recommend properties to homeowners based on their situation

Overall Readiness: NEEDS WORK (2/4 dimensions clear)



D1  DEMAND: WHAT'S THE MODEL'S JOB?

The Transformation:
  VAGUE: "Recommend relevant properties to users"
  PRECISE: "Given a homeowner's equity position, local market trends,
           and stated goals, generate 3 property recommendations with
           explanations tied to their specific situation."

Job Spec:
  Produce: 3 ranked property recommendations with personalized rationale
  For whom: Homeowners with >$50K equity actively browsing listings
  Assumptions: User has stated buy/sell intent in last 90 days
  Constraints: Only show properties within user's affordability range
  Format: Structured cards with property details + 2-sentence "why this fits"
  Success: User clicks through to at least 1 recommendation (>15% CTR)

 Status: CLEAR - Model job is well-defined



D2  DATA: WHAT CONTEXT IS REQUIRED?

Context Requirements Table:

| Data Needed          | Source      | Availability | Sensitivity |
|---------------------|-------------|--------------|-------------|
| User equity estimate | Internal DB | Always       | PII         |
| Browsing history    | Analytics   | Always       | Internal    |
| Stated goals        | User input  | Sometimes    | Internal    |
| Local market trends | API         | Always       | Public      |
| Property listings   | MLS feed    | Always       | Public      |
| Affordability range | Calculated  | Sometimes    | PII         |

 PROBLEM IDENTIFIED:

"Stated goals" is marked "Sometimes" - what happens when user
hasn't explicitly stated their goals?

Options:
  A) Infer from browsing behavior (risky - might be wrong)
  B) Ask before showing recommendations (adds friction)
  C) Fall back to generic recommendations (defeats purpose)

 This needs a product decision before engineering starts.

 Status: BLOCKED - Missing decision on goal inference



D3  DISCOVERY: HOW WILL YOU GET THE CONTEXT?

Discovery Strategy:

1. User Context (real-time)
    Fetch from user profile service
    Latency: <100ms
    Reliability: 99.9%

2. Property Listings (precomputed)
    Nightly job indexes properties into vector DB
    Embeddings include: price, location, features, market position
    Refresh: Daily at 2am

3. Market Trends (cached)
    Refresh weekly from market data API
    Cache at zip code level
    TTL: 7 days

4. Goal Inference (if Option A chosen)
    Query last 30 days of browsing events
    Run lightweight classifier on activity patterns
    Confidence threshold: 0.7 (below = ask user)

Latency Budget:
  Total target: <2 seconds
  User context: 100ms
  Vector search: 500ms
  Model inference: 800ms
  Buffer: 600ms

 Status: MOSTLY CLEAR - Depends on D2 decision



D4  DEFENSE: WHAT HAPPENS WHEN IT FAILS?

1. Pre-Checks (before calling model):
    [ ] User has equity data? If not  show generic listings
    [ ] At least 10 properties in range? If not  expand range + note
    [ ] User active in last 90 days? If not  skip personalization

2. Post-Checks (after generation):
    [ ] All 3 properties still available? Filter stale listings
    [ ] Prices within affordability? Hard block if >120% of range
    [ ] Explanations reference user context? Flag generic outputs

3. Fallback Paths:
    Model timeout (>3s)  Show "top picks in your area" (non-AI)
    Low confidence  "Based on homes like yours..." (hedged language)
    No context available  Generic market recommendations + CTA to set preferences

4. Feedback Loops:
    Explicit: Thumbs up/down on each recommendation
    Implicit: Click-through tracking, time on recommended listings
    Learning: Weekly review of low-rated recommendations  improve prompts

 Status: NEEDS WORK - Fallback UX not designed



 CANVAS SUMMARY

D1 Demand:      CLEAR
D2 Data:        BLOCKED (goal inference decision needed)
D3 Discovery:   MOSTLY CLEAR (depends on D2)
D4 Defense:     NEEDS WORK (fallback UX undefined)

 NEXT STEPS

Before engineering starts:

1. DECISION NEEDED: How to handle missing user goals?
   - Schedule 30-min decision meeting with PM + Eng lead
   - Decide: Infer / Ask / Generic fallback

2. DESIGN NEEDED: Fallback UX
   - What does "generic recommendations" look like?
   - How do we explain "we don't know enough about you yet"?
   - Create mocks for degraded experience

3. THEN: Engineering can start on D3 (discovery infrastructure)
   - Vector DB setup
   - User context service integration
   - Caching layer for market data

Estimated time to unblock: 3-4 hours of PM work

Canvas framework: Aakash Gupta & Miqdad Jaffer
```

## The Four Dimensions

### D1 - DEMAND: Define the Model's Job Precisely

**The problem:** "Make it smart" is not a spec. Neither is "personalized recommendations."

**What you must define:**
- What must the model produce? (Specific output)
- For whom? (User segment)
- Under what assumptions? (What must be true)
- Using which constraints? (Boundaries)
- In what format? (Structure)
- With what definition of success? (Measurable)

**The transformation:**
- VAGUE: "Draft a status update"
- PRECISE: "Summarize key changes in project X since last report, structured for stakeholder Y, using the user's preferred tone, adhering to the company's reporting format."

**If you can't articulate it, the model can't do it.**

---

### D2 - DATA: Map the Context Requirements

**The problem:** Features assume context exists without verifying source, reliability, or structure.

**For each piece of context, specify:**
- **Data Needed:** The entity, document, metric, or signal
- **Source:** Where it lives (DB, API, logs, user input, cache)
- **Availability:**
  - Always (can be fetched 100% of the time)
  - Sometimes (depends on user actions or data freshness)
  - Never (must be requested explicitly or cannot be assumed)
- **Sensitivity:** PII, internal-only, restricted, public

**This surfaces hidden dependencies.** When you map honestly, you discover:
- Critical data that doesn't exist yet
- Sources that are unreliable
- Assumptions that will break at scale

---

### D3 - DISCOVERY: Runtime Context Discovery Strategy

**The problem:** Knowing what data you need is not the same as knowing how to get it.

**Discovery strategies:**

**Search-Based Retrieval:**
- Vector search (semantic similarity)
- Keyword search (precision)
- Hybrid search (best of both)

**Graph-Based Traversal:**
- Follow relationships through knowledge graph
- Navigate from starting entity to related objects

**Precomputed Context:**
- Daily/weekly jobs that populate caches
- Materialized views for expensive queries
- Pre-generated candidates for high-latency features

**Latency vs. Quality Trade-offs:**
- Which context must be real-time?
- Which can be precomputed?
- Which can degrade gracefully?

---

### D4 - DEFENSE: Guardrails, Fallbacks, and Feedback

**The problem:** AI will fail. Context will be missing. Data will be stale. The model will hallucinate.

**Defense is about detecting and correcting failures before users see them.**

**Four defense mechanisms:**

**1. Pre-Checks (before calling model):**
- "Do we have enough context to answer?"
- "Are required entities missing?"
- "Is the data too old or incomplete?"

**2. Post-Checks (after generation):**
- Did the answer follow constraints?
- Is it logically consistent?
- Does it match required schemas?

**3. Fallback Paths (when things break):**
- Partial answer with notes
- Clarifying questions
- Conservative defaults
- Non-AI fallback experience

**4. Feedback Loops (how to improve):**
- Explicit ratings
- Implicit behavior (edits, corrections)
- Pattern detection across mistakes

---

## When to Use This

**Before engineering starts on any AI feature.**

This is not a post-hoc checklist. It's a pre-build spec tool. The goal is to surface blockers and missing decisions *before* engineers write code.

**Use it when:**
- Speccing a new AI feature
- Reviewing an AI feature that feels underspecified
- Debugging why an AI feature keeps failing
- Helping engineers understand what "good" looks like

---

## Integration with Other Commands

**Before `/context-canvas`:**
- `/four-risks` - Validate the feature is worth building at all

**After `/context-canvas`:**
- `/ai-cost-check` - Model the unit economics
- `/ai-health-check` - Pre-launch validation

**The sequence:**
1. Is this worth building? (`/four-risks`)
2. How do we spec it correctly? (`/context-canvas`)
3. Can we afford it? (`/ai-cost-check`)
4. Is it ready to ship? (`/ai-health-check`)

---

## Requirements

- PM Thought Partner plugin installed
- **Optional:** Linear MCP for issue integration

---

## Learn More

**Source framework:**
- Aakash Gupta & Miqdad Jaffer: "The Ultimate Guide to Context Engineering for PMs"
- Product Growth Newsletter (2025)

**Related reading:**
- The 6 Layers of Context (Context Pyramid)
- The C.E.O. Framework (Capture, Enrich, Orchestrate)
- Context Quality Checklist

---

**Framework:** 4D Context Canvas (Aakash Gupta & Miqdad Jaffer)
**Best for:** Pre-build AI feature specification
**Key insight:** "If you cannot articulate the model's job, the model cannot do it. Most AI features fail before they reach the model."
**Remember:** Demand tells you what. Data tells you what to consume. Discovery tells you how to find it. Defense tells you how to prevent failure.
