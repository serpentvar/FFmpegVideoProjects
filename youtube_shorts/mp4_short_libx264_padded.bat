@echo off
setlocal EnableDelayedExpansion

rem Tunable settings
set "CRF=18"
set "PRESET=slow"
set "MAXRATE=12M"
set "BUFSIZE=24M"
set "AUDIO_BR=192k"
set "KEYINT=120"

if "%~1"=="" (
  echo Drag one or more videos onto this script.
  pause
  exit /b
)

for %%A in (%*) do (
  if %%~zA EQU 0 (
    echo Skipping empty input file: %%~fA
  ) else (
    set "IN=%%~fA"
    set "OUT=%%~dpnA_shorts.mp4"
    set "TMP=%%~dpnA_shorts.tmp.mp4"
    if exist "!TMP!" del /q "!TMP!"

    echo Processing: %%~nxA
    ffmpeg -hide_banner -y -i "!IN!" -vf "scale=1080:1920:force_original_aspect_ratio=decrease,setsar=1,pad=1080:1920:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -preset %PRESET% -profile:v high -level 4.1 -pix_fmt yuv420p -crf %CRF% -maxrate %MAXRATE% -bufsize %BUFSIZE% -r 30 -g %KEYINT% -sc_threshold 0 -color_primaries bt709 -color_trc bt709 -colorspace bt709 -c:a aac -b:a %AUDIO_BR% -ar 48000 -ac 2 -movflags +faststart "!TMP!"

    if errorlevel 1 (
      echo Failed: %%~fA
      if exist "!TMP!" del /q "!TMP!"
    ) else (
      move /y "!TMP!" "!OUT!" > nul
      echo Created: !OUT!
    )
  )
)

echo Done. Output: *_shorts.mp4
pause
