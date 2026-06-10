@echo off
setlocal

for %%a in (%*) do (
  "ffmpeg.exe" -hide_banner -y -i "%%~fa" ^
  -filter_complex "[0:v]scale=-1:1920,crop=1080:1920[main];[0:v]crop=400:130:50:910,scale=1080:351[overlay];[main][overlay]overlay=W-w:0[vout]" ^
  -map "[vout]" -map 0:a? ^
  -c:v h264_nvenc -preset p5 -rc vbr -cq 17 -b:v 12M -maxrate 14M -bufsize 24M ^
  -r 30 -profile:v high -pix_fmt yuv420p ^
  -c:a aac -b:a 192k -ar 48000 -ac 2 ^
  -movflags +faststart ^
  "%%~dpna_shorts_apex_hp.mp4"
)

pause
