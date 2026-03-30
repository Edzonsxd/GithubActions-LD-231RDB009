@echo off
set "RUNNER_TRACKING_ID="
call pm2 delete greetings-app-%~1 >NUL 2>&1
exit /b 0
