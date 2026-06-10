@echo off
setlocal EnableExtensions EnableDelayedExpansion

:loop
if "%~1"=="" goto :end
if %~z1 EQU 0 (
    echo Skipping empty input file: %~f1
    shift
    goto :loop
)

set "input_file=%~f1"
set "subtitle_file=%~dpn1.srt"
set "output_file=%~dpn1_with_subtitles.mp4"
set "temp_file=%~dpn1_with_subtitles.tmp.mp4"

if not exist "!subtitle_file!" (
    echo Missing subtitle file: "!subtitle_file!"
    shift
    goto :loop
)

if exist "!temp_file!" del /q "!temp_file!"

"ffmpeg.exe" -hide_banner -y -i "!input_file!" -i "!subtitle_file!" -c:v h264_nvenc -preset medium -b:v 16000k -c:a copy -c:s mov_text "!temp_file!"

if errorlevel 1 (
    echo Failed: "!input_file!"
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
