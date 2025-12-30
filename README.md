# Three-Tier Documentation System

**A hierarchical session tracking system for AI assistants that reduces token usage by 60-80%**

## What Is This?

When working with AI assistants on large repositories, loading context can consume 20-30k tokens per session. This system solves that problem with a smart three-tier hierarchical structure that lets you load only the context you need.

## Quick Start

See [QUICKSTART_FOR_OTHERS.md](QUICKSTART_FOR_OTHERS.md) for a 5-minute setup guide.

## Documentation

- **[THREE_TIER_SYSTEM_GUIDE.md](THREE_TIER_SYSTEM_GUIDE.md)** - Complete system explanation and philosophy
- **[QUICKSTART_FOR_OTHERS.md](QUICKSTART_FOR_OTHERS.md)** - Step-by-step setup guide
- **[TEMPLATES/](TEMPLATES/)** - Ready-to-use template files

## Token Savings

**Before (flat structure):**
- Load ALL documentation = 25,000 tokens every session

**After (three-tier system):**
- Working on specific project = 3,000 tokens (88% savings!)
- Working on multiple projects = 5,000 tokens (80% savings!)
- Working on vault structure = 10,000 tokens (60% savings!)

## How It Works

The system organizes documentation into three tiers:

### Tier 1: Vault/Root Level
- Repository overview, git setup, cross-cutting work
- **Read when:** Working on vault structure or multiple unrelated areas

### Tier 2: Projects Overview
- All projects summary, cross-project work
- **Read when:** Working on multiple related projects

### Tier 3: Individual Projects
- Project-specific context and detailed history
- **Read when:** Working on a single project (most common, biggest savings)

Content automatically **propagates UP** from Tier 3 → Tier 2 → Tier 1, so every tier has complete context (detailed or summarized).

## Workflow Diagrams

### Starting a Session: Which Tier to Read?

```
What are you working on today?
            ↓
    ┌───────┴───────┬──────────────┬─────────────┐
    │               │              │             │
Single Project  Multi-Project  Vault Work   Quick Check
    │               │              │             │
    ↓               ↓              ↓             ↓
Read Tier 3     Read Tier 2    Read Tier 1   git log -5
(~3-5k tokens) (~5-8k tokens) (~10k tokens)  (~1-3k tokens)
    │               │              │             │
    ↓               ↓              ↓             ↓
88% savings     80% savings    60% savings   90%+ savings
```

**Example:**
- Working on website project? → Read `projects/website/website-claude.md` (Tier 3)
- Working on API + frontend? → Read `projects/projects-claude.md` (Tier 2)
- Organizing documentation? → Read `docs/docs-claude.md` (Tier 1)
- Just checking what changed? → Run `git log -5 --oneline --stat`

### Ending a Session: Which Tiers to Update?

```
                    git diff --stat
                          ↓
                 Detect areas changed
                          ↓
        ┌─────────────────┼──────────────────┐
        │                 │                  │
   Single Project    Multi-Project       Vault-Level
      Work              Work                Work
        │                 │                  │
        ↓                 ↓                  ↓
    Update T3         Update T3s         Update T1
    Update T2         Update T2           (only)
    Update T1         Update T1
        │                 │                  │
        └─────────────────┼──────────────────┘
                          ↓
          Commit all modified session files
                          ↓
                   Push to GitHub
```

**Example:**
- Changed `projects/website/src/index.html`? → Update Tier 3 (website) + Tier 2 + Tier 1
- Changed files in both `api/` and `frontend/`? → Update both Tier 3s + Tier 2 + Tier 1
- Changed `README.md` and `docs/`? → Update Tier 1 only

**The agent handles this automatically!** Just run `@agents/close_and_commit_GIT.md`

## Features

- ✅ **60-80% token reduction** through smart context loading
- ✅ **Automatic tier detection** via git diff analysis
- ✅ **Content propagation** from specific to general
- ✅ **Session management agent** that handles everything automatically
- ✅ **Descriptive file naming** for easy identification
- ✅ **Complete templates** ready to copy and customize
- ✅ **Language-agnostic** - works with any codebase
- ✅ **AI-agnostic** - works with Claude, Cursor, Windsurf, etc.

## Setup

```bash
# Copy templates to your repository
cp -r TEMPLATES /path/to/your-repo/

# Run automated setup
cd /path/to/your-repo
bash TEMPLATES/setup-three-tier.sh

# Customize the templates and start using!
```

See [QUICKSTART_FOR_OTHERS.md](QUICKSTART_FOR_OTHERS.md) for detailed instructions.

## Who Is This For?

- Developers with large repositories and multiple projects
- Teams using AI assistants (Claude Code, Cursor, etc.)
- Anyone wanting to reduce AI token costs
- Projects needing organized session tracking

## Philosophy

**"Load only what you need"**

Most work is focused on ONE area. Reading everything is wasteful. Context should be available at appropriate granularity. Smart architecture upfront pays dividends in reduced token costs.

## Based On

This system builds upon:
- NetworkChuck's AI terminal workflow patterns (session-summary.md, claude.md)
- Real-world usage and iteration
- Token efficiency best practices

## Innovation

While session tracking patterns exist, the three-tier hierarchical approach with automatic propagation and smart tier detection is a novel solution specifically designed for token efficiency at scale.

## License

MIT License - Feel free to use, modify, and share!

## Contributing

Found this useful? Have improvements? Issues and pull requests welcome!

---

**Quick Reference:**

| Work Type | Files to Read | Token Cost | Savings |
|-----------|---------------|------------|---------|
| Specific project | Tier 3 project files | ~3-5k | 88% |
| Multiple projects | Tier 2 files | ~5-8k | 80% |
| Vault structure | Tier 1 files | ~10k | 60% |
| Quick context | `git log -5 --oneline --stat` | ~1-3k | 90%+ |

**Start saving tokens today!** 🚀
