---
description: Write a Product Requirements Document using Aakash Gupta's modern PRD framework (8/10 approach, quality over completeness)
---

# PRD Command

Write a **Product Requirements Document** following **Aakash Gupta's modern PRD framework**.

**Works with:**
- **Linear MCP** - Reads issue details, creates PRD from context
- **GitHub MCP** - Reads issue details, creates PRD from context
- **Manual** - Describe the feature directly

## Usage

```
/prd [issue-id]
/prd --step [planning|kickoff|solution-review|launch-readiness|impact-review]
/prd --checklist
```

**Examples:**
- `/prd ENG-245` - Start PRD for specific issue
- `/prd --step kickoff` - Work on kickoff stage
- `/prd --checklist` - Show checklist for current stage

## Instructions

**IMPORTANT:** Invoke the `prd-writer` skill to access the full PRD framework.

The skill contains comprehensive guidance including:
- The 5-stage PRD evolution (Planning → Kickoff → Solution Review → Launch Ready → Impact Review)
- AI-specific PRD requirements (behavior contracts with 15-25 examples, red-team lists)
- Quality checklists for each stage
- Common antipatterns to avoid
- Output format guidelines and templates
- Domain-specific guidance (traditional features, AI/ML features, infrastructure, experiments)

**Workflow:**
1. If an issue ID is provided, fetch the issue details first (via Linear or GitHub MCP)
2. Identify the user's current PRD stage
3. Use the prd-writer skill to guide through the relevant checklist
4. Help create quality content: user evidence, impact sizing, counter metrics, compelling narrative
5. Apply the "8/10 quality" philosophy - decisions over documentation

**Core principle:** PRDs are about decisions, not documentation. When building fast becomes easy (thanks to AI), knowing what to build becomes even more important.

---

**Framework:** Aakash Gupta (Product Growth)
**Best for:** Feature documentation, alignment, shipping with confidence
