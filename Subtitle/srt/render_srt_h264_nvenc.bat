@echo off
setlocal enabledelayedexpansion

:loop
if "%~1"=="" goto :end
set "input_file=%~1"
set "subtitle_file=!input_file:~0,-4!.srt"
set "output_file=!input_file:~0,-4!_with_subtitles.mp4"

"ffmpeg.exe" -i "!input_file!" -i "!subtitle_file!" -c:v h264_nvenc -preset medium -b:v 16000k -c:a copy -c:s mov_text "!output_file!"
shift
goto :loop

:end
echo All files processed.
set /p dummy=Press Enter to exit...
