for %%a in (*.mp4) do ffmpeg -i "%%a" -c:v libx264 -preset fast -b:v 4500k -maxrate 4500k -bufsize 9000k -framerate 60 -g 120 -keyint_min 60 -sc_threshold 0 -c:a copy -f mp4 -y "%%~na_compressed.mp4"

pause