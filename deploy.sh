#!/bin/bash

# Deployment script - Help deploy the SIC website to GitHub Pages

echo "===== SIC Website GitHub Pages Deployment Script ====="
echo "This script will help you deploy your website to GitHub Pages"
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Error: git command not found. Please install git first."
    exit 1
fi

# Check if in SIC Website directory
if [ ! -f "index.html" ]; then
    echo "Error: index.html file not found. Please make sure you are running this script in the SIC Website directory."
    exit 1
fi

# Ask for GitHub repository URL
read -p "Please enter your GitHub repository URL (e.g.: https://github.com/username/repo.git): " repo_url

if [ -z "$repo_url" ]; then
    echo "Error: Repository URL cannot be empty."
    exit 1
fi

# Check if git repository is initialized
if [ ! -d ".git" ]; then
    echo "Initializing git repository..."
    git init
fi

# Add all files to git
echo "Adding files to git..."
git add .

# Commit changes
echo "Committing changes..."
git commit -m "Update website content"

# Add remote repository (if not already added)
if ! git remote | grep -q "origin"; then
    echo "Adding remote repository..."
    git remote add origin "$repo_url"
else
    echo "Updating remote repository URL..."
    git remote set-url origin "$repo_url"
fi

# Push to GitHub
echo "Pushing to GitHub..."
git push -u origin master

echo ""
echo "===== Deployment Complete ====="
echo "Please enable GitHub Pages in your repository settings:"
echo "1. Go to your repository settings page"
echo "2. Find the 'Pages' option"
echo "3. In the 'Source' section, select the 'master' branch"
echo "4. Click 'Save'"
echo ""
echo "After a few minutes, your website will be available at:"
echo "https://[username].github.io/[repository-name]/"