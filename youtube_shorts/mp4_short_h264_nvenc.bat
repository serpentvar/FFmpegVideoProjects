@echo off
setlocal EnableExtensions EnableDelayedExpansion

for %%a in (%*) do (
  if %%~za EQU 0 (
    echo Skipping empty input file: %%~fa
  ) else (
    set "OUT=%%~dpna_shorts.mp4"
    set "TMP=%%~dpna_shorts.tmp.mp4"
    if exist "!TMP!" del /q "!TMP!"

  "ffmpeg.exe" -hide_banner -y -i "%%~fa" ^
  -vf "scale='if(gt(a,9/16),-1,1080)':'if(gt(a,9/16),1920,-1)',crop=1080:1920,setsar=1" ^
  -c:v h264_nvenc -preset p5 -rc vbr -cq 19 -b:v 10M -maxrate 12M -bufsize 20M ^
  -r 30 -profile:v high -pix_fmt yuv420p ^
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
