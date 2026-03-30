@echo off
set "RUNNER_TRACKING_ID="
taskkill /IM python.exe /F /T >NUL 2>&1
timeout /t 1 /nobreak >NUL 2>&1
call pm2 delete greetings-app-%~1 >NUL 2>&1
exit /b 0
