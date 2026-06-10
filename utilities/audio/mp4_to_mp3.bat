@echo off
for %%a in (%*) do (
  "ffmpeg.exe" -i "%%~fa" -vn -b:a 128k -c:a libmp3lame -ar 48000 "%%~dpna_result.mp3"
)

pause
