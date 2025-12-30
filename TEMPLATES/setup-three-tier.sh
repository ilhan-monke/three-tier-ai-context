#!/bin/bash

# Three-Tier Documentation System Setup Script
# This script sets up the three-tier documentation structure in your repository

set -e  # Exit on any error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Three-Tier Documentation System Setup${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Check if we're in a git repository
if [ ! -d .git ]; then
    echo -e "${YELLOW}Warning: Not in a git repository. Continue anyway? (y/n)${NC}"
    read -r response
    if [ "$response" != "y" ]; then
        echo "Setup cancelled."
        exit 1
    fi
fi

# Determine template directory location
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$SCRIPT_DIR"

# Check if templates exist
if [ ! -f "$TEMPLATE_DIR/tier1-claude-template.md" ]; then
    echo -e "${YELLOW}Error: Templates not found in $TEMPLATE_DIR${NC}"
    echo "Make sure you're running this script from the TEMPLATES directory"
    echo "or that the template files are present."
    exit 1
fi

echo -e "${GREEN}✓ Found templates in $TEMPLATE_DIR${NC}"
echo ""

# Create directory structure
echo -e "${BLUE}Creating directory structure...${NC}"
mkdir -p docs
mkdir -p projects
mkdir -p agents
echo -e "${GREEN}✓ Created: docs/, projects/, agents/${NC}"
echo ""

# Copy Tier 1 files
echo -e "${BLUE}Setting up Tier 1 (Vault Level)...${NC}"
cp "$TEMPLATE_DIR/tier1-claude-template.md" docs/docs-claude.md
cp "$TEMPLATE_DIR/tier1-session-template.md" docs/docs-session-summary.md
echo -e "${GREEN}✓ Created: docs/docs-claude.md${NC}"
echo -e "${GREEN}✓ Created: docs/docs-session-summary.md${NC}"
echo ""

# Copy Tier 2 files
echo -e "${BLUE}Setting up Tier 2 (Projects Overview)...${NC}"
cp "$TEMPLATE_DIR/tier2-claude-template.md" projects/projects-claude.md
cp "$TEMPLATE_DIR/tier2-session-template.md" projects/projects-session-summary.md
echo -e "${GREEN}✓ Created: projects/projects-claude.md${NC}"
echo -e "${GREEN}✓ Created: projects/projects-session-summary.md${NC}"
echo ""

# Copy agent template
echo -e "${BLUE}Setting up session management agent...${NC}"
cp "$TEMPLATE_DIR/close-and-commit-agent-template.md" agents/close_and_commit_GIT.md
echo -e "${GREEN}✓ Created: agents/close_and_commit_GIT.md${NC}"
echo ""

# Ask about creating first project
echo -e "${YELLOW}Would you like to create your first project? (y/n)${NC}"
read -r create_project

if [ "$create_project" = "y" ]; then
    echo -e "${BLUE}Enter your project name (no spaces, use CamelCase or underscores):${NC}"
    read -r project_name

    if [ -n "$project_name" ]; then
        echo -e "${BLUE}Setting up Tier 3 for project: $project_name...${NC}"
        mkdir -p "projects/$project_name"
        cp "$TEMPLATE_DIR/tier3-claude-template.md" "projects/$project_name/${project_name}-claude.md"
        cp "$TEMPLATE_DIR/tier3-session-template.md" "projects/$project_name/${project_name}-session-summary.md"

        # Replace placeholder in files
        sed -i "s/\[Project Name\]/$project_name/g" "projects/$project_name/${project_name}-claude.md"
        sed -i "s/\[ProjectName\]/$project_name/g" "projects/$project_name/${project_name}-claude.md"
        sed -i "s/\[Project Name\]/$project_name/g" "projects/$project_name/${project_name}-session-summary.md"
        sed -i "s/\[ProjectName\]/$project_name/g" "projects/$project_name/${project_name}-session-summary.md"

        echo -e "${GREEN}✓ Created: projects/$project_name/${project_name}-claude.md${NC}"
        echo -e "${GREEN}✓ Created: projects/$project_name/${project_name}-session-summary.md${NC}"
        echo ""
    fi
fi

# Summary
echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}✓ Setup Complete!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo "Created structure:"
echo "  📁 docs/"
echo "     ├── docs-claude.md"
echo "     └── docs-session-summary.md"
echo "  📁 projects/"
echo "     ├── projects-claude.md"
echo "     ├── projects-session-summary.md"
if [ "$create_project" = "y" ] && [ -n "$project_name" ]; then
echo "     └── $project_name/"
echo "         ├── ${project_name}-claude.md"
echo "         └── ${project_name}-session-summary.md"
fi
echo "  📁 agents/"
echo "     └── close_and_commit_GIT.md"
echo ""
echo -e "${BLUE}Next Steps:${NC}"
echo "1. Edit docs/docs-claude.md - Add your repository information"
echo "2. Edit agents/close_and_commit_GIT.md - Update project detection patterns"
if [ "$create_project" = "y" ] && [ -n "$project_name" ]; then
echo "3. Edit projects/$project_name/${project_name}-claude.md - Add project details"
fi
echo "4. Make a change and test: @agents/close_and_commit_GIT.md"
echo "5. See THREE_TIER_SYSTEM_GUIDE.md for full documentation"
echo ""
echo -e "${YELLOW}Remember to customize the template placeholders:${NC}"
echo "  - [DATE] - Current date"
echo "  - [Project Name] - Your project names"
echo "  - [Description] - Your descriptions"
echo "  - /path/to/your/repo - Your repository path"
echo ""
echo -e "${GREEN}Happy documenting! 🚀${NC}"
