# Three-Tier Documentation System for AI Assistants

## What This Is

A hierarchical session tracking system that reduces AI token usage by **60-80%** through smart context loading.

## The Problem It Solves

Traditional flat documentation structures force AI to read everything every session, wasting tokens:
- Large repos with multiple projects = 20-30k tokens just to load context
- Most sessions only work on ONE area, but AI reads ALL history
- Token costs add up quickly, especially with long-context models

## The Solution: Three Tiers

Load only what you need for your current work:

### **Tier 1: Vault/Root Level**
- **Files:** `docs/docs-claude.md`, `docs/docs-session-summary.md`
- **Content:** Repository structure, git setup, cross-cutting work, vault organization
- **Read when:** Working on repository structure, documentation, or multiple unrelated areas
- **Token cost:** ~10,000 tokens (full vault overview)

### **Tier 2: Projects Overview**
- **Files:** `projects/projects-claude.md`, `projects/projects-session-summary.md`
- **Content:** All projects overview, cross-project sessions, project infrastructure
- **Read when:** Working on multiple related projects or project-level organization
- **Token cost:** ~5-8,000 tokens (all projects summary)

### **Tier 3: Individual Projects**
- **Files:** `projects/<ProjectName>/<ProjectName>-claude.md`, `projects/<ProjectName>/<ProjectName>-session-summary.md`
- **Content:** Specific project context, detailed session history for that project
- **Read when:** Working on a single specific project
- **Token cost:** ~3-5,000 tokens (focused context)

## Token Savings Example

**Before (flat structure):**
- Every session loads ALL history = 25,000 tokens

**After (three-tier):**
- Working on specific project? Load Tier 3 only = 3,000 tokens (**88% savings!**)
- Working on multiple projects? Load Tier 2 = 5,000 tokens (**80% savings!**)
- Working on vault structure? Load Tier 1 = 10,000 tokens (**60% savings!**)

## How Content Flows (Propagation)

Content **propagates UP** from specific → general:

```
Tier 3 (Detailed) → Tier 2 (Summary) → Tier 1 (Brief mention)
```

Example:
1. You work on "Project Alpha" and document everything in Tier 3
2. End-of-session agent adds a summary to Tier 2 (projects overview)
3. End-of-session agent adds a brief mention to Tier 1 (vault level)

**Result:** Complete context available at every tier (detailed or summarized)

## File Naming Convention

**Descriptive names for clarity:**
- ❌ Bad: `claude.md`, `session-summary.md` (ambiguous when multiple files open)
- ✅ Good: `<context>-claude.md`, `<context>-session-summary.md`

**Examples:**
- Tier 1: `docs-claude.md`, `docs-session-summary.md`
- Tier 2: `projects-claude.md`, `projects-session-summary.md`
- Tier 3: `projectAlpha-claude.md`, `projectAlpha-session-summary.md`

## Quick Start Setup

### 1. Create Directory Structure

```bash
mkdir -p docs
mkdir -p projects
mkdir -p agents
```

### 2. Create Tier 1 Files

```bash
# Create from templates (see TEMPLATES/ folder)
cp TEMPLATES/tier1-claude-template.md docs/docs-claude.md
cp TEMPLATES/tier1-session-template.md docs/docs-session-summary.md
```

### 3. Create Tier 2 Files

```bash
cp TEMPLATES/tier2-claude-template.md projects/projects-claude.md
cp TEMPLATES/tier2-session-template.md projects/projects-session-summary.md
```

### 4. Create Your First Project (Tier 3)

```bash
mkdir -p projects/YourProjectName
cp TEMPLATES/tier3-claude-template.md projects/YourProjectName/YourProjectName-claude.md
cp TEMPLATES/tier3-session-template.md projects/YourProjectName/YourProjectName-session-summary.md
```

### 5. Create the Session Management Agent

```bash
cp TEMPLATES/close-and-commit-agent-template.md agents/close_and_commit_GIT.md
```

Edit the agent to customize for your needs.

## How to Use It

### Starting a New Session

**Option A: Working on a specific project**
```bash
# Tell AI: "Read projects/YourProjectName/YourProjectName-claude.md and YourProjectName-session-summary.md"
```

**Option B: Working on multiple projects**
```bash
# Tell AI: "Read projects/projects-claude.md and projects-session-summary.md"
```

**Option C: Working on vault structure**
```bash
# Tell AI: "Read docs/docs-claude.md and docs/docs-session-summary.md"
```

### Quick Context Alternative (Even Faster!)

Instead of reading session files, just check recent git commits:
```bash
git log -5 --oneline --stat
```
This shows what changed recently (~1-3k tokens vs reading full history).

### Ending a Session

Invoke your close-and-commit agent:
```bash
# Tell AI: "@agents/close_and_commit_GIT.md"
```

The agent will:
1. Detect which areas you worked on (via `git diff --stat`)
2. Update the appropriate tier files automatically
3. Propagate content UP the hierarchy
4. Commit and push changes

## Agent Tier Detection Logic

The close-and-commit agent uses pattern matching on file paths:

```
If changed files match "projects/ProjectA/*" → Update Tier 3 (ProjectA) + Tier 2 + Tier 1
If changed files match "projects/*" (multiple) → Update relevant Tier 3s + Tier 2 + Tier 1
If changed files match "docs/*", "README.md", etc. → Update Tier 1 only
```

**Example Scenarios:**

**Scenario A: Single Project Work**
```
Changed files: projects/website/src/index.js, projects/website/README.md
Action: Update website-session-summary.md (Tier 3) + projects-session-summary.md (Tier 2) + docs-session-summary.md (Tier 1)
```

**Scenario B: Multi-Project Work**
```
Changed files: projects/api/server.js, projects/frontend/app.js
Action: Update api-session-summary.md + frontend-session-summary.md (Tier 3) + projects-session-summary.md (Tier 2) + docs-session-summary.md (Tier 1)
```

**Scenario C: Vault-Level Work**
```
Changed files: README.md, docs/setup-guide.md, agents/new-agent.md
Action: Update docs-session-summary.md (Tier 1) only
```

## Best Practices

### 1. Load Only What You Need
- Don't load Tier 1 when working on a specific project
- Use `git log` for quick context instead of reading full history
- Trust the tier system to have what you need

### 2. Consistent Naming
- Always use `<context>-claude.md` and `<context>-session-summary.md`
- Makes files instantly identifiable in search results and tabs

### 3. Complete Sessions
- Always run the close-and-commit agent at session end
- Ensures content propagates properly
- Keeps all tiers synchronized

### 4. Navigation Links
- Add navigation sections to all files
- Link between tiers for easy discovery
- Reference related documentation

## File Templates

See the `TEMPLATES/` directory for:
- `tier1-claude-template.md` - Tier 1 context file template
- `tier1-session-template.md` - Tier 1 session log template
- `tier2-claude-template.md` - Tier 2 context file template
- `tier2-session-template.md` - Tier 2 session log template
- `tier3-claude-template.md` - Tier 3 context file template
- `tier3-session-template.md` - Tier 3 session log template
- `close-and-commit-agent-template.md` - Session management agent template

## Customization

### Adjust Tier Levels for Your Needs

You can adapt the system:
- **Small repos:** Use 2 tiers (vault + projects)
- **Large monorepos:** Add Tier 4 (sub-projects)
- **Personal projects:** Use 2 tiers (vault + work areas)

### Modify Agent Behavior

Edit `agents/close_and_commit_GIT.md` to:
- Change tier detection patterns
- Adjust commit message format
- Add custom validation steps
- Integrate with CI/CD

## Philosophy

**"Load only what you need"**

The three-tier system follows this principle:
- Most work is focused on ONE area
- Reading everything is wasteful
- Context should be available at appropriate granularity
- Smart architecture upfront pays dividends in reduced token costs

## Results

After implementing this system:
- ✅ 60-80% reduction in token usage per session
- ✅ Faster AI startup (less context to process)
- ✅ Complete history preserved at every tier
- ✅ Easy navigation between related documentation
- ✅ Automatic session tracking and propagation

## Support

This system was developed and refined through real usage. The templates provided are battle-tested and ready for production use.

For questions or improvements, refer to the original implementation or adapt as needed for your specific workflow.

---

**Quick Reference:**

| Work Type | Read These Files | Token Cost | Savings |
|-----------|------------------|------------|---------|
| Specific project | Tier 3 project files | ~3-5k | 88% |
| Multiple projects | Tier 2 files | ~5-8k | 80% |
| Vault structure | Tier 1 files | ~10k | 60% |
| Quick context | `git log -5 --oneline --stat` | ~1-3k | 90%+ |
