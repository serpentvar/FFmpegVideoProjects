@echo off
:: Get the current timestamp
for /f "tokens=2 delims==" %%a in ('wmic os get localdatetime /format:list') do set "datetime=%%a"
set "timestamp=%datetime:~0,8%%datetime:~8,6%"

for %%a in (%*) do (
    "ffmpeg.exe" -i "%%~fa" -c:v libx264 -b:v 14000k -threads 6 -c:a copy "%%~dpna_%timestamp%_14000k.mp4"
)
pause
