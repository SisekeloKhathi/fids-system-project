@echo off
echo ========================================
echo   FIDS System Installer
echo ========================================
echo.

echo Creating directories...
mkdir C:\nginx\html\fids 2>nul
mkdir C:\fids 2>nul

echo Copying NGINX files...
xcopy nginx C:\nginx\ /E /I /Y

echo Copying backend files...
xcopy fids-backend C:\fids\ /E /I /Y

echo Starting NGINX...
cd /d C:\nginx
start nginx

echo Starting FastAPI...
cd /d C:\fids
start cmd /k "uvicorn app:app --host 0.0.0.0 --port 5000"

echo.
echo ========================================
echo   FIDS System Ready!
echo   Open browser: http://localhost
echo ========================================
pause
