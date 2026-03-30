@echo off
setlocal EnableDelayedExpansion
set "PORT=%~1"
set "ENV_NAME=%~2"
set "READY=0"

for /L %%i in (1,1,30) do (
  curl -fsS http://127.0.0.1:%PORT%/greetings | findstr /C:"Hello from Python App!" >NUL 2>&1 && (
    set "READY=1"
    goto :ready
  )
  ping 127.0.0.1 -n 2 >NUL 2>&1
)

:ready
if "!READY!"=="1" (
  echo Service is ready on port %PORT%
  exit /b 0
)

echo Service did not become ready on port %PORT%
call pm2 logs greetings-app-%ENV_NAME% --lines 50 --nostream
exit /b 1
