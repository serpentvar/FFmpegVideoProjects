@echo off
for %%a in (%*) do (
  "ffmpeg.exe" -i "%%~fa" -vcodec copy -acodec copy "%%~dpna_result.mp4"
)
pause
