# Responsible Vibe Coding Workflow for PMs

## Overview
A structured workflow that enables product managers to leverage AI coding tools (vibe coding) for learning and prototyping without creating "slop code" that engineering teams have to deal with or technical debt in existing codebases.

## Problem / Opportunity

**The tension:**
The AI era enables PMs to code prototypes and explore technical solutions faster than ever. But there's a growing concern in engineering circles about "vibe coding" producing low-quality code that:
- Gets submitted as PRs to production codebases without proper review
- Creates technical debt engineers have to clean up
- Doesn't follow codebase conventions or architectural patterns
- Works superficially but breaks in edge cases

**The opportunity:**
PMs can use AI-assisted coding as a learning tool and prototyping method WITHOUT creating problems for their engineering teams—if they follow a disciplined workflow that separates exploration from production.

**The missing piece:**
There's no widely-adopted workflow that helps PMs understand:
- When vibe coding is appropriate vs when to hand off to engineering
- How to prototype in a way that respects existing codebases
- What boundaries to maintain between PM exploration and production code
- How to present vibe-coded prototypes to engineers as learning artifacts, not deliverables

## Proposed Approach

### The Core Workflow Principles

**1. Separate Sandboxes from Production**
- Never vibe code directly in the production codebase
- Create explicit "exploration" directories or repositories
- Mark all vibe-coded work as prototypes, not production-ready

**2. Learn the Architecture Before You Code**
- Before attempting to code anything engineers will review, spend time understanding:
  - The existing codebase structure
  - Architectural patterns the team uses
  - Testing conventions
  - Code quality standards
- Use AI to help you learn, not to bypass learning

**3. Set Explicit Checkpoints**
Clear decision points for when to:
- Continue exploring in sandbox mode
- Show prototype to engineering for feedback
- Hand off to engineering for production implementation
- Abandon the exploration

**4. Frame Prototypes as Questions, Not Solutions**
When showing vibe-coded work to engineers, present it as:
- "Here's what I learned about the problem"
- "Does this approach make sense architecturally?"
- "What am I missing about how this should work?"

NOT as:
- "Here's the implementation, just clean it up"
- "Can you make this production-ready?"

### The Pre-Coding Checklist

Before writing any code you expect engineers to look at:

**☐ Have I read enough of the existing codebase to understand:**
- File structure and organization?
- Naming conventions?
- How similar features are implemented?
- Testing patterns?

**☐ Am I coding in the right place?**
- Sandbox/exploration directory? ✓ Safe to vibe code
- Production codebase? ✗ Slow down, coordinate with engineering

**☐ What's my success criteria?**
- Learning how something works?
- Demonstrating a concept?
- Validating technical feasibility?
- Creating production code? ← If this, stop and talk to engineering first

**☐ How will I present this to engineering?**
- As a learning artifact?
- As a prototype to discuss?
- As a technical spike to inform decision?
- As a PR for production? ← Don't do this without coordination

**☐ Do I understand the limitations?**
- What edge cases am I not handling?
- What about security, performance, scalability?
- What architectural concerns am I ignorant about?
- Be explicit about what you don't know

### The Workflow Stages

**Stage 1: Learn (Read-Only)**
- Use AI to explain existing code
- Ask questions about architecture
- Understand patterns before attempting to replicate them
- Build mental model of how things work

**Stage 2: Sandbox Exploration**
- Create separate exploration directory/repo
- Vibe code freely to test concepts
- Focus on "does this make sense?" not "is this production-ready?"
- Document what you learned, not just what you built

**Stage 3: Reality Check**
- Show prototype to engineering as learning artifact
- Ask: "Am I thinking about this correctly?"
- Get feedback on approach before investing more time
- Be ready to throw away code and start fresh with engineering

**Stage 4: Handoff (NOT Integration)**
- If the concept is validated, engineering implements it properly
- Your prototype informed the conversation but isn't the deliverable
- You may pair with engineering to maintain context
- The production code may look nothing like your prototype—that's OK

**Stage 5: Retrospective**
- What did vibe coding help you understand?
- What problems did it create?
- What would you do differently next time?
- Share learnings with other PMs

## Example Usage

### Example 1: Exploring a New Feature Concept

**Scenario:** PM wants to prototype a new dashboard feature

**Good workflow:**
```bash
# Create exploration space
mkdir explorations/dashboard-prototype
cd explorations/dashboard-prototype

# Vibe code the concept
# Use AI to help build a working demo
# Document: "Here's what I learned about the data requirements"

# Show to engineering
"I prototyped this dashboard concept to understand the data model.
Does this approach make sense? What am I missing about how
our data pipeline works?"

# Engineering provides feedback
"Interesting! The concept works, but we'd need to restructure
the API to support real-time updates. Let's spec that out together."

# Outcome: Prototype informed direction, no slop code in production
```

**Bad workflow:**
```bash
# PM codes directly in production codebase
# Submits PR: "New dashboard feature - please review"
# Engineering has to explain why it won't work with the architecture
# Time wasted, relationship strained
```

### Example 2: Understanding Technical Feasibility

**Scenario:** PM needs to know if a feature is technically possible

**Good workflow:**
```markdown
## Pre-Work
1. Read relevant parts of codebase to understand current implementation
2. Ask AI to explain architectural constraints
3. Create small proof-of-concept in sandbox
4. Document findings

## Presentation to Engineering
"I wanted to understand if we could add real-time collaboration.
I built this tiny prototype to test the concept.
It works in my sandbox, but I'm sure I'm missing complexity.
What would it really take to build this?"

## Outcome
Engineering explains: "Concept is sound, but you'd need:
- WebSocket infrastructure
- Conflict resolution logic
- Database transaction changes
- Security model updates
That's ~8 weeks of work, not 2 weeks"

PM now has informed understanding to prioritize against
```

### Example 3: Learning from Codebase

**Scenario:** PM wants to understand how authentication works

**Good workflow:**
- Use AI to explain authentication code
- Ask questions about why it's structured that way
- Maybe write tiny test code to verify understanding
- Use knowledge to write better product specs
- NOT: Attempt to refactor authentication system

## Open Questions

### Tooling & Infrastructure
- Should companies create explicit "PM sandbox" environments?
- How do we make it easy to spin up exploration spaces?
- What guardrails prevent accidental PRs to production?

### Cultural & Organizational
- How do we shift engineering perception of PM vibe coding from "annoying" to "valuable"?
- What level of code literacy should PMs aim for?
- How do we train PMs to know their boundaries?

### Workflow & Process
- When should PM prototyping happen in the product development cycle?
- How do we prevent prototypes from becoming "well you already built it, just finish it"?
- What documentation bridges prototype → production handoff?

### Measurement
- How do we measure if vibe coding helped or hurt?
- What leading indicators show PMs are doing this responsibly vs irresponsibly?
- How do we quantify learning without creating pressure to produce code?

### Edge Cases
- What about PMs who were engineers and can actually write production code?
- How do we handle small teams where PM and engineer roles blur?
- What about open source contributions where PM wants to contribute?

## References / Inspiration

**Current workflow (from prompt-engineering-for-pms.md):**
- Prototype-first development (lines 544-560)
- "Write prompt → Test with real scenarios → Iterate → Show working prototype"
- This applies to prompts, but the same principle applies to code exploration

**Industry discussion:**
- Engineering concerns about "AI slop code"
- PM technical literacy debates
- AI-assisted coding best practices

**Related concepts:**
- Technical spikes in Agile (time-boxed exploration, throwaway code expected)
- Prototyping fidelity (knowing when low-fi vs high-fi is appropriate)
- Exploratory programming vs production engineering

## Related Ideas

- [Future idea: PM Technical Literacy Levels]
- [Future idea: Sandbox Environment Templates]
- [Future idea: Engineering-PM Pairing Patterns in AI Era]
