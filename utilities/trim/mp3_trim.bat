@echo off
setlocal

if "%~1"=="" (
  echo Drag one or more audio or video files onto this script.
  pause
  exit /b
)

:reinput
set /p begin="Start time (hh:mm:ss, example 00:01:20): "
set /p end="End time (hh:mm:ss, example 00:02:11): "
echo Trim from %begin% to %end%
set "INPUT=r"
set /p INPUT="Continue? y=yes, n=cancel, r=re-enter: "

if /I "%INPUT%"=="r" goto reinput
if /I "%INPUT%"=="n" goto done
if /I not "%INPUT%"=="y" goto reinput

for %%a in (%*) do (
  ffmpeg.exe -ss %begin% -i "%%~fa" -to %end% -vn -b:a 128k -c:a libmp3lame -ar 48000 "%%~dpna_trim_result.mp3"
)

:done
pause
