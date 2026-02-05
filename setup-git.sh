#!/bin/bash

# ═══════════════════════════════════════════════════════════════
# 🛡️ WARRIOR ENS API - GIT CONFIGURATION SCRIPT
# ═══════════════════════════════════════════════════════════════
# Repository: https://github.com/asrar-mared/warrior-ens-api
# Purpose: Automated Git configuration and initial commit setup
# ═══════════════════════════════════════════════════════════════

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# ═══════════════════════════════════════════════════════════════
# CONFIGURATION
# ═══════════════════════════════════════════════════════════════

GIT_USERNAME="asrar-mared"
GIT_EMAIL="nike49424@gmail.com"
GIT_EMAIL_BACKUP="nike49424@proton.me"
REPO_URL="https://github.com/asrar-mared/warrior-ens-api.git"
TELEGRAM_CHANNEL="https://t.me/boost?c=2982645300"

# ═══════════════════════════════════════════════════════════════
# FUNCTIONS
# ═══════════════════════════════════════════════════════════════

print_header() {
    echo ""
    echo -e "${PURPLE}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${PURPLE}🛡️  $1${NC}"
    echo -e "${PURPLE}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${CYAN}ℹ️  $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

# ═══════════════════════════════════════════════════════════════
# MAIN SCRIPT
# ═══════════════════════════════════════════════════════════════

print_header "GIT CONFIGURATION & SETUP"

# Check if Git is installed
if ! command -v git &> /dev/null; then
    print_error "Git is not installed. Please install Git first."
    exit 1
fi

print_success "Git is installed: $(git --version)"

# ═══════════════════════════════════════════════════════════════
# STEP 1: Configure Git User
# ═══════════════════════════════════════════════════════════════

print_header "STEP 1: Configuring Git User"

# Check current configuration
echo -e "${BLUE}Current Git Configuration:${NC}"
echo "Username: $(git config --global user.name 2>/dev/null || echo 'Not set')"
echo "Email: $(git config --global user.email 2>/dev/null || echo 'Not set')"
echo ""

# Ask user if they want to update
read -p "Do you want to update Git configuration? (y/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Set username
    git config --global user.name "$GIT_USERNAME"
    print_success "Username set to: $GIT_USERNAME"
    
    # Set primary email
    git config --global user.email "$GIT_EMAIL"
    print_success "Email set to: $GIT_EMAIL"
    
    # Display updated configuration
    echo ""
    echo -e "${GREEN}Updated Git Configuration:${NC}"
    echo "Username: $(git config --global user.name)"
    echo "Email: $(git config --global user.email)"
else
    print_info "Skipping Git configuration update"
fi

# ═══════════════════════════════════════════════════════════════
# STEP 2: Initialize Repository (if needed)
# ═══════════════════════════════════════════════════════════════

print_header "STEP 2: Repository Initialization"

if [ ! -d ".git" ]; then
    print_info "Initializing Git repository..."
    git init
    print_success "Repository initialized"
else
    print_info "Repository already initialized"
fi

# ═══════════════════════════════════════════════════════════════
# STEP 3: Add Remote
# ═══════════════════════════════════════════════════════════════

print_header "STEP 3: Configuring Remote"

# Check if remote exists
if git remote | grep -q "origin"; then
    print_info "Remote 'origin' already exists"
    echo "Current remote: $(git remote get-url origin)"
    
    read -p "Do you want to update the remote URL? (y/n): " -n 1 -r
    echo ""
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git remote set-url origin "$REPO_URL"
        print_success "Remote URL updated to: $REPO_URL"
    fi
else
    git remote add origin "$REPO_URL"
    print_success "Remote 'origin' added: $REPO_URL"
fi

# ═══════════════════════════════════════════════════════════════
# STEP 4: Create .gitignore (if not exists)
# ═══════════════════════════════════════════════════════════════

print_header "STEP 4: Creating .gitignore"

if [ ! -f ".gitignore" ]; then
    print_info "Creating .gitignore file..."
    
    # Use the .gitignore file we created earlier
    if [ -f ".gitignore" ]; then
        print_success ".gitignore already exists"
    else
        print_warning ".gitignore file not found. Please create it manually."
    fi
else
    print_success ".gitignore already exists"
fi

# ═══════════════════════════════════════════════════════════════
# STEP 5: Initial Commit
# ═══════════════════════════════════════════════════════════════

print_header "STEP 5: Creating Initial Commit"

# Check if there are any commits
if git rev-parse --verify HEAD >/dev/null 2>&1; then
    print_info "Repository already has commits"
    
    # Show status
    echo ""
    echo -e "${BLUE}Current Status:${NC}"
    git status --short
    
    read -p "Do you want to stage and commit changes? (y/n): " -n 1 -r
    echo ""
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        # Stage all changes
        git add .
        print_success "Changes staged"
        
        # Ask for commit message
        echo ""
        echo -e "${YELLOW}Enter commit message (or press Enter for default):${NC}"
        read -r COMMIT_MSG
        
        if [ -z "$COMMIT_MSG" ]; then
            COMMIT_MSG="chore: update project files and configuration"
        fi
        
        # Commit
        git commit -m "$COMMIT_MSG"
        print_success "Changes committed: $COMMIT_MSG"
    fi
else
    print_info "Creating initial commit..."
    
    # Stage all files
    git add .
    
    # Create initial commit
    git commit -m "🎉 feat: initial commit - Warrior ENS API

- Professional ENS resolution API with TypeScript
- Multi-provider fallback system
- Advanced caching (Memory + Redis)
- WebSocket support for real-time updates
- Comprehensive security features
- Docker deployment ready
- Full test coverage

Repository: $REPO_URL
Author: $GIT_USERNAME <$GIT_EMAIL>
Community: $TELEGRAM_CHANNEL"
    
    print_success "Initial commit created"
fi

# ═══════════════════════════════════════════════════════════════
# STEP 6: Create Default Branch
# ═══════════════════════════════════════════════════════════════

print_header "STEP 6: Configuring Default Branch"

# Get current branch name
CURRENT_BRANCH=$(git branch --show-current)

if [ "$CURRENT_BRANCH" != "main" ]; then
    print_info "Renaming branch to 'main'..."
    git branch -M main
    print_success "Default branch set to 'main'"
else
    print_success "Already on 'main' branch"
fi

# ═══════════════════════════════════════════════════════════════
# STEP 7: Push to Remote
# ═══════════════════════════════════════════════════════════════

print_header "STEP 7: Pushing to GitHub"

echo ""
read -p "Do you want to push to GitHub now? (y/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    print_info "Pushing to origin/main..."
    
    # Push with upstream
    if git push -u origin main; then
        print_success "Successfully pushed to GitHub!"
        echo ""
        echo -e "${GREEN}🎉 Repository is now live at:${NC}"
        echo -e "${BLUE}$REPO_URL${NC}"
    else
        print_error "Push failed. This might be due to:"
        echo "  1. Authentication issues (use Personal Access Token)"
        echo "  2. Remote repository not created yet"
        echo "  3. Network connectivity issues"
        echo ""
        print_info "Manual push command:"
        echo "  git push -u origin main"
    fi
else
    print_info "Skipping push. You can push later with:"
    echo "  git push -u origin main"
fi

# ═══════════════════════════════════════════════════════════════
# STEP 8: Summary & Next Steps
# ═══════════════════════════════════════════════════════════════

print_header "SETUP COMPLETE! 🎉"

echo -e "${GREEN}Git Configuration Summary:${NC}"
echo ""
echo "Repository URL: $REPO_URL"
echo "Username: $GIT_USERNAME"
echo "Email: $GIT_EMAIL"
echo "Backup Email: $GIT_EMAIL_BACKUP"
echo "Default Branch: main"
echo "Telegram: $TELEGRAM_CHANNEL"
echo ""

echo -e "${CYAN}Next Steps:${NC}"
echo ""
echo "1. 📝 Complete README.md with project details"
echo "2. 🧪 Add tests and ensure coverage > 80%"
echo "3. 🔒 Set up GitHub Actions for CI/CD"
echo "4. 📦 Create first release (v1.0.0)"
echo "5. 🌟 Add project to README badge services"
echo "6. 📢 Announce on Telegram channel"
echo ""

echo -e "${YELLOW}Useful Git Commands:${NC}"
echo ""
echo "# Check status"
echo "git status"
echo ""
echo "# Create new branch"
echo "git checkout -b feature/new-feature"
echo ""
echo "# Stage and commit"
echo "git add ."
echo "git commit -m \"feat: add new feature\""
echo ""
echo "# Push changes"
echo "git push origin main"
echo ""
echo "# Pull latest changes"
echo "git pull origin main"
echo ""

echo -e "${PURPLE}═══════════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}✅ Git setup complete! Happy coding! 🚀${NC}"
echo -e "${PURPLE}═══════════════════════════════════════════════════════════════${NC}"
echo ""

