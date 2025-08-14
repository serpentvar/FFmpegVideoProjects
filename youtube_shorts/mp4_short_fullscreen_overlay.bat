@echo off
setlocal EnableExtensions

REM Top area (full frame scaled to width 1080, pinned to top)
set "TOPW=1080"
set "TOPH=608"   REM 16:9 -> 1080 * 9 / 16 ≈ 608

REM Bottom area (center-cropped width 1080, fill the rest)
set "BOTW=1080"
set "BOTH=1312"  REM 1920 - 608

for %%a in (%*) do (
  ffmpeg.exe -hide_banner -y -i "%%~fa" ^
  -filter_complex "[0:v]scale=%TOPW%:-2,setsar=1[top];[0:v]scale=-1:%BOTH%,setsar=1,crop=%BOTW%:%BOTH%:(in_w-%BOTW%)/2:0[bot];[top][bot]vstack=inputs=2[vout]" ^
  -map "[vout]" -map 0:a -c:v h264_nvenc -pix_fmt yuv420p -preset slow -cq 0 -b:v 16000k -c:a copy -shortest "%%~dpna_shorts.mp4"
)

pause
