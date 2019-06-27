@echo off&setlocal enabledelayedexpansion
::保存ip到test.txt
::ipconfig | findstr IPv4 > test.txt
::读入ip,设置参数
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
