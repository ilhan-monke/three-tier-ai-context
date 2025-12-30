# Context File - Tier 1 (Vault Level)

**Level:** Tier 1 - Vault/Root Level Context
**Purpose:** Provide high-level overview of the entire repository structure, working environment, and cross-cutting concerns
**Last Updated:** [DATE]

---

## 🔍 Quick Context (Start Here!)

**Before diving into this file, get recent changes:**
```bash
git log -5 --oneline --stat
```
This shows what changed since your last session (~1-3k tokens vs reading everything).

**Then proceed based on what you're working on.**

---

## 📁 Three-Tier Session Structure

This vault uses a **hierarchical session tracking system** for efficient context management:

### Tier 1: Vault Level (This File)
- **File:** `docs/docs-session-summary.md`
- **Content:** Vault organization, git workflow, documentation structure, multi-project work
- **When to use:** Working on vault structure, git setup, or multiple unrelated areas

### Tier 2: Projects Overview
- **File:** [projects/projects-session-summary.md](../projects/projects-session-summary.md)
- **Content:** Cross-project sessions, project-level organizational work
- **When to use:** Working on multiple related projects or project infrastructure

### Tier 3: Individual Projects
- [Project1 Sessions](../projects/Project1/Project1-session-summary.md) - Description
- [Project2 Sessions](../projects/Project2/Project2-session-summary.md) - Description
- *(Add your projects here)*

**📋 How It Works:**
- Sessions propagate UP: Tier 3 → Tier 2 → Tier 1
- Each tier contains complete context (detailed or summarized)
- Read the tier appropriate to your current work for efficient token usage

---

## Repository Overview

### Purpose
[Describe what this repository is for - what problem does it solve? What is the main goal?]

### Current Phase
[e.g., Phase 1: Setup, Phase 2: Development, Phase 3: Production]

---

## Working Environment

### System Information
- **Working Directory:** `/path/to/your/repo`
- **Operating System:** [OS name and version]
- **Platform:** [linux/windows/mac]
- **Git Repository:** [URL to remote repo]

### Git Configuration
| System | Git Identity | Email | Purpose |
|--------|-------------|--------|---------|
| Main PC | [username] | [email] | [Primary development/etc] |
| [Other] | [username] | [email] | [Purpose] |

**Note:** Use `git config user.name` and `git config user.email` to check/set identity per system.

---

## Repository Structure

```
repository/
├── README.md                   # Main repository index
├── docs/                       # Tier 1 documentation
│   ├── docs-claude.md          # This file
│   └── docs-session-summary.md # Vault-level session log
├── projects/                   # All projects
│   ├── projects-claude.md      # Tier 2 context
│   ├── projects-session-summary.md  # Tier 2 sessions
│   ├── Project1/               # Example project
│   │   ├── Project1-claude.md
│   │   └── Project1-session-summary.md
│   └── Project2/               # Another project
│       ├── Project2-claude.md
│       └── Project2-session-summary.md
├── agents/                     # AI agents
│   └── close_and_commit_GIT.md # Session management agent
└── [other directories]
```

---

## Active Projects

### Project 1
- **Location:** `projects/Project1/`
- **Description:** [What this project does]
- **Status:** [Active/Maintenance/Complete]
- **Context:** [Project1-claude.md](../projects/Project1/Project1-claude.md)
- **Sessions:** [Project1-session-summary.md](../projects/Project1/Project1-session-summary.md)

### Project 2
- **Location:** `projects/Project2/`
- **Description:** [What this project does]
- **Status:** [Active/Maintenance/Complete]
- **Context:** [Project2-claude.md](../projects/Project2/Project2-claude.md)
- **Sessions:** [Project2-session-summary.md](../projects/Project2/Project2-session-summary.md)

---

## Available AI Agents

### 1. close_and_commit_GIT
- **Location:** `agents/close_and_commit_GIT.md`
- **Purpose:** End-of-session workflow - updates all relevant tiers, commits, and pushes
- **Usage:** `@agents/close_and_commit_GIT.md`
- **Capabilities:**
  - Detects which projects were worked on via `git diff --stat`
  - Updates appropriate tier files (Tier 3 → Tier 2 → Tier 1)
  - Creates comprehensive commit messages
  - Pushes to remote repository

### [Add Your Other Agents Here]
- **Location:** `agents/your-agent.md`
- **Purpose:** [What it does]
- **Usage:** `@agents/your-agent.md [optional args]`

---

## Quick Commands

### Git Operations
```bash
# Check status
git status

# View recent changes
git log -5 --oneline --stat

# Pull latest (ALWAYS do this before starting work on a new system)
git pull

# View uncommitted changes
git diff
git diff --stat

# Stash changes for switching systems
git stash
git stash pop
```

### Session Workflow
```bash
# Start session: Check recent activity
git log -5 --oneline --stat

# During session: Make changes as needed

# End session: Run the close-and-commit agent
# Tell AI: @agents/close_and_commit_GIT.md
```

---

## Documentation Files

### Vault Documentation (Tier 1)
- **docs-claude.md** (this file) - Repository overview and context
- **docs-session-summary.md** - Vault-level session history

### Projects Documentation (Tier 2)
- **projects-claude.md** - All projects overview
- **projects-session-summary.md** - Cross-project session history

### Project-Specific Documentation (Tier 3)
- Each project has its own `<ProjectName>-claude.md` and `<ProjectName>-session-summary.md`

### Other Documentation
- **README.md** - Repository introduction and quick start
- [Add other important docs here]

---

## Key Patterns & Conventions

### File Naming
- Tier files use descriptive names: `<context>-claude.md`, `<context>-session-summary.md`
- Examples: `docs-claude.md`, `homelab-session-summary.md`, `website-claude.md`
- Benefit: Clear identification in search results and file explorers

### Session Documentation
- New sessions added to top of session-summary files (newest first)
- Include: Date, accomplishments, files changed, decisions, status, next steps
- Sessions propagate UP through tiers automatically

### Git Workflow
- Always `git pull` before starting work on a different system
- Commit frequently with descriptive messages
- Use close_and_commit agent for end-of-session commits
- Never commit secrets or sensitive data

---

## Token Efficiency Strategy

### When to Read Each Tier

**Read Tier 1 (this file) when:**
- Working on vault structure or documentation
- Setting up git workflow or agents
- Working across multiple unrelated areas
- Need full repository overview

**Read Tier 2 when:**
- Working on multiple related projects
- Doing cross-project refactoring
- Managing project infrastructure

**Read Tier 3 when:**
- Working on a single specific project
- Most efficient for focused work
- 88% token savings vs reading everything

**Use `git log` when:**
- Just need quick context on recent changes
- Checking what was done last session
- 90%+ token savings

---

## Current Status

### Overall Progress
[Describe where you are in your journey - what's complete, what's in progress, what's next]

### Active Focus Areas
- [Area 1]
- [Area 2]
- [Area 3]

### Completed Milestones
- ✅ [Milestone 1]
- ✅ [Milestone 2]

### Upcoming Goals
- 🔄 [Goal 1]
- 🔄 [Goal 2]

---

## Working Instructions

### For AI Assistants
When starting a new session:
1. Check `git log -5 --oneline --stat` for quick context
2. If working on specific project, read Tier 3 files for that project
3. If working on multiple projects, read Tier 2 files
4. If working on vault structure, read this file (Tier 1)
5. At end of session, invoke `@agents/close_and_commit_GIT.md`

### Multi-System Workflow
If using multiple computers:
1. **Before starting work:** `git pull`
2. **Do your work:** Make changes, test, iterate
3. **Before ending session:** Invoke close_and_commit agent
4. **Verify:** Check `git status` shows clean working directory
5. **On other system:** Start with `git pull`

---

## Notes & Reminders

### Important Considerations
- [Add any important notes about your workflow]
- [Special considerations for your setup]
- [Common gotchas to avoid]

### Best Practices
- Always pull before starting work on a different system
- Commit frequently with descriptive messages
- Use the three-tier system to minimize token usage
- Keep session logs up-to-date via close_and_commit agent
- Document decisions and rationale for future reference

---

## Navigation

- **📋 Vault Sessions:** [docs-session-summary.md](./docs-session-summary.md)
- **📁 Projects Overview:** [projects-claude.md](../projects/projects-claude.md)
- **🔧 Available Agents:** [agents/](../agents/)
- **📚 Main README:** [README.md](../README.md)

---

*This file is part of the three-tier documentation system. See [THREE_TIER_SYSTEM_GUIDE.md](../THREE_TIER_SYSTEM_GUIDE.md) for more information.*
