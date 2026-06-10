@echo off
setlocal EnableExtensions

REM Top area (full frame scaled to width 1080, pinned to top)
set "TOPW=1080"
set "TOPH=608"

REM Bottom area (center-cropped width 1080, fill the rest)
set "BOTW=1080"
set "BOTH=1312"

for %%a in (%*) do (
  ffmpeg.exe -hide_banner -y -i "%%~fa" ^
  -filter_complex "[0:v]scale=%TOPW%:-2,setsar=1[top];[0:v]scale=-1:%BOTH%,setsar=1,crop=%BOTW%:%BOTH%:(in_w-%BOTW%)/2:0[bot];[top][bot]vstack=inputs=2,unsharp=5:5:0.4:5:5:0.0[vout]" ^
  -map "[vout]" -map 0:a? ^
  -c:v h264_nvenc -preset p5 -rc vbr -cq 19 -b:v 10M -maxrate 12M -bufsize 20M ^
  -pix_fmt yuv420p ^
  -c:a aac -b:a 192k -ar 48000 -ac 2 ^
  -movflags +faststart -shortest ^
  "%%~dpna_reels.mp4"
)

pause