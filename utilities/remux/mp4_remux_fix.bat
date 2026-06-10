@echo off
for %%a in (%*) do (
  "ffmpeg.exe" -i "%%~fa" -acodec copy -vcodec copy "%%~dpna_result.mp4"
)
pause
