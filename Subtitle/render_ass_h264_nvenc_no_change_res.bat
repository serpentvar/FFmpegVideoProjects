@echo off
setlocal EnableExtensions EnableDelayedExpansion

:loop
if "%~1"=="" goto :end
if %~z1 EQU 0 (
    echo Skipping empty input file: %~f1
    shift
    goto :loop
)

set "input_video=%~f1"
set "subtitle_file=%~dpn1.ass"
set "output_file=%~dpn1_with_subtitles.mp4"
set "temp_file=%~dpn1_with_subtitles.tmp.mp4"

if not exist "!subtitle_file!" (
    echo Missing subtitle file: "!subtitle_file!"
    shift
    goto :loop
)

if exist "!temp_file!" del /q "!temp_file!"

echo Processing video: "!input_video!"
echo Subtitle file: "!subtitle_file!"

rem Use FFmpeg with NVENC to embed ASS subtitles without resizing the video
ffmpeg -hide_banner -y -i "!input_video!" -vf "ass=!subtitle_file!,unsharp=5:5:1.0:5:5:0.0" -c:v h264_nvenc -cq 23 -c:a aac -b:a 192k "!temp_file!"

if errorlevel 1 (
    echo Failed: "!input_video!"
    if exist "!temp_file!" del /q "!temp_file!"
) else (
    move /y "!temp_file!" "!output_file!" > nul
    echo Created: "!output_file!"
)

shift
goto :loop

:end
echo All files processed.
set /p dummy=Press Enter to exit...
