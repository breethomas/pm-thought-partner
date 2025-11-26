# PM Thought Partner Plugin Development

## Project Context

This is an **open-source Claude Code plugin** for product managers.
It provides PM frameworks, slash commands, and thought partnership for product decisions.

**Repository:** https://github.com/breethomas/pm-thought-partner

## Technology Stack

- Claude Code slash commands (markdown files in `commands/`)
- Framework documentation (markdown in `frameworks/`)
- Thought leader profiles (markdown in `thought-leaders/`)
- No build process - pure markdown and shell scripts

## Code Style & Conventions

**Markdown files:**
- Clear, actionable command prompts
- Well-structured with headers
- Include examples where helpful
- Reference sources in `sources.yml`

**File naming:**
- Lowercase with hyphens (e.g., `four-fits.md`, not `fourFits.md`)
- Descriptive names that match command names

**Commands:**
- Conversational, not lecture-style
- Ask probing questions
- Push toward prototypes and user research
- Challenge assumptions

## Project Structure

```
commands/          # Slash commands (the main interface)
frameworks/        # Framework documentation
thought-leaders/   # Profiles of PM thinkers
templates/         # Templates for common PM tasks
ideas/            # Future feature concepts
sessions/         # Strategy session outputs (gitignored)
sources.yml       # Attribution for all frameworks
```

## Development Workflow

**When adding new commands:**
1. Research the framework/concept thoroughly
2. Add attribution to `sources.yml`
3. Create command in `commands/`
4. Update README.md if it's a major addition
5. Test the command works as expected

**When updating existing commands:**
- Preserve the conversational style
- Keep it opinionated but not prescriptive
- Ensure it pushes back, doesn't just agree

## Quality Standards

✅ Reference publicly available content (articles, podcasts, books)
✅ Provide attribution to original thinkers
✅ Focus on frameworks and mental models (not just tactics)
✅ Maintain AI-era first perspective
❌ No proprietary or copyrighted content
❌ No generic PM advice without framework backing

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

## Community & Open Source

- This plugin is MIT licensed
- Contributions welcome (see CONTRIBUTING.md)
- All frameworks must be publicly available and attributed
- Built to be useful for any PM, not just Bree

## Testing Changes

When working on commands:
- Test in a separate directory first
- Verify the command produces useful output
- Check that it's conversational and challenging
- Ensure it doesn't just validate ideas without pushback

---

*Project-specific rules for pm-thought-partner plugin development*
