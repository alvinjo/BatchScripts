@echo off
goto :start


:start
>password.txt (
netsh wlan show profiles
)
for /F "skip=9 delims=" %%i in (password.txt) do set "line=%%i" & goto :next


:next
for /f "tokens=2 delims=:" %%a in ("%line%") do (
  set snip=%%a
)
>password.txt (
netsh wlan show profiles "%snip:~1,999%" key=clear
)
for /F "skip=29 delims=" %%c in (password.txt) do set "keyline=%%c" & goto :final


:final
for /F "tokens=2 delims=:" %%d in ("%keyline%") do (
  set key=%%d
)
echo %key:~1, 999%
echo %key:~1, 999% >password.txt
pause








