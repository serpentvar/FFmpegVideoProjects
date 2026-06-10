@echo off
setlocal EnableExtensions EnableDelayedExpansion

for %%a in (%*) do (
  if %%~za EQU 0 (
    echo Skipping empty input file: %%~fa
  ) else (
    set "OUT=%%~dpna_youtube_4k.mp4"
    set "TMP=%%~dpna_youtube_4k.tmp.mp4"
    if exist "!TMP!" del /q "!TMP!"

  "ffmpeg.exe" -hide_banner -y -i "%%~fa" ^
  -c:v h264_nvenc -preset p5 -rc vbr -cq 18 -b:v 60M -maxrate 68M -bufsize 120M ^
  -profile:v high -pix_fmt yuv420p ^
  -c:a aac -b:a 192k -ar 48000 -ac 2 ^
  -movflags +faststart ^
  "!TMP!"

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
