@echo off
cd /d %~dp0
git add .
git commit -m "💾 רענון מלא של הבלוג ודחיפת כל הקבצים מחדש"
git push origin main