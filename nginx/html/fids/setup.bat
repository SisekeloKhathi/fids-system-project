@echo off
echo ========================================
echo   FIDS System Installer
echo ========================================
echo.
echo Creating directories...
mkdir C:\nginx\html\fids 2>nul
mkdir C:\fids 2>nul

echo Copying files...
xcopy nginx\* C:\nginx\ /E /I /Y >nul
xcopy fids-backend\* C:\fids\ /E /I /Y >nul

echo Starting NGINX...
cd /d C:\nginx
start nginx

echo Starting FastAPI Backend...
cd /d C:\fids
start cmd /k "uvicorn app:app --host 0.0.0.0 --port 5000"

echo.
echo ========================================
echo   FIDS System Ready!
echo   Open your browser: http://localhost
echo ========================================
pause
