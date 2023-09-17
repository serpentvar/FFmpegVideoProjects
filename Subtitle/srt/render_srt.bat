@echo off
setlocal enabledelayedexpansion

:loop
if "%~1"=="" goto :end
set "input_file=%~1"
set "subtitle_file=!input_file:~0,-4!.srt"
set "output_file=!input_file:~0,-4!_with_subtitles.mp4"

"ffmpeg.exe" -i "!input_file!" -i "!subtitle_file!" -c:v libx264 -max_muxing_queue_size 9999 -preset veryslow -crf 18 -c:a copy -c:s mov_text -scodec mov_text "!output_file!"
shift
goto :loop

:end
echo All files processed.
set /p dummy=Press Enter to exit...
