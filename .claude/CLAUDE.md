# PM Thought Partner Plugin Development

## Project Context

This is an **open-source Claude Code plugin** for product managers.
It provides PM frameworks, skills, and thought partnership for product decisions.

**Repository:** https://github.com/breethomas/bette-think

## Architecture

This repo is a **marketplace** (named `breethomas`) containing one plugin (`bette-think`).

```
.claude-plugin/
  marketplace.json       # Marketplace config (name: breethomas)
plugins/
  bette-think/    # The plugin
    .claude-plugin/
      plugin.json        # Plugin manifest
    skills/              # Skills (the main interface)
    agents/              # Specialized analysis agents
    frameworks/          # Framework documentation
    thought-leaders/     # Profiles of PM thinkers
    templates/           # Templates for common PM tasks
    sources.yml          # Attribution for all frameworks
ideas/                   # Future feature concepts (repo-level)
sessions/                # Strategy session outputs (gitignored)
```

## Technology Stack

- Claude Code skills (markdown files in `plugins/bette-think/skills/`)
- Framework documentation (markdown in `plugins/bette-think/frameworks/`)
- Thought leader profiles (markdown in `plugins/bette-think/thought-leaders/`)
- No build process - pure markdown

## Code Style & Conventions

**Markdown files:**
- Clear, actionable skill prompts
- Well-structured with headers
- Include examples where helpful
- Reference sources in `sources.yml`

**File naming:**
- Lowercase with hyphens (e.g., `four-fits.md`, not `fourFits.md`)
- Descriptive names that match skill names

**Skills:**
- Conversational, not lecture-style
- Ask probing questions
- Push toward prototypes and user research
- Challenge assumptions

## Development Workflow

**When adding new skills:**
1. Research the framework/concept thoroughly
2. Add attribution to `sources.yml`
3. Create skill directory in `plugins/bette-think/skills/`
4. Update README.md if it's a major addition
5. Test the skill works as expected

**When updating existing skills:**
- Preserve the conversational style
- Keep it opinionated but not prescriptive
- Ensure it pushes back, doesn't just agree

## Quality Standards

- Reference publicly available content (articles, podcasts, books)
- Provide attribution to original thinkers
- Focus on frameworks and mental models (not just tactics)
- Maintain AI-era first perspective
- No proprietary or copyrighted content
- No generic PM advice without framework backing

## Plugin Philosophy

**"Your sparring partner, not your assistant."**

- Challenges assumptions
- Asks tough questions
- Pushes toward prototypes over docs
- Opinionated and curated
- AI-era first

## Git & Versioning

- Commit messages should be clear and descriptive
- Tag releases when publishing new versions
- Keep changelog updated for significant changes
- Version bump in `plugins/bette-think/.claude-plugin/plugin.json`

## Community & Open Source

- This plugin is MIT licensed
- Contributions welcome
- All frameworks must be publicly available and attributed
- Built to be useful for any PM, not just the author

## Testing Changes

When working on skills:
- Test in a separate directory first
- Verify the skill produces useful output
- Check that it's conversational and challenging
- Ensure it doesn't just validate ideas without pushback

---

*Project-specific rules for bette-think plugin development*
