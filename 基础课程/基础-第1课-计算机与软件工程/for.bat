@echo off&setlocal enabledelayedexpansion
::����ip��test.txt
::ipconfig | findstr IPv4 > test.txt
::����ip,���ò���
set i=1
for /f "tokens=2 delims=:" %%a in (test.txt) do (
  set /a i=!i!+1
  if !i!==3 (
  set "ip=%%a"
  echo !ip!
  ping !ip!
)
 )
echo ok

pause
