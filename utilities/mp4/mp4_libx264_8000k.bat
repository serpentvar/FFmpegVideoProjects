@echo off
setlocal EnableExtensions EnableDelayedExpansion

:: Get the current timestamp
for /f "tokens=2 delims==" %%a in ('wmic os get localdatetime /format:list') do set "datetime=%%a"
set "timestamp=%datetime:~0,8%%datetime:~8,6%"

for %%a in (%*) do (
  if %%~za EQU 0 (
    echo Skipping empty input file: %%~fa
  ) else (
    set "OUT=%%~dpna_%timestamp%_8000k.mp4"
    set "TMP=%%~dpna_%timestamp%_8000k.tmp.mp4"
    if exist "!TMP!" del /q "!TMP!"

    "ffmpeg.exe" -y -i "%%~fa" -c:v libx264 -b:v 8000k -c:a copy "!TMP!"

    if errorlevel 1 (
      echo Failed: %%~fa
      if exist "!TMP!" del /q "!TMP!"
    ) else (
      move /y "!TMP!" "!OUT!" > nul
      echo Created: !OUT!
    )
  )
)
pause
