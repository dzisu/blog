#!/bin/bash

echo "📁 מעבר לתיקיית הבלוג..."
cd "$(dirname "$0")"

# 1. הסרת submodule אם קיים
echo "🧹 הסרת תבנית PaperMod כסאבמודול (אם קיים)..."
git submodule deinit -f themes/PaperMod 2>/dev/null
git rm -f themes/PaperMod 2>/dev/null
rm -rf .gitmodules

# 2. הורדת התבנית מחדש
echo "⬇️ הורדת PaperMod לתיקייה themes/PaperMod..."
mkdir -p themes
git clone https://github.com/adityatelange/hugo-PaperMod themes/PaperMod

# 3. הוספה וקומיט
echo "➕ הוספת הקבצים ל-Git..."
git add themes/PaperMod
git commit -m "fix: include PaperMod as a regular folder"
git push

echo "✅ סיום. כעת ניתן לבנות את האתר ולחבר ל-GitHub Pages"
