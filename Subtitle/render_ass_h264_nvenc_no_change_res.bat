@echo off
setlocal enabledelayedexpansion

:loop
if "%~1"=="" goto :end
set "input_video=%~1"

rem Extract the filename (without extension) from the video file
for %%F in ("!input_video!") do (
    set "file_name=%%~nF"
)

set "subtitle_file=!file_name!.ass"
set "output_file=!file_name!_with_subtitles.mp4"

echo Processing video: "!input_video!"
echo Subtitle file: "!subtitle_file!"

rem Use FFmpeg with NVENC to embed ASS subtitles without resizing the video
ffmpeg -i "!input_video!" -vf "ass=!subtitle_file!,unsharp=5:5:1.0:5:5:0.0" -c:v h264_nvenc -cq 23 -c:a aac -b:a 192k "!output_file!"

shift
goto :loop

:end
echo All files processed.
set /p dummy=Press Enter to exit...
