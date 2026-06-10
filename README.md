# FFmpegVideoProjects

## Introduction

This repository houses a collection of FFmpeg scripts designed to automate a variety of video editing tasks. Simply drag and drop your video files onto the respective scripts to easily crop, scale, overlay, and apply other effects to your videos.

## Requirements

- FFmpeg: Install the latest version from [ffmpeg.org](https://ffmpeg.org/download.html)
- (Optional) NVIDIA GPU: Some scripts in this repository make use of FFmpeg with NVIDIA hardware acceleration. A compatible NVIDIA GPU is needed for those specific scripts.

## Script Folders

- `youtube`: YouTube-oriented MP4 encodes.
- `youtube_shorts`: 1080x1920 Shorts conversions, including crop, padded, fullscreen overlay, and game HP overlay variants.
- `reels`: Instagram Reels conversions and overlay variants.
- `Subtitle`: SRT and ASS subtitle conversion/rendering helpers.
- `utilities`: General-purpose MP4, audio, remux, and trim helpers.

## Usage

Most scripts are Windows batch files intended for drag-and-drop use:

1. Install FFmpeg and make sure `ffmpeg.exe` is available in `PATH`.
2. Drag one or more media files onto the target `.bat` file.
3. Check the source file folder for the generated output.

Scripts with `h264_nvenc` in the filename require NVIDIA NVENC support. Use the `libx264` variants when running without an NVIDIA GPU.

### 📺 Tutorial Video

[![Watch the tutorial](https://img.youtube.com/vi/hmFrn8JXVTE/0.jpg)](https://www.youtube.com/shorts/hmFrn8JXVTE)

## How to Contribute

If you find any bugs or have feature requests, feel free to open an issue or submit a pull request.
