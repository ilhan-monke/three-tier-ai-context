# Three-Tier Documentation System Templates

This directory contains **ready-to-use templates** for implementing the three-tier documentation system in your own repository.

## What's Included

### Documentation Templates

| File | Purpose | Use For |
|------|---------|---------|
| `tier1-claude-template.md` | Vault-level context | Repository overview, git setup, all projects |
| `tier1-session-template.md` | Vault-level sessions | Cross-cutting work, vault organization |
| `tier2-claude-template.md` | Projects overview context | All projects summary |
| `tier2-session-template.md` | Projects sessions | Multi-project work |
| `tier3-claude-template.md` | Individual project context | Single project overview |
| `tier3-session-template.md` | Individual project sessions | Project-specific work |

### Agent Template

| File | Purpose |
|------|---------|
| `close-and-commit-agent-template.md` | Session management agent with tier detection |

## Quick Setup

### Option 1: Automated Setup (Recommended)

```bash
# Navigate to your repository
cd /path/to/your/repo

# Create directory structure
mkdir -p docs projects agents

# Copy Tier 1 templates
cp TEMPLATES/tier1-claude-template.md docs/docs-claude.md
cp TEMPLATES/tier1-session-template.md docs/docs-session-summary.md

# Copy Tier 2 templates
cp TEMPLATES/tier2-claude-template.md projects/projects-claude.md
cp TEMPLATES/tier2-session-template.md projects/projects-session-summary.md

# Copy agent template
cp TEMPLATES/close-and-commit-agent-template.md agents/close_and_commit_GIT.md

# Create your first project
PROJECT_NAME="MyFirstProject"
mkdir -p "projects/$PROJECT_NAME"
cp TEMPLATES/tier3-claude-template.md "projects/$PROJECT_NAME/${PROJECT_NAME}-claude.md"
cp TEMPLATES/tier3-session-template.md "projects/$PROJECT_NAME/${PROJECT_NAME}-session-summary.md"

echo "✅ Three-tier system created!"
echo "Next: Edit the templates to fill in your project information"
```

### Option 2: Manual Setup

1. **Create directories:**
   ```bash
   mkdir -p docs projects agents
   ```

2. **Copy Tier 1 files:**
   - Copy `tier1-claude-template.md` → `docs/docs-claude.md`
   - Copy `tier1-session-template.md` → `docs/docs-session-summary.md`

3. **Copy Tier 2 files:**
   - Copy `tier2-claude-template.md` → `projects/projects-claude.md`
   - Copy `tier2-session-template.md` → `projects/projects-session-summary.md`

4. **Copy agent:**
   - Copy `close-and-commit-agent-template.md` → `agents/close_and_commit_GIT.md`

5. **Create first project:**
   - Create `projects/YourProjectName/`
   - Copy `tier3-claude-template.md` → `projects/YourProjectName/YourProjectName-claude.md`
   - Copy `tier3-session-template.md` → `projects/YourProjectName/YourProjectName-session-summary.md`

## Customizing the Templates

### 1. Fill in Placeholders

Search for and replace these placeholders:

- `[DATE]` - Current date
- `[Project Name]` - Your project name
- `[ProjectName]` - Project name without spaces
- `[Description]` - Project descriptions
- `/path/to/your/repo` - Your actual repository path

### 2. Update Project Lists

In Tier 1 and Tier 2 files, update the project lists with your actual projects.

### 3. Customize Agent Detection

In `close_and_commit_GIT.md`, update the **Project Detection Map** section with your project patterns:

```markdown
projects/YourProject1/  → Your Project 1
projects/YourProject2/  → Your Project 2
```

### 4. Add Your Information

Fill in:
- Repository purpose and goals
- Technology stack
- Git configuration
- Working environment details
- Current projects

## File Naming Convention

**Important:** Follow the naming pattern:

```
<context>-claude.md           # Context file
<context>-session-summary.md  # Session history
```

**Examples:**
- `docs-claude.md`, `docs-session-summary.md` (Tier 1)
- `projects-claude.md`, `projects-session-summary.md` (Tier 2)
- `website-claude.md`, `website-session-summary.md` (Tier 3)

**Why?** Descriptive names make files instantly identifiable in search results and tabs.

## Testing Your Setup

### 1. Verify File Structure

```bash
tree -L 3
```

Should show:
```
.
├── docs/
│   ├── docs-claude.md
│   └── docs-session-summary.md
├── projects/
│   ├── projects-claude.md
│   ├── projects-session-summary.md
│   └── YourProject/
│       ├── YourProject-claude.md
│       └── YourProject-session-summary.md
└── agents/
    └── close_and_commit_GIT.md
```

### 2. Test the Agent

Make a small change, then tell your AI:

```
@agents/close_and_commit_GIT.md
```

The agent should:
1. Detect which tier(s) need updating
2. Update the appropriate session files
3. Create a commit
4. Push to your repository

### 3. Verify Token Savings

Try loading just Tier 3 for a project instead of reading all documentation. You should see significant token reduction.

## Common Customizations

### Two-Tier System (Simpler)

For smaller projects, skip Tier 2:
- **Tier 1:** Vault level (`docs/`)
- **Tier 3:** Individual projects (`projects/ProjectName/`)

Modify the agent to skip Tier 2 updates.

### Four-Tier System (Larger Projects)

For very large monorepos, add Tier 4 for sub-projects:
- **Tier 1:** Vault
- **Tier 2:** Project categories
- **Tier 3:** Individual projects
- **Tier 4:** Sub-projects or modules

### Different Folder Structure

If your repo uses different folders:
- Update agent detection patterns
- Update navigation links in templates
- Adjust file paths accordingly

## Support Files

After setup, you might want to create:

1. **README.md** - Repository introduction
2. **.gitignore** - Files to exclude from git
3. **CONTRIBUTING.md** - How others can contribute
4. **Additional agents** - More specialized workflow agents

## Best Practices

### 1. Start Simple
- Begin with one project
- Get comfortable with the workflow
- Add more projects gradually

### 2. Be Consistent
- Always use the agent to close sessions
- Follow the naming convention
- Keep session entries detailed

### 3. Review Regularly
- Check if tier boundaries make sense
- Adjust as your repository grows
- Refine the agent detection patterns

### 4. Document Everything
- Explain WHY decisions were made
- Include context for future self
- Cross-reference related documentation

## Next Steps After Setup

1. **Fill in context files** - Add your project information to `*-claude.md` files
2. **Customize the agent** - Update project detection patterns
3. **Make your first commit** - Test the close-and-commit workflow
4. **Start working** - Begin using the three-tier system
5. **Iterate** - Adjust as you learn what works for you

## Getting Help

### Common Issues

**"Agent doesn't detect my project"**
- Check the Project Detection Map in `close_and_commit_GIT.md`
- Ensure your project path matches the pattern
- Add your project pattern if missing

**"Session files too large"**
- Summarize old sessions (keep just key points)
- Move detailed old sessions to an archive
- Focus on recent relevant history

**"Unclear which tier to use"**
- Working on ONE project? → Tier 3
- Working on MULTIPLE projects? → Tier 2
- Working on VAULT structure? → Tier 1
- When in doubt, use the most specific tier

### Documentation

- **Main Guide:** [THREE_TIER_SYSTEM_GUIDE.md](../THREE_TIER_SYSTEM_GUIDE.md)
- **Templates:** This directory
- **Examples:** See the original implementation this was templated from

## Template Maintenance

These templates are meant to be:
- **Copied** to your repository
- **Customized** for your needs
- **Modified** as your workflow evolves

Don't feel constrained by the templates - adapt them to work best for YOU.

---

**Ready to start?** Run the automated setup script above, then customize the files for your repository!
