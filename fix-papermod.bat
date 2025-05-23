@echo off
setlocal enabledelayedexpansion

echo 🔍 מנקה שרידי Submodule אם קיימים...

:: מחיקת הרישום מ-.gitmodules אם קיים
if exist .gitmodules (
    findstr /v "PaperMod" .gitmodules > temp_gitmodules
    move /Y temp_gitmodules .gitmodules > nul
    git rm --cached themes/PaperMod -f > nul 2>&1
    echo 🧹 מחקנו רישום מ-.gitmodules והסרנו את הסאבמודול מהאינדקס.
)

:: מחיקת המטא־מידע של הסאבמודול אם קיים
if exist ".git\modules\themes\PaperMod" (
    rmdir /s /q ".git\modules\themes\PaperMod"
    echo 🧹 נמחק המטא־מידע מה-.git\modules.
)

:: בדיקה שהתיקייה קיימת
if not exist "themes\PaperMod" (
    echo ❌ לא נמצאה תיקיית themes\PaperMod
    exit /b 1
)

:: הוספה מחדש לגיט
git add themes/PaperMod
echo ✅ קבצי PaperMod נוספו מחדש ל-Git.

:: קומיט
git commit -m "המרת PaperMod מתת־מודול לתיקייה רגילה"
echo 📦 בוצע commit עם ההודעה המתאימה.

:: פוש
git push origin main
echo 🚀 בוצע Push ל-GitHub.

echo.
echo 🎉 סיום. נסה כעת להריץ את GitHub Actions!
