for %%a in (%*) do "ffmpeg.exe" -i %%a -filter_complex "[0:v]scale=-1:1920,crop=1080:1920[main];[0:v]crop=400:130:50:910,scale=1080:351[overlay];[main][overlay]overlay=W-w:0[vout]" -map "[vout]" -map 0:a -c:v libx264 -preset slow -max_muxing_queue_size 9999 -b:v 16000k -c:a copy "%%~na_with_overlay_top_scaled.mp4"
pause

