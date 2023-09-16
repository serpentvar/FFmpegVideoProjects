@echo off
:loop
if "%~1"=="" goto continue

ffmpeg -i "%~1" -c:v h264_nvenc -preset:v fast -b:v 15000k -maxrate 15000k -bufsize 30000k -r 60 -g 120 -keyint_min 60 -sc_threshold 0 -c:a copy -f mp4 -y "%~dpn1_compressed_4k.mp4"
shift
goto loop

:continue
pause
