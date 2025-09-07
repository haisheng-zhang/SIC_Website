#!/bin/bash

# Test script - Check website deployment compatibility on GitHub Pages

echo "===== SIC Website GitHub Pages Deployment Compatibility Test ====="
echo ""

# Check file structure
echo "Checking file structure..."

# Check required files
required_files=("index.html" "sitemap.xml" "robots.txt")
for file in "${required_files[@]}"; do
    if [ ! -f "$file" ]; then
        echo "❌ Error: Required file $file not found"
    else
        echo "✅ Required file $file found"
    fi
 done

# Check required directories
required_dirs=("css" "js" "pages" "resources")
for dir in "${required_dirs[@]}"; do
    if [ ! -d "$dir" ]; then
        echo "❌ Error: Required directory $dir not found"
    else
        echo "✅ Required directory $dir found"
    fi
done

# Check HTML file validity
echo ""
echo "Checking HTML file validity..."

html_files=($(find . -name "*.html"))
html_errors=0

for file in "${html_files[@]}"; do
    # Simple check if HTML file contains required tags
    if ! grep -q "<!DOCTYPE html>" "$file" || ! grep -q "<html" "$file" || ! grep -q "</html>" "$file"; then
        echo "❌ Error: HTML file $file may not be a valid HTML file"
        html_errors=$((html_errors+1))
    fi
done

if [ $html_errors -eq 0 ]; then
    echo "✅ All HTML files passed format check"
fi

# Check relative paths
echo ""
echo "Checking relative paths..."

# Check for absolute path references (this may cause issues on GitHub Pages)
absolute_paths=$(grep -r "href=\"/" --include="*.html" . | wc -l)
if [ $absolute_paths -gt 0 ]; then
    echo "⚠️ Warning: Found $absolute_paths possible absolute path references, which may cause issues on GitHub Pages"
else
    echo "✅ No absolute path references found"
fi

# Check for special characters or spaces in filenames
echo ""
echo "Checking filenames..."

problematic_files=$(find . -name "* *" -o -name "*[\!\@\#\$\%\^\&\*\(\)\+\=\{\}\[\]\|\:\;\'\"\\\/\<\>\?]*" | wc -l)
if [ $problematic_files -gt 0 ]; then
    echo "⚠️ Warning: Found $problematic_files filenames containing spaces or special characters, which may cause issues on some servers"
else
    echo "✅ All filenames are correctly formatted"
fi

# Summary
echo ""
echo "===== Test Summary ====="
if [ $html_errors -eq 0 ] && [ $absolute_paths -eq 0 ] && [ $problematic_files -eq 0 ]; then
    echo "✅ All tests passed! The website should be deployable on GitHub Pages."
    echo "Please use the deploy.sh script to deploy to GitHub Pages."
else
    echo "⚠️ Some potential issues found, please review the warnings and errors above."
    echo "Fix these issues before attempting deployment."
fi

echo ""
echo "Note: This test script only checks basic deployment compatibility issues and does not guarantee all website features will work on GitHub Pages."
echo "It is recommended to perform actual testing on a GitHub Pages environment after deployment."