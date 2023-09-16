## Introduction
Welcome to `FFmpegVideoProjects`. This repository serves as a showcase for various video editing techniques using FFmpeg. Techniques include, but are not limited to, video cropping, overlaying, scaling, and adding subtitles.

## Features
- Video Cropping
- Video Scaling
- Video Overlaying
- Adding Subtitles

## Prerequisites
- FFmpeg installed ([Installation guide](https://ffmpeg.org/download.html))

## Usage
To use the scripts from this repository, first clone it to your local machine. Navigate to the script directory and run the scripts on your video files.

### Video Cropping and Scaling
```batch
for %%a in (%*) do "ffmpeg.exe" -i %%a -vf "scale=-1:1920,crop=1080:1920" -c:v h264_nvenc -preset slow -cq 0 -b:v 16000k -c:a copy "%%~na_shorts.mp4"
