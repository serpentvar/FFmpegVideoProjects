for %%a in (%*) do "ffmpeg.exe" -i %%a -vf "scale='if(gt(a,9/16),-1,540)':'if(gt(a,9/16),960,-1)',crop=540:960" -movflags faststart -c:v libx264 -crf 0 -c:a copy "%%~na_reels.mp4"
pause
