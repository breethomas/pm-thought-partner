# Using PM Thought Partner with Claude Projects (Web)

**For PMs who prefer using Claude in the browser (claude.ai) instead of Claude Code CLI.**

## What Are Claude Projects?

Claude Projects allow you to create persistent conversations with custom instructions and knowledge. Think of it as creating a specialized version of Claude that knows about PM frameworks.

**Perfect for:**
- PMs who work primarily in the browser
- Teams who want to share PM framework knowledge
- Anyone not comfortable with terminal/CLI tools

## Setup Instructions

### Step 1: Create a New Project

1. Go to [claude.ai](https://claude.ai)
2. Click on **"Projects"** in the left sidebar
3. Click **"Create Project"**
4. Name it: **"PM Thought Partner"**
5. (Optional) Add a description: "AI-era product management frameworks and guidance"

### Step 2: Add Custom Instructions

This tells Claude to act as your PM thought partner using the frameworks.

1. In your new project, click **"Add custom instructions"**
2. Go to the [SKILL.md file on GitHub](https://github.com/breethomas/pm-thought-partner/blob/main/SKILL.md)
3. Click **"Raw"** to see the plain text version
4. **Copy the entire content** (Cmd+A, Cmd+C on Mac or Ctrl+A, Ctrl+C on Windows)
5. **Paste it** into the custom instructions field in your Claude Project
6. Click **"Save"**

**What this does:** Claude will now follow the PM Thought Partner philosophy—pushing you toward prototyping, challenging assumptions with proven frameworks, and applying AI-era practices.

### Step 3: Add Framework Files (Optional but Recommended)

You can upload specific framework files as project knowledge so Claude has easy access to detailed frameworks.

**Recommended files to upload:**

**Core Frameworks (choose 3-5 most relevant to you):**
- `frameworks/ai-era-practices/prototype-first.md`
- `frameworks/ai-era-practices/organizational-ai-adoption.md` (CODER)
- `frameworks/discovery/continuous-discovery.md`
- `frameworks/growth/four-fits.md`
- `frameworks/measurement/pmf-survey.md`

**How to upload:**
1. Go to the [GitHub repository](https://github.com/breethomas/pm-thought-partner)
2. Navigate to the framework file you want
3. Click **"Raw"** and save the file (Cmd+S or Ctrl+S)
4. In your Claude Project, click **"Add content"** → **"Upload files"**
5. Upload the saved markdown files

**Note:** Claude Projects have limits on uploaded files. Start with 3-5 most relevant frameworks, not all of them.

### Step 4: Add Thought Leader Profiles (Optional)

Upload 2-3 thought leader profiles relevant to your work:

**Popular choices:**
- `thought-leaders/teresa-torres.md` (discovery)
- `thought-leaders/brian-balfour.md` (growth, CODER)
- `thought-leaders/ravi-mehta.md` (strategy, AI integration)
- `thought-leaders/aman-khan.md` (AI products)

Upload the same way as framework files.

## How to Use Your Project

### Start a Conversation

Once set up, start conversations in your PM Thought Partner project just like you would with regular Claude:

**Example prompts:**
- "I'm trying to figure out if we have product-market fit"
- "Help me prioritize my roadmap for next quarter"
- "We're adding an AI feature—what do I need to think about?"
- "Should I write a PRD or prototype first?"
- "How do we drive AI adoption across our organization?"

### What to Expect

Claude will:
- ✅ Challenge your assumptions with proven frameworks
- ✅ Push you toward prototyping over documentation
- ✅ Apply frameworks from thought leaders (Teresa Torres, Brian Balfour, etc.)
- ✅ Reference specific frameworks you've uploaded
- ✅ Help you think strategically while shipping fast

## Tips for Best Results

### 1. Reference Specific Frameworks

If you've uploaded framework files, you can ask:
- "Walk me through the continuous discovery framework"
- "Apply the Four Fits to our growth strategy"
- "Help me run a PMF survey like Rahul Vohra"

### 2. Share Context About Your Product

The more Claude knows about your situation, the better the guidance:
- Stage (0-1, PMF, growth, scale)
- Product type (B2B SaaS, consumer, marketplace, AI product)
- Your role (PM, founder, product leader)
- Current challenge

**Example:**
> "I'm a PM at an early-stage B2B SaaS company. We think we have PMF but aren't sure. We have 50 paying customers and 80% retention. How do I validate if we're actually there?"

### 3. Ask for Templates

If you need to create deliverables:
- "Give me a lite PRD template"
- "Help me write a Linear-style issue for this feature"
- "Create a competitive analysis for [competitors]"

### 4. Iterate with Follow-ups

Have a conversation, don't just ask one question:
- Challenge the advice Claude gives
- Ask "why" and "how"
- Request examples
- Dig deeper into specific frameworks

## Limitations vs. Claude Code

**What works in Projects:**
- ✅ All PM frameworks and guidance
- ✅ Custom instructions (PM thought partner behavior)
- ✅ Framework files you upload (up to the limit)
- ✅ All the wisdom from thought leaders

**What doesn't work:**
- ❌ Automatic file reading from your computer
- ❌ Tool integration (can't automatically create files, run commands)
- ❌ Full access to all 13 frameworks at once (file upload limits)

**Workaround:** Use the [Prompt Library](./prompts/) for specific frameworks you need but haven't uploaded.

## Updating Your Project

As new frameworks are added to the PM Thought Partner:

1. Check the [GitHub repository](https://github.com/breethomas/pm-thought-partner) for updates
2. Download updated SKILL.md or new framework files
3. Update your project's custom instructions or add new files

**To stay updated:** Watch/star the GitHub repo to get notified of new frameworks.

## Sharing with Your Team

Want your whole team to have access?

**Option 1: Each person creates their own**
- Follow these instructions
- Takes ~5 minutes per person

**Option 2: Share via Organizational Projects** (if available)
- Some Claude plans support shared team projects
- Set it up once, whole team has access

## Troubleshooting

**"Claude isn't using the frameworks"**
- Make sure you pasted the SKILL.md content into custom instructions
- Try being more explicit: "Use the Four Fits framework to analyze this"

**"I hit the file upload limit"**
- Prioritize the 3-5 most relevant frameworks for your work
- Use the Prompt Library for others as needed

**"The responses don't feel like a thought partner"**
- Check that custom instructions are saved
- Start a new conversation in the project (not outside it)
- Be specific about what you're trying to do

## Alternative: Prompt Library

If you don't want to set up a full project, use the ready-made prompts in [`/prompts/`](./prompts/):

1. Browse available prompts
2. Copy the full prompt (includes framework context)
3. Paste into any Claude conversation
4. Works in regular claude.ai, no project needed

**Trade-off:** You have to paste context each time vs. projects remember everything.

---

## Quick Start Checklist

- [ ] Create new Project at claude.ai
- [ ] Name it "PM Thought Partner"
- [ ] Copy SKILL.md content from GitHub
- [ ] Paste into custom instructions
- [ ] Upload 3-5 most relevant framework files
- [ ] Upload 2-3 thought leader profiles (optional)
- [ ] Test with: "Help me validate product-market fit"
- [ ] Bookmark your project for easy access

**Estimated setup time:** 5-10 minutes

---

**Ready to get started?** [Create your project now](https://claude.ai) and start shipping better products faster. 🚀
