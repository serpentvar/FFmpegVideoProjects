@echo off
:loop
if "%~1"=="" goto :continue

:: Get the current timestamp
for /f "tokens=2 delims==" %%a in ('wmic os get localdatetime /format:list') do set "datetime=%%a"
set "timestamp=%datetime:~0,8%%datetime:~8,6%"

:: First pass encoding, analyze the video
chcp 65001 > nul && ffmpeg -i "%~1" -c:v h264_nvenc -preset:v slow -b:v 14000k -maxrate 16000k -bufsize 28000k -r 60 -g 120 -keyint_min 60 -sc_threshold 0 -c:a copy -f mp4 -pass 1 -passlogfile "%~dpn1_log" -y NUL

:: Second pass encoding, use the analysis information from the first pass
chcp 65001 > nul && ffmpeg -i "%~1" -c:v h264_nvenc -preset:v slow -b:v 14000k -maxrate 16000k -bufsize 28000k -r 60 -g 120 -keyint_min 60 -sc_threshold 0 -c:a copy -f mp4 -pass 2 -passlogfile "%~dpn1_log" "%~dpn1_compressed_%timestamp%.mp4"

shift
goto :loop

:continue
pause
