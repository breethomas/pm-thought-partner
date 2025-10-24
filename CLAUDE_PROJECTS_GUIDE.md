# PM Thought Partner Setup Guide (Browser)

**Browser-based setup. No command line required.**

This guide shows you how to set up the PM Thought Partner in Claude Projects so you can use it on all your PM work—roadmaps, PRDs, prioritization, strategy, etc.

**Time required:** 15 minutes

---

## What You'll Get

Once set up, you'll have an AI thought partner that:
- Challenges your assumptions with proven frameworks from top PM leaders
- Pushes you to prototype instead of write lengthy docs
- Applies frameworks from Marty Cagan, Elena Verna, Brian Balfour, Teresa Torres, and more
- Works across ALL your PM conversations (not tied to a specific project)
- Has access to 20+ detailed PM frameworks

---

## Step 1: Download the Framework Files (5 minutes)

You need to download the framework files from GitHub to your computer so you can upload them to Claude.

### Option A: Download the Entire Repository (Easiest)

1. **Go to the repository:** https://github.com/breethomas/pm-thought-partner
2. **Click the green "Code" button** (top right)
3. **Click "Download ZIP"**
4. **Find the downloaded file** (usually in your Downloads folder)
5. **Double-click the ZIP file** to unzip it
6. **You now have a folder** called `pm-thought-partner-main` with all the files

### Option B: Download Individual Files (If you want specific frameworks only)

1. Go to https://github.com/breethomas/pm-thought-partner
2. Click into the `frameworks/` folder
3. Click on a framework file (like `discovery/four-risks.md`)
4. Click the **"Raw"** button (top right)
5. **Save the page** (Cmd+S on Mac, Ctrl+S on Windows)
6. Repeat for each framework you want

**Recommended frameworks to download:**
- All files in `frameworks/ai-era-practices/`
- All files in `frameworks/discovery/`
- All files in `frameworks/growth/`
- All files in `frameworks/measurement/`
- All files in `frameworks/planning/`

---

## Step 2: Create Your Claude Project (2 minutes)

1. **Go to Claude:** https://claude.ai
2. **Click "Projects"** in the left sidebar
3. **Click "Create Project"**
4. **Name it:** "PM Thought Partner"
5. **Description (optional):** "AI-era product management thought partner with frameworks from top PM leaders"
6. **Click "Create"**

---

## Step 3: Add the PM Thought Partner Instructions (3 minutes)

This tells Claude how to act as your PM thought partner.

1. **In your new project, look for "Custom Instructions"** (might be in settings/gear icon)
2. **Open this file in a new tab:** https://github.com/breethomas/pm-thought-partner/blob/main/skills/pm-thought-partner/SKILL.md
3. **Click "Raw"** (button at top right of the file)
4. **Select all the text** (Cmd+A on Mac, Ctrl+A on Windows)
5. **Copy it** (Cmd+C on Mac, Ctrl+C on Windows)
6. **Go back to your Claude Project**
7. **Paste into the "Custom Instructions" field** (NOT the description!)
8. **Click "Save"**

⚠️ **Important:** Make sure you paste into "Custom Instructions", not the project description. Custom Instructions is what Claude actually reads.

---

## Step 4: Upload Framework Files (5 minutes)

Now upload the framework files so Claude has access to detailed content.

### If you downloaded the ZIP (Option A from Step 1):

1. **In your Claude Project, click "Add content"** or look for an upload button
2. **Click "Upload files"**
3. **Navigate to your Downloads folder**
4. **Open the `pm-thought-partner-main` folder**
5. **Open the `frameworks` folder**
6. **Select all the folders/files inside:**
   - `ai-era-practices/` folder
   - `discovery/` folder
   - `growth/` folder
   - `measurement/` folder
   - `planning/` folder
7. **Click "Open" or "Upload"**

**Note:** Claude Projects may have upload limits. If you hit a limit:
- Start with the most relevant folders for your work
- You can always add more later

### If you downloaded individual files (Option B from Step 1):

1. **In your Claude Project, click "Add content"** → **"Upload files"**
2. **Select all the framework markdown files you downloaded**
3. **Click "Open" or "Upload"**

### What you're uploading:

**Core frameworks** (these cover most PM work):
- `prototype-first.md` - AI-era build-to-learn approach
- `four-risks.md` - Marty Cagan's validation framework
- `continuous-discovery.md` - Teresa Torres' customer research approach
- `four-fits.md` - Brian Balfour's growth framework
- `growth-loops.md` - Elena Verna's growth loops
- `pmf-survey.md` - Rahul Vohra's PMF measurement
- `now-next-later.md` - Janna Bastow's roadmap framework
- `lno-prioritization.md` - Aakash Gupta's prioritization method
- `scope-projects-down.md` - Linear Method scoping
- `prioritize-enablers-blockers.md` - Linear Method prioritization
- And more...

---

## Step 5: Test It Works (2 minutes)

1. **Start a new conversation** in your PM Thought Partner project
2. **Ask a PM question** like:
   - "Should I write a PRD for this recommendation engine or prototype it first?"
   - "How do I know if we have product-market fit?"
   - "Help me prioritize these 5 features"

**What you should see:**
- Claude pushes you toward prototyping (not documentation)
- References frameworks like Four Risks, PMF Survey, etc.
- Challenges your assumptions
- Asks about evidence and customer validation

**If it's working:** Claude should feel different—more challenging, more strategic, prototype-focused.

---

## How to Use Your PM Thought Partner

### Example Conversations

**Discovery & Validation:**
```
"I want to validate this feature idea before we build it"
→ Claude applies Four Risks framework, pushes for prototyping
```

**Prioritization:**
```
"Help me prioritize these 10 features for next quarter"
→ Claude uses LNO framework (Leverage/Neutral/Overhead)
```

**Growth Strategy:**
```
"How should we think about growing our product?"
→ Claude applies Growth Loops and Four Fits frameworks
```

**PMF Measurement:**
```
"How do I know if we have product-market fit?"
→ Claude walks you through Rahul Vohra's PMF Survey
```


**Roadmapping:**
```
"I need to create a roadmap for leadership"
→ Claude suggests Now-Next-Later approach (Janna Bastow)
```

### Tips for Best Results

**1. Give context:**
Tell Claude about your product, stage, and situation:
- "I'm a PM at a Series A B2B SaaS company"
- "We have 200 customers and are trying to figure out PMF"
- "I'm a solo founder building an AI product"

**2. Reference specific frameworks:**
- "Apply the Four Risks framework to this feature"
- "Walk me through continuous discovery"
- "Help me run a PMF survey"

**3. Push back and iterate:**
- Challenge Claude's advice
- Ask "why" and "how"
- Request examples
- Go deeper on frameworks

**4. Ask for templates:**
- "Give me a lite PRD template"
- "Help me write this as a clear Linear issue"
- "Create a competitive analysis template"

---

## What Makes This Different

### Without PM Thought Partner:
- Generic product advice
- Might suggest lengthy documentation
- No specific framework grounding
- Doesn't challenge assumptions

### With PM Thought Partner:
- Pushes you to prototype first
- References proven frameworks (Cagan, Verna, Balfour, Torres)
- Challenges assumptions, asks for evidence
- AI-era focused (build fast, iterate, prototype-to-learn)
- Applies the right framework for the situation

---

## Troubleshooting

**"Claude isn't acting like a thought partner"**
- Make sure you pasted SKILL.md into Custom Instructions (not description)
- Start a new conversation IN the project (look at the project name at the top)
- Try: "Challenge my thinking on this feature idea"

**"Claude says it can't access a framework"**
- Check that you uploaded the framework files in Step 4
- Try uploading the specific file Claude is looking for
- Or ask: "Explain the concept without the file"

**"I hit the upload limit"**
- Prioritize the 3-5 most relevant frameworks for your work
- You can remove and re-upload different frameworks as needed
- Core essentials: prototype-first, four-risks, pmf-survey, growth-loops

**"The responses are too generic"**
- Give more context about your product and situation
- Reference specific frameworks by name
- Be specific about what you're trying to accomplish

---

## Keeping It Updated

As new frameworks are added:

1. **Watch the GitHub repository** for updates: https://github.com/breethomas/pm-thought-partner
2. **Download new framework files** using the same process as Step 1
3. **Upload them to your project** using Step 4
4. **Update Custom Instructions** if SKILL.md changes

**How to watch:** Click "Watch" at the top of the GitHub page to get notifications.

---

## Sharing with Your Team

Want your whole team to use this?

**Option 1: Everyone sets up their own project**
- Share this guide with your team
- Takes 15 minutes per person
- Everyone customizes for their work

**Option 2: Team/Organizational Projects** (if available on your Claude plan)
- Set it up once
- Share with the whole team
- Everyone has access to the same frameworks

---


## Quick Start Checklist

- [ ] Download ZIP or framework files from GitHub
- [ ] Create Claude Project named "PM Thought Partner"
- [ ] Copy SKILL.md from GitHub
- [ ] Paste into Custom Instructions (not description!)
- [ ] Upload framework files to the project
- [ ] Test with: "Should I write a PRD or prototype first?"
- [ ] Bookmark your project for daily use

**Estimated setup time:** 15 minutes

---

## What's Next?

Once set up, use your PM Thought Partner for:
- Daily prioritization decisions
- Feature validation before building
- Growth strategy discussions
- Roadmap planning
- PMF measurement
- Team AI adoption planning
- Competitive analysis
- Stakeholder communication

**This is your on-demand PM advisor, grounded in frameworks from the world's best product leaders.**

---

**Ready to get started?** [Create your Claude Project now →](https://claude.ai)

**Need help?** Open an issue on GitHub: https://github.com/breethomas/pm-thought-partner/issues

🚀 **Happy shipping!**
