# PM Thought Partner

**Your sparring partner, not your assistant.**

A Claude Code plugin that challenges your product thinking. You don't memorize commands—you have conversations. Describe your problem, and Claude will ask hard questions, push back on weak reasoning, and guide you to proven frameworks.

Built for the AI era. Grounded in [proven frameworks from industry leaders](thought-leaders/).

---

## How to Use This

**Just talk.** Start with what you're trying to figure out:

> "I'm building an AI feature that recommends which clients to call. Help me think through it."

> "We're planning our next cycle. I have three pitches competing for the same slot."

> "My AI feature is hallucinating. I don't know why."

Claude will:
- Ask clarifying questions
- Challenge assumptions ("What evidence do you have?")
- Surface relevant frameworks
- Push you toward prototypes and user conversations
- Help you write specs, pitches, or issues when you're ready

**You don't need to know the commands.** But if you want shortcuts, here are the ones that matter most.

---

## Top Commands

### `/strategy-session`
Start any product conversation. Claude gathers context, then works through the problem with you.

```
/strategy-session "should we build AI recommendations or improve search first?"
```

### `/spec --ai`
Spec an AI feature with context requirements, behavior examples, and eval strategy.

```
/spec --ai
```

### `/shape`
Shape work using Shape Up methodology. Walk through appetite, solution sketching, rabbit holes, and output a pitch.

```
/shape "notifications for upcoming appointments"
```

### `/linear-calibrate`
Analyze your Linear workspace against best practices. Get health indicators and specific recommendations.

```
/linear-calibrate
```

### `/start-evals`
Set up AI evals without overengineering. Create your first 20 test cases in a spreadsheet.

```
/start-evals
```

**[See all commands →](commands/)**

---

## Agents

Seven specialized agents handle research and analysis tasks. They run autonomously and return structured output.

| Agent | What It Does | Triggered By |
|-------|--------------|--------------|
| `linear-workspace-analyzer` | Workspace health against Linear methodology | `/linear-calibrate` |
| `project-health-checker` | Single project deep-dive (On Track/At Risk/Stalled) | `/project-health` |
| `team-organization-analyzer` | Team conventions and patterns | `/issue-audit` |
| `ai-cost-analyzer` | AI feature economics and viability | `/ai-cost-check` |
| `ai-implementation-auditor` | Pre-launch readiness (6 dimensions) | `/ai-health-check` |
| `competitor-researcher` | Individual competitor analysis | `/competitive-research` |
| `eval-generator` | Create AI test cases | `/start-evals` |

**[Browse agents →](agents/)**

---

## What's Inside

**Frameworks** from leading product thinkers—discovery, growth, planning, measurement, and AI-native development.

**[Browse frameworks →](frameworks/)** · **[Meet the thought leaders →](thought-leaders/)**

**Linear & GitHub integration** for backlog analysis, issue creation, and workspace health checks.

**AI-era focus**: context engineering, evals, cost modeling, production AI systems. Not just classic PM—built for what's next.

---

## Install

Ask Claude Code:

```
Install the PM Thought Partner plugin from
https://github.com/breethomas/pm-thought-partner
```

**[Full setup guide →](INSTALL_PLUGIN.md)**

---

## Philosophy

This plugin won't just agree with you. It will:

- Ask for evidence before accepting assumptions
- Suggest prototypes over PRDs
- Challenge you to talk to users
- Push back when thinking is fuzzy

**Opinionated. Curated. AI-era first.**

---

## Contributing

PM frameworks evolve. Contributions welcome.

**[See sources.yml for attribution](sources.yml)** · **[Browse ideas](ideas/)**

---

MIT License. Built with Claude Code by [Bree Thomas](https://github.com/breethomas).
