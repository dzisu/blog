@echo off
echo 🔧 בונה את האתר עם Hugo...
hugo

IF NOT EXIST docs\index.html (
    echo ❌ לא נוצר index.html בתיקיית docs. בדוק את ההתקנה.
    pause
    exit /b 1
)

echo ✅ בוצעה בניה בהצלחה. מבצע git add...
git add .

echo 🔄 מבצע git commit...
git commit -m "🚀 Deploy Hugo site to GitHub Pages"

echo ⬆️ שולח שינויים ל-GitHub...
git push origin main

echo.
echo 🟢 הבלוג נשלח בהצלחה! המתן מספר שניות לבדיקה ב-GitHub Pages.
pause
