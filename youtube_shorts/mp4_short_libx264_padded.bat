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
  set "IN=%%~fA"
  set "OUT=%%~dpnA_shorts.mp4"

  echo Processing: %%~nxA
  ffmpeg -y -i "!IN!" -vf "scale=1080:1920:force_original_aspect_ratio=decrease,setsar=1,pad=1080:1920:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -preset %PRESET% -profile:v high -level 4.1 -pix_fmt yuv420p -crf %CRF% -maxrate %MAXRATE% -bufsize %BUFSIZE% -g %KEYINT% -sc_threshold 0 -color_primaries bt709 -color_trc bt709 -colorspace bt709 -c:a aac -b:a %AUDIO_BR% -ar 48000 -ac 2 -movflags +faststart "!OUT!"
)

echo Done. Output: *_shorts.mp4
pause
