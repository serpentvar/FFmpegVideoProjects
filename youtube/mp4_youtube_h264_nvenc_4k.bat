@echo off
setlocal

for %%a in (%*) do (
  "ffmpeg.exe" -hide_banner -y -i "%%~fa" ^
  -c:v h264_nvenc -preset p5 -rc vbr -cq 18 -b:v 60M -maxrate 68M -bufsize 120M ^
  -profile:v high -pix_fmt yuv420p ^
  -c:a aac -b:a 192k -ar 48000 -ac 2 ^
  -movflags +faststart ^
  "%%~dpna_youtube_4k.mp4"
)

pause
