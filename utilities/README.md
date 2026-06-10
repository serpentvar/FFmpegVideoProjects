# Utilities

Small drag-and-drop helpers for common FFmpeg jobs that are not tied to a specific publishing target.

## Folders

- `audio`: Extract or trim audio.
- `mp4`: Re-encode MP4 files with common bitrate presets.
- `remux`: Copy streams into a fresh MP4 container without re-encoding.
- `trim`: Cut audio or video by a start and end timestamp.

## Usage

Drag one or more media files onto a script. Output files are written beside the input files.

Most scripts expect `ffmpeg.exe` to be available in `PATH`. Some MP4 scripts use `h264_nvenc` and require an NVIDIA GPU with FFmpeg NVENC support.
