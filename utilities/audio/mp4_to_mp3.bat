@echo off
setlocal EnableExtensions EnableDelayedExpansion

for %%a in (%*) do (
  if %%~za EQU 0 (
    echo Skipping empty input file: %%~fa
  ) else (
    set "OUT=%%~dpna_result.mp3"
    set "TMP=%%~dpna_result.tmp.mp3"
    if exist "!TMP!" del /q "!TMP!"

    "ffmpeg.exe" -y -i "%%~fa" -vn -b:a 128k -c:a libmp3lame -ar 48000 "!TMP!"

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
