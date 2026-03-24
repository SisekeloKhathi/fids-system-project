@echo off
echo Installing FIDS System...
mkdir C:\nginx\html\fids 2>nul
mkdir C:\fids 2>nul
xcopy nginx C:\nginx\ /E /I /Y
xcopy fids-backend C:\fids\ /E /I /Y
cd /d C:\nginx
start nginx
cd /d C:\fids
start cmd /k "uvicorn app:app --host 0.0.0.0 --port 5000"
echo FIDS Ready at http://localhost
pause
