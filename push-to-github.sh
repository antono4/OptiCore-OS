#!/bin/bash
# ==========================================
# OptiCore OS - Push to GitHub Script
# ==========================================
# Version: 1.0.0
# Author: OptiCore Team
# Description: Push OptiCore OS to GitHub repository

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configuration
REPO_OWNER="antono4"
REPO_NAME="OptiCore-OS"
GIT_BRANCH="main"

echo ""
echo -e "${CYAN}╔═══════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║   OptiCore OS - Push to GitHub             ║${NC}"
echo -e "${CYAN}╚═══════════════════════════════════════════╝${NC}"
echo ""

# Get current directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo -e "${RED}[ERROR] Not a git repository. Please initialize git first.${NC}"
    echo "Run: git init"
    exit 1
fi

# Configure git user if not set
if [ -z "$(git config user.name)" ]; then
    echo -e "${YELLOW}[INFO] Git user name not set. Configuring...${NC}"
    read -p "Enter your GitHub username: " GIT_USER
    git config user.name "$GIT_USER"
    git config user.email "$GIT_USER@users.noreply.github.com"
fi

# Set remote URL
echo ""
echo -e "${YELLOW}[STEP 1] Setting up remote repository...${NC}"

# Check if origin remote exists
if git remote get-url origin &> /dev/null; then
    echo -e "${YELLOW}[INFO] Remote 'origin' already exists.${NC}"
    read -p "Update remote URL? (y/n): " UPDATE_REMOTE
    if [ "$UPDATE_REMOTE" = "y" ] || [ "$UPDATE_REMOTE" = "Y" ]; then
        git remote set-url origin "https://github.com/$REPO_OWNER/$REPO_NAME.git"
        echo -e "${GREEN}[OK] Remote URL updated${NC}"
    fi
else
    git remote add origin "https://github.com/$REPO_OWNER/$REPO_NAME.git"
    echo -e "${GREEN}[OK] Remote 'origin' added${NC}"
fi

# Show current status
echo ""
echo -e "${YELLOW}[STEP 2] Git Status${NC}"
echo "----------------------------------------"
git status
echo "----------------------------------------"

# Check for uncommitted changes
if ! git diff --quiet || ! git diff --cached --quiet; then
    echo ""
    echo -e "${YELLOW}[WARNING] You have uncommitted changes.${NC}"
    read -p "Commit changes before pushing? (y/n): " COMMIT_CHANGES
    if [ "$COMMIT_CHANGES" = "y" ] || [ "$COMMIT_CHANGES" = "Y" ]; then
        echo ""
        read -p "Enter commit message: " COMMIT_MSG
        if [ -z "$COMMIT_MSG" ]; then
            COMMIT_MSG="Update OptiCore OS"
        fi
        git add .
        git commit -m "$COMMIT_MSG"
        echo -e "${GREEN}[OK] Changes committed${NC}"
    fi
fi

# Push to GitHub
echo ""
echo -e "${YELLOW}[STEP 3] Pushing to GitHub...${NC}"
echo "Repository: https://github.com/$REPO_OWNER/$REPO_NAME"
echo "Branch: $GIT_BRANCH"
echo ""

# Set upstream and push
git branch -M "$GIT_BRANCH"

# Try pushing with token if available
if [ -n "$GITHUB_TOKEN" ]; then
    git remote set-url origin "https://x-access-token:$GITHUB_TOKEN@github.com/$REPO_OWNER/$REPO_NAME.git"
fi

git push -u origin "$GIT_BRANCH" --force

# Check result
if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}╔═══════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║        Push Successful! 🎉                ║${NC}"
    echo -e "${GREEN}╚═══════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "Repository URL: ${CYAN}https://github.com/$REPO_OWNER/$REPO_NAME${NC}"
    echo -e "Clone URL: ${CYAN}git@github.com:$REPO_OWNER/$REPO_NAME.git${NC}"
    echo ""
else
    echo ""
    echo -e "${RED}╔═══════════════════════════════════════════╗${NC}"
    echo -e "${RED}║        Push Failed!                       ║${NC}"
    echo -e "${RED}╚═══════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${YELLOW}Troubleshooting:${NC}"
    echo "1. Make sure repository '$REPO_NAME' exists on GitHub"
    echo "2. Check your GitHub credentials"
    echo "3. Ensure you have push permissions"
    echo ""
    echo -e "Create repository at:${NC}"
    echo -e "${CYAN}https://github.com/new${NC}"
    echo ""
fi

echo ""
read -p "Press Enter to exit..."