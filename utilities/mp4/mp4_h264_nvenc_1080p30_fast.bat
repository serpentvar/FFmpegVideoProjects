@echo off
setlocal EnableExtensions EnableDelayedExpansion

for %%a in (%*) do (
  if %%~za EQU 0 (
    echo Skipping empty input file: %%~fa
  ) else (
    set "OUT=%%~dpna_compressed.mp4"
    set "TMP=%%~dpna_compressed.tmp.mp4"
    if exist "!TMP!" del /q "!TMP!"

    ffmpeg -hide_banner -y -i "%%~fa" -c:v h264_nvenc -preset:v fast -b:v 4500k -maxrate 4500k -bufsize 9000k -r 60 -g 120 -keyint_min 60 -sc_threshold 0 -c:a copy -f mp4 "!TMP!"

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
