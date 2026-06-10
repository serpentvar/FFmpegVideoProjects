@echo off
setlocal

for %%a in (%*) do (
  "ffmpeg.exe" -hide_banner -y -i "%%~fa" ^
  -vf "scale='if(gt(a,9/16),-1,1080)':'if(gt(a,9/16),1920,-1)',crop=1080:1920,setsar=1" ^
  -c:v libx264 -preset slow -crf 18 -maxrate 12M -bufsize 20M ^
  -r 30 -profile:v high -pix_fmt yuv420p ^
  -c:a aac -b:a 192k -ar 48000 -ac 2 ^
  -movflags +faststart ^
  "%%~dpna_shorts.mp4"
)

pause
