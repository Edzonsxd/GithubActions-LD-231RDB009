@echo off
setlocal
set "ENV_NAME=%~1"
set "PORT=%~2"
set "PYTHON_EXE=%~3"
set "RUNNER_TRACKING_ID="
call pm2 start app.py --name greetings-app-%ENV_NAME% --interpreter "%PYTHON_EXE%" -- --port %PORT%
exit /b %ERRORLEVEL%
