# Quick Start: Setting Up the Three-Tier System in Your Repository

This is a **5-minute setup guide** to implement the token-efficient three-tier documentation system in your own repository.

## What You'll Get

- **60-80% reduction in AI token usage** when loading context
- **Organized session tracking** across all your projects
- **Smart AI agent** that automatically updates the right documentation files
- **Scalable structure** that grows with your repository

## Prerequisites

- A git repository (or create one with `git init`)
- An AI assistant that supports Claude Code or similar (e.g., Claude, Cursor, Windsurf)
- 5 minutes of your time

## Step 1: Copy the Template Files (2 minutes)

### Option A: Automated (Recommended)

```bash
# Copy the TEMPLATES directory to your repository
cp -r /path/to/AI-agents/TEMPLATES /path/to/your-repo/

# Navigate to your repository
cd /path/to/your-repo

# Run the setup script
bash TEMPLATES/setup-three-tier.sh

# Follow the prompts to create your first project
```

### Option B: Manual

```bash
# In your repository, create the structure
mkdir -p docs projects agents

# Copy Tier 1 files
cp TEMPLATES/tier1-claude-template.md docs/docs-claude.md
cp TEMPLATES/tier1-session-template.md docs/docs-session-summary.md

# Copy Tier 2 files
cp TEMPLATES/tier2-claude-template.md projects/projects-claude.md
cp TEMPLATES/tier2-session-template.md projects/projects-session-summary.md

# Copy the agent
cp TEMPLATES/close-and-commit-agent-template.md agents/close_and_commit_GIT.md

# Create your first project (replace "MyProject" with your project name)
mkdir -p projects/MyProject
cp TEMPLATES/tier3-claude-template.md projects/MyProject/MyProject-claude.md
cp TEMPLATES/tier3-session-template.md projects/MyProject/MyProject-session-summary.md
```

## Step 2: Customize (2 minutes)

Open these files and fill in the placeholders:

### 1. `docs/docs-claude.md`
- Replace `/path/to/your/repo` with your actual path
- Add your git repository URL
- List your active projects
- Update the "Active Projects" section

### 2. `agents/close_and_commit_GIT.md`
- Find the "Project Detection Map" section (around line 100)
- Add your project patterns:
  ```
  projects/MyProject/   → My Project
  projects/Website/     → Website Project
  ```

### 3. `projects/MyProject/MyProject-claude.md`
- Replace `[Project Name]` with your project name
- Fill in the project purpose and description
- Update the technology stack section

## Step 3: Test It (1 minute)

Make a small change to test the system:

```bash
# Make a small edit to any file in your repository
echo "# Test" >> README.md

# Tell your AI assistant to run the agent
# (In your AI chat, type:)
@agents/close_and_commit_GIT.md
```

The agent should:
1. ✅ Detect which files changed
2. ✅ Update the appropriate session files
3. ✅ Create a commit
4. ✅ Push to your remote repository

## Step 4: Start Using It

From now on, follow this workflow:

### Starting a Session

**Working on a specific project?**
```
Tell AI: "Read projects/MyProject/MyProject-claude.md and MyProject-session-summary.md"
```

**Working on multiple projects?**
```
Tell AI: "Read projects/projects-claude.md and projects-session-summary.md"
```

**Quick context (fastest)?**
```
Tell AI: "Run git log -5 --oneline --stat and summarize recent changes"
```

### Ending a Session

```
Tell AI: "@agents/close_and_commit_GIT.md"
```

The agent handles everything automatically!

## Understanding the Three Tiers

### 🏛️ Tier 1: Vault Level
- **Files:** `docs/docs-claude.md`, `docs/docs-session-summary.md`
- **When:** Working on repository structure, git setup, or documentation
- **Tokens:** ~10,000

### 📁 Tier 2: Projects Overview
- **Files:** `projects/projects-claude.md`, `projects/projects-session-summary.md`
- **When:** Working on multiple projects
- **Tokens:** ~5-8,000

### 🎯 Tier 3: Individual Project
- **Files:** `projects/MyProject/MyProject-claude.md`, `MyProject-session-summary.md`
- **When:** Working on a single project (most common)
- **Tokens:** ~3-5,000

## Token Savings Example

**Old way (flat structure):**
- Load ALL documentation = 25,000 tokens every session 😰
- Cost: $$$
- Slow: AI has to process everything

**New way (three-tier):**
- Load just your project = 3,000 tokens ⚡
- Cost: $ (88% savings!)
- Fast: AI only reads what's relevant

## Adding More Projects

```bash
# Create a new project directory
PROJECT_NAME="NewProject"
mkdir -p "projects/$PROJECT_NAME"

# Copy templates
cp TEMPLATES/tier3-claude-template.md "projects/$PROJECT_NAME/${PROJECT_NAME}-claude.md"
cp TEMPLATES/tier3-session-template.md "projects/$PROJECT_NAME/${PROJECT_NAME}-session-summary.md"

# Edit the files to fill in project details
```

Then update:
1. `agents/close_and_commit_GIT.md` - Add project to detection map
2. `docs/docs-claude.md` - Add to active projects list
3. `projects/projects-claude.md` - Add project overview

## Common Questions

### "Do I need all three tiers?"

**For small repos (1-2 projects):** Use 2 tiers (Tier 1 + Tier 3, skip Tier 2)

**For medium repos (3-10 projects):** Use all 3 tiers (recommended)

**For large repos (10+ projects):** Consider adding Tier 4 for sub-projects

### "What if I forget to run the agent?"

No problem! Run it whenever you remember. You can manually update the session files if needed.

### "Can I customize the format?"

Absolutely! The templates are yours to modify. Change the structure, add sections, remove what you don't need.

### "Does this work with other AI assistants?"

Yes! Any AI that can:
- Read files
- Write files
- Run git commands
- Follow agent instructions

Examples: Claude Code, Cursor, Aider, Codex, custom setups

## Troubleshooting

### Agent doesn't detect my project
- Check `agents/close_and_commit_GIT.md` Project Detection Map
- Ensure your project path matches the pattern: `projects/YourProject/*`

### Session files are getting too long
- Summarize old sessions (keep recent ones detailed)
- Archive old sessions to a separate file
- The three-tier system already helps by splitting content

### Don't know which tier to use
- **Rule of thumb:** Use the most specific tier
- Working on 1 project? → Tier 3
- Working on 2+ projects? → Tier 2
- Working on repo structure? → Tier 1

## Next Steps

1. ✅ Set up the structure (you just did this!)
2. 📝 Customize the templates with your info
3. 🧪 Test with a small change
4. 🚀 Start using it for real work
5. 📊 Monitor your token usage (you should see big savings!)

## Full Documentation

For complete details, see:
- **[THREE_TIER_SYSTEM_GUIDE.md](./THREE_TIER_SYSTEM_GUIDE.md)** - Complete system explanation
- **[TEMPLATES/README.md](./TEMPLATES/README.md)** - Template documentation
- **Template files** - Inline documentation and examples

## Support

This system is battle-tested and actively used. The templates include:
- ✅ Detailed inline documentation
- ✅ Example scenarios
- ✅ Troubleshooting guides
- ✅ Customization options

## One More Thing

After you set this up, **share it with others**! The three-tier system is designed to be:
- Easy to adopt
- Language-agnostic
- AI-agnostic
- Highly customizable

Help other developers save tokens and stay organized! 🎉

---

**Questions? Issues? Improvements?**

The templates are designed to be self-explanatory, but if you get stuck:
1. Check the inline documentation in the template files
2. Review THREE_TIER_SYSTEM_GUIDE.md
3. Look at the examples in the original implementation

**Happy documenting!** 📚✨
