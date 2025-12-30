# Context File - [Project Name]

**Level:** Tier 3 - Individual Project
**Project:** [Project Name]
**Purpose:** [Brief description of what this project does]
**Last Updated:** [DATE]

---

## 🔍 Quick Context (Start Here!)

**Before diving into this file, get recent changes:**
```bash
git log -5 --oneline --stat -- projects/[ProjectName]/
```
This shows what changed in THIS project since your last session (~1-3k tokens vs reading everything).

**Then proceed with project work.**

---

## 📁 Three-Tier Session Structure

### Tier 1: Vault Level
- **File:** [docs/docs-session-summary.md](../../docs/docs-session-summary.md)
- **When to use:** Working on vault structure or multiple unrelated areas

### Tier 2: Projects Overview
- **File:** [projects/projects-session-summary.md](../projects-session-summary.md)
- **When to use:** Working on multiple projects

### Tier 3: This Project (You Are Here)
- **Context:** `[ProjectName]-claude.md` (this file)
- **Sessions:** [ProjectName-session-summary.md](.//[ProjectName]-session-summary.md)
- **When to use:** Working exclusively on [Project Name]

---

## Project Overview

### Purpose
[What problem does this project solve? What is its main goal?]

### Current Status
- **Phase:** [Planning/Development/Testing/Production/Maintenance]
- **Version:** [If applicable]
- **Last Activity:** [DATE]

### Key Features
- Feature 1 - Description
- Feature 2 - Description
- Feature 3 - Description

---

## Project Structure

```
projects/[ProjectName]/
├── [ProjectName]-claude.md           # This file
├── [ProjectName]-session-summary.md  # Project session history
├── README.md                         # Project introduction
├── src/                              # Source code
│   ├── main.py/index.js/etc         # Main entry point
│   └── [other source files]
├── docs/                             # Project documentation
├── tests/                            # Test files
└── [other project directories]
```

### Important Files

**Core Files:**
- `file1.ext` - Description and purpose
- `file2.ext` - Description and purpose

**Configuration:**
- `config.ext` - Configuration file purpose

**Documentation:**
- `README.md` - Project overview
- `docs/guide.md` - User guide

---

## Technology Stack

### Languages
- **Primary:** [Language] ([version])
- **Secondary:** [Language] ([version])

### Frameworks/Libraries
- [Framework 1] - [Purpose]
- [Library 1] - [Purpose]

### Tools
- [Tool 1] - [Purpose]
- [Tool 2] - [Purpose]

---

## Development Setup

### Prerequisites
```bash
# List required software
[tool] --version  # Required: version X.X+
```

### Installation
```bash
# Clone repository (if separate) or navigate to project
cd projects/[ProjectName]

# Install dependencies
[package manager] install

# Setup configuration
cp config.example.ext config.ext
# Edit config.ext with your settings
```

### Running the Project
```bash
# Development mode
[command to run in dev mode]

# Production mode
[command to run in production]

# Run tests
[command to run tests]
```

---

## Architecture

### Overview
[High-level description of how the project is organized and how components interact]

### Key Components

**Component 1:**
- Location: `path/to/component`
- Purpose: What it does
- Dependencies: What it relies on

**Component 2:**
- Location: `path/to/component`
- Purpose: What it does
- Dependencies: What it relies on

### Data Flow
```
[Describe or diagram how data flows through the system]
User Input → Component A → Component B → Output
```

---

## Configuration

### Environment Variables
```bash
VAR_NAME=value          # Description of what this controls
ANOTHER_VAR=value       # Description
```

### Configuration Files
- `config.ext` - [What settings are here]
- `settings.ext` - [What settings are here]

---

## Common Tasks

### Task 1: [Common Operation]
```bash
# Description of what this does
[command]
```

### Task 2: [Another Operation]
```bash
# Description
[command]
```

### Task 3: [Development Workflow]
```bash
# Description
[command]
```

---

## Current Focus

### Active Work
[What is currently being worked on in this project]

### Recent Changes
[Brief summary of recent significant changes]

### Next Priorities
1. [Priority 1]
2. [Priority 2]
3. [Priority 3]

---

## Known Issues

### Issue 1
- **Problem:** Description of the issue
- **Impact:** How it affects usage
- **Workaround:** Temporary solution if any
- **Status:** [Open/In Progress/Resolved]

### Issue 2
- **Problem:** Description
- **Impact:** How it affects usage
- **Status:** [Status]

---

## Testing

### Running Tests
```bash
[command to run all tests]
[command to run specific test]
```

### Test Coverage
- [Coverage percentage if tracked]
- [Important areas covered]

### Test Strategy
[Brief description of testing approach]

---

## Deployment

### Production Environment
- **Location:** [Where it's deployed]
- **URL:** [If applicable]
- **Access:** [How to access]

### Deployment Process
```bash
# Step 1
[command]

# Step 2
[command]

# Step 3
[command]
```

---

## Dependencies

### External Projects
- [Project Name] - [How it's used]

### Internal Dependencies
- [Other project in this repo] - [Relationship]

---

## Documentation

### Internal Documentation
- [ProjectName]-session-summary.md - Session history
- README.md - Project introduction
- docs/ - Detailed guides

### External Resources
- [Official docs] - [URL]
- [Tutorial] - [URL]
- [Reference] - [URL]

---

## Maintenance Notes

### Regular Tasks
- [Task that needs periodic attention]
- [Another maintenance task]

### Update Schedule
- [Dependency] - Check for updates [frequency]
- [Component] - Review [frequency]

---

## Navigation

- **🏠 Vault Context:** [docs/docs-claude.md](../../docs/docs-claude.md)
- **📁 Projects Overview:** [projects-claude.md](../projects-claude.md)
- **📋 This Project Sessions:** [[ProjectName]-session-summary.md](.//[ProjectName]-session-summary.md)
- **📚 Project README:** [README.md](./README.md)

---

*This file is part of the three-tier documentation system. See [THREE_TIER_SYSTEM_GUIDE.md](../../THREE_TIER_SYSTEM_GUIDE.md) for more information.*
