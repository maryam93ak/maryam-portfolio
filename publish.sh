#!/bin/bash
#
# publish.sh — Sync blog posts from Obsidian vault to the Astro site and deploy.
#
# Usage:
#   ./publish.sh          Sync, build, commit, and push (full deploy)
#   ./publish.sh --dry    Sync and build only (no commit/push) — for testing
#   ./publish.sh --sync   Sync files only (no build, no commit)
#
# Source: ~/Life OS/maryamakhyani.com/blog/*.md and ~/Life OS/maryamakhyani.com/playground/*.md
# Target: src/content/blog/*.md
#

set -e

VAULT_BLOG="$HOME/Life OS/maryamakhyani.com/blog"
VAULT_PLAYGROUND="$HOME/Life OS/maryamakhyani.com/playground"
REPO_DIR="$HOME/Programming/maryam-portfolio"
REPO_BLOG="$REPO_DIR/src/content/blog"
REPO_PLAYGROUND="$REPO_DIR/src/content/playground"

MODE="${1:-deploy}"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo ""
echo "=========================================="
echo "  Website Publisher"
echo "=========================================="
echo ""

# --- Step 1: Validate source ---
if [ ! -d "$VAULT_BLOG" ]; then
    echo -e "${RED}Error: Obsidian blog folder not found at:${NC}"
    echo "  $VAULT_BLOG"
    echo ""
    echo "Create it first, then add your .md files there."
    exit 1
fi

# Count source files
SOURCE_COUNT=$(find "$VAULT_BLOG" -name "*.md" -maxdepth 1 | wc -l | tr -d ' ')
if [ "$SOURCE_COUNT" -eq 0 ]; then
    echo -e "${YELLOW}No markdown files found in:${NC}"
    echo "  $VAULT_BLOG"
    echo ""
    echo "Add .md files to publish, then run this again."
    exit 0
fi

echo -e "${GREEN}Found $SOURCE_COUNT post(s) in Obsidian vault${NC}"
echo ""

# --- Step 2: Sync files ---
echo "Syncing blog posts to repo..."
rsync -av --delete --include="*.md" --exclude="*" "$VAULT_BLOG/" "$REPO_BLOG/"

echo ""
echo "Syncing playground photos to repo..."
if [ -d "$VAULT_PLAYGROUND" ]; then
  rsync -av --delete --include="*.md" --exclude="playground-photo-template.md" --exclude="*" "$VAULT_PLAYGROUND/" "$REPO_PLAYGROUND/"
else
  echo -e "${YELLOW}No playground folder found — skipping.${NC}"
fi

echo ""
echo -e "${GREEN}Sync complete.${NC}"

if [ "$MODE" = "--sync" ]; then
    echo ""
    echo "Done (sync only). Files are in:"
    echo "  $REPO_BLOG"
    exit 0
fi

# --- Step 3: Build ---
echo ""
echo "Building site..."
cd "$REPO_DIR"
npm run build 2>&1

echo ""
echo -e "${GREEN}Build successful.${NC}"

if [ "$MODE" = "--dry" ]; then
    echo ""
    echo "Done (dry run). Build output is in:"
    echo "  $REPO_DIR/dist/"
    echo ""
    echo "To deploy for real, run: ./publish.sh"
    exit 0
fi

# --- Step 4: Commit and push ---
echo ""
echo "Committing and pushing..."
cd "$REPO_DIR"

git add src/content/blog/
git add src/content/playground/
git add public/

# Check if there are actual changes to commit
if git diff --cached --quiet; then
    echo -e "${YELLOW}No changes to commit. Site is already up to date.${NC}"
    exit 0
fi

# Build a commit message listing changed files
CHANGED_FILES=$(git diff --cached --name-only | sed 's|src/content/blog/||' | sed 's|src/content/playground/||' | sed 's|.md||' | tr '\n' ', ' | sed 's/,$//')
git commit -m "publish: update content ($CHANGED_FILES)"

git push

echo ""
echo "=========================================="
echo -e "  ${GREEN}Published successfully!${NC}"
echo "=========================================="
echo ""
echo "Vercel will auto-deploy in ~1 minute."
echo "Check your site at: https://www.maryamakhyani.com/blog"
echo ""
