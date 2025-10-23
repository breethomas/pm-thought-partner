# AI Product Spec Guide

**Philosophy:** AI products need more upfront thinking than traditional features - but that doesn't mean overly complex docs.

Focus on the AI-specific risks: How will you test quality? What will it cost? How will you handle failures?

---

## The Core Questions (Always answer these)

### What's the AI doing?
[What problem? What will AI do? Link to prototype.]

### How will you know if it's good?
[What does "good" output look like? What's "bad"?]

### How will you test it?
[Eval strategy - even simple evals are better than none]

### What will it cost?
[Cost per query/user, projected at scale]

### What happens when it's wrong?
[User controls, fallbacks, safety]

---

## Additional Sections (Use What You Need)

Pick the sections that matter for your specific feature. Skip the rest.

---

### 🎯 Success Criteria

**Use when:** You need to define quality thresholds

**Good output:**
[Examples or criteria]

**Bad output / Failure modes:**
[What should never happen]

**Pass criteria:**
[X% accuracy, success rate, user feedback score]

---

### 🧪 Evaluation Strategy

**Use when:** You're building evals (which you should!)

**Test dataset:**
- [ ] Happy path (common cases)
- [ ] Edge cases
- [ ] Adversarial (trying to break it)
- [ ] Boundary (out of scope)

**Example test cases:**
```
Test 1: [Type]
Input: [Example]
Expected: [What should happen]

Test 2: [Type]
Input: [Example]
Expected: [What should happen]
```

**How you'll run evals:**
- On every change
- Before deployment
- Continuously in production

**See:** `frameworks/ai/ai-evals.md` for full guide

---

### 💰 Unit Economics

**Use when:** Building anything that uses LLM APIs

**Cost per interaction:**
```
Input tokens:  [avg X] × $[rate] = $[cost]
Output tokens: [avg X] × $[rate] = $[cost]
Total: $[X] per query
```

**Projected usage:**
- Month 1: [X users] × [Y queries] = $[Z]
- Month 12: [X users] × [Y queries] = $[Z]

**Cost optimization:**
- [ ] Model routing (cheap → expensive as needed)
- [ ] Caching (similar queries)
- [ ] Context optimization (RAG, not full docs)
- [ ] Prompt efficiency

**Revenue model:**
How does this affect pricing/margins?

**See:** `frameworks/ai-era-practices/ai-unit-economics.md`

---

### 🏗️ Technical Approach

**Use when:** Team needs to understand architecture

**Model:** [GPT-4, Claude, custom, etc. - and why]

**Approach:**
- [ ] Simple prompt
- [ ] RAG (retrieval + generation)
- [ ] Multi-step agent
- [ ] Fine-tuned model

**Key components:**
1. [Component] - [purpose]
2. [Component] - [purpose]

**Prompt strategy:**
[How you're structuring prompts, optimizing tokens]

---

### 🎮 User Experience

**Use when:** Interaction design matters

**User flow:**
1. User does [X]
2. AI processes
3. AI responds [Y]
4. User can [Z]

**User controls:**
- [ ] Edit AI output
- [ ] Regenerate
- [ ] Provide feedback
- [ ] Override/ignore
- [ ] See AI reasoning

**Agency level:**
- V1: AI suggests, user decides (start here!)
- Later: AI acts with user approval
- Much later: AI acts autonomously

---

### 🛡️ Safety & Guardrails

**Use when:** There are safety/brand risks

**Content safety:**
[Risks and how you're mitigating]

**Scope boundaries:**
[What AI should NOT do, how you enforce]

**Privacy/compliance:**
[Data handling, PII, regulations]

---

### 📊 Monitoring & Calibration

**Use when:** Planning production operations

**Metrics to track:**
- Quality: [success rate, user feedback]
- Performance: [latency, uptime]
- Cost: [daily spend, per user]

**Alerts when:**
- [Metric] drops below [threshold]
- [Metric] exceeds [threshold]

**Feedback loop:**
How you'll collect failures → improve → redeploy

**Cadence:**
Weekly reviews, monthly deep dives, quarterly calibrations

---

### 🚀 Rollout

**Use when:** Launch strategy matters

**Phase 1:** [Internal, beta, X% rollout]
**Phase 2:** [Gradual increase]
**Phase 3:** [Full launch]

**Kill switch:**
When and how you'd turn it off if needed

---

### ⚠️ Risks

**Use when:** Addressing concerns or unknowns

**Four Risks:**
- Value (will users want it?): ⬜ Low ⬜ Med ⬜ High
- Usability (can users use it?): ⬜ Low ⬜ Med ⬜ High
- Feasibility (can we build it?): ⬜ Low ⬜ Med ⬜ High
- Viability (business model works?): ⬜ Low ⬜ Med ⬜ High

**AI-specific risks:**
- Hallucinations
- Inconsistent quality
- Cost overrun
- Prompt injection
- Inappropriate output

[For each: How you're mitigating]

---

### 📅 Timeline

**Use when:** Team needs sequencing

- **Now:** [Current work]
- **Next:** [After launch if successful]
- **Later:** [Future enhancements]

---

## Real Examples

### Example 1: Simple AI Feature

**What:** AI-powered email subject line suggestions. User types email body, gets 3 subject line options.

**Prototype:** [link] - tested with 10 users, strong positive response.

**Good output:** Relevant, attention-grabbing subjects. Diverse styles (not all the same).

**Bad output:** Generic subjects, inappropriate content, hallucinated company details.

**Evals:** 50-case test dataset. Target: 70%+ rated "good" by human review. Automated evals run on every prompt change.

**Cost:** ~$0.01 per generation. Projected: 10K users × 20% usage × 2 suggestions/email = ~$800/month.

**Optimization:** Using GPT-4o (fast + cheap), concise prompts, caching common patterns.

**User control:** Shows 3 options, user clicks to use or ignores. Can regenerate. Thumbs up/down feedback.

**Failure handling:** If API fails, feature hidden gracefully (doesn't block email sending).

**Rollout:** Internal dogfood (1 week) → Beta (20% users, 2 weeks) → Full launch.

**Monitoring:** Track usage rate, thumbs up/down, cost per user. Alert if cost >$1500/month or thumbs up <60%.

---

### Example 2: More Complex AI Feature

**What:** AI code review assistant. Analyzes PRs, suggests improvements, catches bugs.

**Prototype:** [link] - tested internally, caught 3 real bugs developers missed.

**Success criteria:**
- Catches actual bugs (true positives >80%)
- Doesn't flag correct code (false positives <20%)
- Explains issues clearly
- Suggests fixes

**Eval dataset:**
- 100+ code samples (bugs, security issues, valid code, style preferences)
- Tests for: null pointer bugs, SQL injection, memory leaks, false positives
- Run on every model/prompt change
- Alert if accuracy drops below 75%

**Technical:**
- Model: GPT-4 (quality critical for code)
- Approach: RAG (retrieve relevant docs/patterns) + code analysis
- Context optimization: Only send diff + surrounding context (not full repo)

**Cost:**
- $0.05 per review (larger context windows)
- 1000 PRs/month = $50/month
- Acceptable for team productivity gain

**User experience:**
- AI posts comments in PR (like human reviewer)
- Dev can accept/dismiss each suggestion
- Dev can ask follow-up questions
- Clear "AI generated" label

**Safety:**
- No code sent to model training (contractual guarantee)
- Private repos stay private
- No PII/credentials leaked in logs

**Risks:**
- False positives annoying devs: Medium → Mitigate with high accuracy evals
- Missing critical bugs: High → Never claim 100% coverage, supplement human review
- Cost spike if usage higher: Medium → Monitor and alert

**Rollout:**
- Week 1-2: Internal team only (10 devs)
- Week 3-4: Beta (engineering org, 50 devs)
- Week 5+: All devs if feedback positive

**Kill switch:** Feature flag. Turn off if accuracy drops or devs complain.

---

## How to Use This Guide

### Start with the Core Questions
That might be all you need for simple features.

### Add Sections as Needed
More complex = more planning required.
But don't fill out sections just to fill them out.

### Prototype First
Build and test before you write lengthy specs.
This doc should reflect learnings from prototyping.

### Evals are Non-Negotiable
Even simple evals > no evals.
You need to test quality somehow.

### Model Costs Early
AI has real marginal costs. Don't get surprised at scale.

### Plan for Iteration
AI products need continuous calibration.
They're not "ship and forget."

---

## Integration with Standard PRD

This is **in addition to** normal product thinking:
- Problem, solution, metrics (standard PRD)
- **Plus** evals, costs, safety, calibration (AI-specific)

You still need product-market fit. You still need good UX.
AI doesn't replace product management - it adds new considerations.

---

## Related Frameworks

- **AI Evals:** `frameworks/ai/ai-evals.md`
- **AI Unit Economics:** `frameworks/ai-era-practices/ai-unit-economics.md`
- **Prototype First:** `frameworks/ai-era-practices/prototype-first.md`
- **Four Risks:** `frameworks/discovery/four-risks.md`

---

## Remember

The goal isn't comprehensive documentation.

The goal is shipping high-quality AI features that:
- Actually work (evals)
- Don't bankrupt you (unit econ)
- Fail gracefully (safety)
- Improve over time (calibration)

Write what creates shared understanding. Skip the rest. Move fast.

---

**Pro tip:** If your eval strategy is "we'll see how it goes in prod," you're not ready to ship.
