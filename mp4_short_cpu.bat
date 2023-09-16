for %%a in (%*) do "ffmpeg.exe" -i %%a -vf "scale=-1:1920,crop=1080:1920" -threads 4 -c:v libx264 -preset slow -crf 0 -b:v 16000k -c:a copy "%%~na_shorts.mp4"
pause
