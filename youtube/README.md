# YouTube Scripts

Drag MP4 files onto one of these scripts to create YouTube-oriented MP4 outputs.

Current output target:

- Container: MP4 with `+faststart`
- Video: H.264 High Profile, `yuv420p`
- Audio: AAC, 192k, 48 kHz, stereo
- Frame rate: source frame rate is preserved

## Scripts

- `mp4_youtube_h264_nvenc.bat`: NVIDIA NVENC encode for 1080p uploads, targeting about 12M.
- `mp4_youtube_h264_nvenc_4k.bat`: NVIDIA NVENC encode for 4K high-frame-rate uploads, targeting about 60M.
- `mp4_youtube_libx264.bat`: CPU/libx264 encode for 1080p uploads without NVIDIA NVENC.

Output files are written next to the source videos.
