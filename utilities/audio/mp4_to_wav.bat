@echo off
setlocal EnableExtensions EnableDelayedExpansion

for %%a in (%*) do (
  if %%~za EQU 0 (
    echo Skipping empty input file: %%~fa
  ) else (
    set "OUT=%%~dpna.wav"
    set "TMP=%%~dpna.tmp.wav"
    if exist "!TMP!" del /q "!TMP!"

    "ffmpeg.exe" -y -i "%%~fa" -vn -c:a pcm_s16le -ar 44100 "!TMP!"

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
