@echo off
for %%a in (%*) do (
  "ffmpeg.exe" -i "%%~fa" -vn -c:a pcm_s16le -ar 44100 "%%~dpna.wav"
)
pause
