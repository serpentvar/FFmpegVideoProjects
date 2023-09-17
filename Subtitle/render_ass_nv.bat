@echo off
setlocal enabledelayedexpansion

:loop
if "%~1"=="" goto :end
set "input_video=%~1"

rem 从视频文件中提取文件名（不包括扩展名）
for %%F in ("!input_video!") do (
    set "file_name=%%~nF"
)

set "subtitle_file=!file_name!.ass"
set "output_file=!file_name!_with_subtitles.mp4"

echo Processing video: "!input_video!"
echo Subtitle file: "!subtitle_file!"

rem 使用 FFmpeg 将 ASS 字幕嵌入到视频中
ffmpeg -i "!input_video!" -vf "ass=!subtitle_file!,scale=1080:1920" -c:v h264_nvenc -preset slow -b:v 20000k -c:a copy "!output_file!"

shift
goto :loop

:end
echo All files processed.
set /p dummy=Press Enter to exit...
