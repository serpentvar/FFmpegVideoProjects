@echo off
setlocal enabledelayedexpansion
for %%a in (%*) do (
    set "newname=%%~na_shorts.mp4"
    if exist "!newname!" (
        echo File !newname! already exists. Skipping.
    ) else {
        "ffmpeg.exe" -i "%%a" -vf "scale=-1:1920,crop=1080:1920" -max_muxing_queue_size 9999 -c:v libx264 -preset slow -crf 0 -b:v 16000k -c:a copy "!newname!"
    }
)
pause
