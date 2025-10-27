---
description: Find your growth loop or stay stuck in linear acquisition hell
---

# Growth Loops Command

**If you're buying all your growth, you're doing it wrong.**

Most PMs think about growth as a funnel: spend money → acquire users → hope they stick. That's expensive and doesn't compound.

Growth loops are different: users create value → that value attracts more users → they create more value. It compounds.

**Works with:**
- **Linear MCP / GitHub MCP** - Optional: Can attach analysis to an issue
- **Manual** - Provide product context (recommended)

## What This Does

Identifies if your product has (or could have) compounding growth:
- **Viral loops** - Users invite users
- **Content loops** - User-generated content attracts organic traffic
- **Network effects** - More users = more value
- **Paid loops** - Revenue funds acquisition (only if efficient)

Then tells you which loop fits your product and how to build it.

**Philosophy:** "Growth isn't a funnel that leaks. It's a loop that compounds." - Elena Verna

## Usage

```
/growth-loops [product/feature]
```

**Examples:**
- `/growth-loops` - Analyze current product for loop opportunities
- `/growth-loops "referral program"` - Design loop for specific feature
- `/growth-loops --map` - Map existing user flows to loop types
- `/growth-loops --velocity` - Focus on loop speed optimization
- `/growth-loops ENG-245` - Analyze Linear issue for growth potential

## What Happens

1. **Understands your product:**
   - What's the core value proposition?
   - Who are the users?
   - What's the typical user journey?
   - Where does viral potential exist?

2. **Identifies loop opportunities** across 4 types:
   - **Viral loops** (users invite users)
   - **Content loops** (UGC attracts organic traffic)
   - **Network effects** (more users = more value)
   - **Paid loops** (revenue funds acquisition)

3. **Maps the loop structure:**
   - Input → Action → Output → New Input
   - Where does the cycle reinforce?
   - What makes the loop sustainable?

4. **Analyzes loop velocity:**
   - How long does one loop cycle take?
   - Faster loops compound faster
   - Optimization opportunities

5. **Returns growth loop design** with implementation suggestions

## Example Output

```
🔄 Growth Loops Analysis: Project Management Tool

CURRENT STATE:
Primary growth: Sales-led (no loops)
User acquisition: Paid ads + outbound sales
Retention: 80% (strong)

GROWTH LOOP OPPORTUNITIES IDENTIFIED:

---

🔄 LOOP #1: Viral Invite Loop (HIGH POTENTIAL)

Type: Direct Viral Loop

Structure:
1. User creates project → Invites team members (OUTPUT)
2. Team members sign up to collaborate (NEW INPUT)
3. New users create their own projects → Invite more people (CYCLE)

Why This Works:
- Product requires collaboration (natural invite trigger)
- Value increases with team size (incentive to invite)
- Frictionless invite flow

Current Velocity: N/A (loop doesn't exist yet)
Potential Velocity: 2-3 days (project creation → invite → signup)

Implementation:
✅ Make project sharing core to workflow (not optional)
✅ Reward project creators for team invites (unlock features at 3+ users)
✅ Email invites with project preview (show value before signup)
✅ Reduce invite friction (one-click, no form)

Expected Impact:
- Viral coefficient: 0.5-1.0 (each user invites 1-2 others)
- Could reduce CAC by 30-50%
- Compounds over time (more projects → more invites)

Blockers:
- Current product works for solo users (no forcing function for teams)
- Invite flow requires 4 clicks (too much friction)

---

🔄 LOOP #2: Content/SEO Loop (MEDIUM POTENTIAL)

Type: User-Generated Content Loop

Structure:
1. Users create public project templates (OUTPUT)
2. Templates rank in Google (SEO traffic)
3. New users discover via search, sign up (NEW INPUT)
4. New users create their own templates (CYCLE)

Why This Works:
- Templates are inherently shareable
- Long-tail SEO opportunity (thousands of use cases)
- Users want recognition (incentive to publish)

Current Velocity: N/A (templates are private)
Potential Velocity: 2-4 weeks (template creation → indexing → discovery)

Implementation:
✅ Add "publish as public template" option
✅ SEO optimization for template pages
✅ Creator credit + profile (incentive to share)
✅ Template marketplace with search

Expected Impact:
- 10-20% of users might publish templates
- Could drive 5-10% of new signups via organic
- Compounds slowly (more templates → more keywords → more traffic)

Blockers:
- Templates currently don't exist as feature
- Would need moderation system
- Privacy concerns (users default to private)

---

🔄 LOOP #3: Network Effect Loop (LOW POTENTIAL - Not Natural Fit)

Type: Multi-sided Network Effect

Why It Doesn't Fit:
- Your product is team-based, not a marketplace
- Value comes from YOUR team, not the platform
- You're trying to force a network effect that doesn't exist

STOP trying to build network effects. Your product doesn't support them.

Focus on viral loop (team invites) and content loop (public templates) instead.

---

🔄 LOOP #4: Paid Loop (MEDIUM POTENTIAL - Already Exists)

Type: Revenue → Acquisition Loop

Structure:
1. Users pay subscription (REVENUE)
2. Revenue funds paid ads (INPUT)
3. Ads bring new users (OUTPUT)
4. New users become paying customers (CYCLE)

Current State:
- LTV: $1,200
- CAC: $400
- Ratio: 3:1 (healthy)
- Payback: 6 months

Optimization Opportunities:
✅ Improve conversion (free → paid) by 10% → Can spend 10% more on ads
✅ Reduce churn by 5% → LTV increases 20% → Can spend 20% more on ads
✅ Increase pricing by $5/mo → LTV +15% → More ad budget

This loop is working but could be 30% more efficient.

---

📊 LOOP COMPARISON

| Loop Type | Potential | Velocity | Effort to Build | Recommendation |
|-----------|-----------|----------|-----------------|----------------|
| Viral Invite | HIGH | 2-3 days | Medium | ✅ Build this first |
| Content/SEO | MEDIUM | 2-4 weeks | High | 💡 Consider for Phase 2 |
| Network Effects | LOW | N/A | N/A | ❌ Not natural fit |
| Paid (exists) | MEDIUM | 30 days | Low (optimize) | ✅ Optimize current loop |

---

🎯 RECOMMENDATIONS

Phase 1 (Next Quarter): Build Viral Invite Loop
Priority Actions:
1. Make collaboration core to product (not optional)
2. Reduce invite friction to 1 click
3. Add team unlock at 3+ members (incentive)
4. Track viral coefficient weekly

Success Metrics:
- Viral coefficient >0.5 (each user invites 0.5+ others)
- 30% of new signups from invites (vs 0% today)
- Loop velocity <3 days (creation → invite → signup)

Phase 2 (6 months): Add Content Loop
Priority Actions:
1. Build public template marketplace
2. SEO optimize template pages
3. Creator profiles + credit
4. Moderation system

Success Metrics:
- 10% of users publish templates
- 5% of signups from organic template search
- 500+ public templates in first 6 months

Continue: Optimize Paid Loop
- Improve free → paid conversion by 10%
- Reduce churn by 5%
- Increase ad spend efficiency

---

🔧 LOOP VELOCITY OPTIMIZATION

For Viral Invite Loop (fastest impact):

Current friction points:
1. Users don't realize product is better with team
2. Invite button buried in settings
3. Invite requires recipient email + message (4 clicks)
4. No incentive to invite before project is complex

Optimization:
1. Onboarding shows "invite team" as step 2 (after first project)
2. "Invite" button on every project (always visible)
3. One-click invite with pre-filled message
4. Unlock premium features at 3+ team members

Expected velocity improvement: 7 days → 2 days
(Users currently take 7 days to consider invites, would drop to 2)

Faster loop = more cycles per year = more compounding growth

---

💡 KEY INSIGHTS

✅ STRENGTHS:
- Strong retention (80%) enables loops to compound
- Product has natural collaboration trigger
- Users are sticky (low churn means loop sustains)

⚠️ WEAKNESSES:
- No loops currently exist (all acquisition is paid)
- Product works solo (no forcing function for viral)
- Invite friction is high (4 clicks, low completion)

🚀 BIGGEST OPPORTUNITY:
Viral Invite Loop could reduce CAC by 30-50% while growing faster. Build this first.

📋 NEXT STEPS:
1. Run /four-fits to validate product-channel fit for viral
2. Prototype invite flow redesign (make it 1-click)
3. A/B test team unlocks (do users invite more with incentive?)
4. Track viral coefficient weekly after launch
5. Rerun /growth-loops after viral loop ships (measure actual velocity)

Full framework: frameworks/growth/growth-loops.md
```

## Growth Loop Types

### 1. Viral Loops
Users invite users directly.

**Examples:**
- Dropbox referral (both get storage)
- Slack (team invites)
- Figma (share designs)

**When it fits:**
- Product has multi-player value
- Users naturally want to invite others
- Network size increases value

**Velocity:** Fast (hours to days)

---

### 2. Content Loops
User-generated content attracts organic traffic.

**Examples:**
- Yelp reviews (rank in Google)
- Pinterest pins (visual search)
- Stack Overflow answers (SEO)

**When it fits:**
- Users create public content
- Content is searchable/shareable
- Long-tail SEO opportunity

**Velocity:** Slow (weeks to months)

---

### 3. Network Effect Loops
More users = more value for everyone.

**Examples:**
- Marketplaces (more buyers → more sellers → more buyers)
- Social networks (more friends = more value)
- OpenTable (more diners → more restaurants)

**When it fits:**
- Multi-sided platform
- Value scales with total users
- Critical mass required

**Velocity:** Medium (weeks)

---

### 4. Paid Loops
Revenue funds acquisition.

**Examples:**
- SaaS with positive CAC/LTV
- E-commerce with repeat purchases
- Subscription products

**When it fits:**
- LTV > CAC (healthy unit economics)
- Reliable conversion rates
- Scalable acquisition channels

**Velocity:** Medium to slow (30+ days)

---

## Loop Velocity Analysis

```
/growth-loops --velocity
```

Focuses on **how fast** loops cycle:

**Why velocity matters:**
- Faster loops compound faster
- More cycles per year = more growth
- Small velocity improvements = big compounding gains

**Example:**
- Loop A: 7-day cycle (52 cycles/year)
- Loop B: 2-day cycle (182 cycles/year)
- Loop B compounds 3.5x faster

**Optimization strategies:**
- Reduce friction in invite flow
- Automate parts of the loop
- Incentivize faster action
- Remove approval/review delays

---

## Integration Options

### With Linear
- Analyzes product/feature issues for loop potential
- Tags issues with loop type (viral, content, network, paid)
- Creates loop optimization backlog

### Manual
- Describes your product and gets loop analysis
- Outputs loop diagrams in markdown
- Provides implementation checklist

### GitHub
- Reviews feature specs for growth mechanics
- Tags PRs that implement loop components

## Requirements

- ✅ PM Thought Partner plugin installed
- ✅ **Optional:** Linear MCP for issue integration

## Common Use Cases

### Product Strategy Review
```
/growth-loops
```
Identify which loops your product should build

### Feature Prioritization
```
/growth-loops "referral program"
```
Validate growth impact before building

### Growth Audit
```
/growth-loops --map
```
Map all existing user flows to loop types, find gaps

### Velocity Optimization
```
/growth-loops --velocity
```
Speed up existing loops for more compounding

## Learn More

**Full frameworks:**
- `frameworks/growth/growth-loops.md` - Elena Verna's complete framework
- `frameworks/growth/four-fits.md` - Brian Balfour's validation (complements loops)
- `frameworks/growth/product-led-sales.md` - Elena Verna on PLG + loops

**Related commands:**
- `/four-fits` - Validate product-channel fit for viral loops
- `/lno-prioritize` - Leverage tasks often = building loops
- `/now-next-later` - Roadmap loop implementations

---

**Framework:** Growth Loops (Elena Verna)
**Best for:** Designing sustainable, compounding growth
**Key insight:** "Growth isn't a funnel that leaks. It's a loop that compounds."
**Remember:** Retention is the foundation. Without retention, loops won't compound. Fix retention first.
