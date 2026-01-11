---
description: Write a Product Requirements Document using Aakash Gupta's modern PRD framework (8/10 approach, quality over completeness)
---

# PRD Command

Write a **Product Requirements Document** following **Aakash Gupta's modern PRD framework**.

**Note:** `/prd` now routes through `/spec --feature` for the unified spec experience. For the full 5-stage PRD framework, use `/spec --deep full-prd`.

**Works with:**
- **Linear MCP** - Reads issue details, creates PRD from context
- **GitHub MCP** - Reads issue details, creates PRD from context
- **Manual** - Describe the feature directly

## Usage

```
/prd [issue-id]              # Routes to /spec --feature
/prd --deep                  # Full 5-stage PRD framework
```

**Examples:**
- `/prd ENG-245` - Start feature spec for specific issue
- `/prd --deep` - Full PRD with all 5 stages

## Instructions

**For standard PRD work:** Invoke the `spec` skill with `--feature` to use the Lite PRD flow. This covers:
- What problem are we solving?
- For whom?
- How do we know this matters?
- What are we building?
- How will we know it worked?

**For deep PRD work:** Invoke the `prd-writer` skill for the full 5-stage framework:
- Planning (Speclet)
- Kickoff
- Solution Review
- Launch Readiness
- Impact Review

**Core principle:** PRDs are about decisions, not documentation. Write what's needed, skip what's not.

---

**Framework:** Aakash Gupta (Product Growth), Linear Method
**Best for:** Feature documentation, alignment, shipping with confidence
