# Reels Scripts

Drag videos onto these scripts to create Instagram Reels-oriented outputs.

Current output target:

- Resolution: `1080x1920`
- Aspect ratio: `9:16`
- Video: H.264, `yuv420p`, 30 FPS
- Audio: AAC, 192k, 48 kHz, stereo
- Container: MP4 with `+faststart`

## Scripts

- `mp4_reels_h264_nvenc.bat`: Crop/scale to 1080x1920 and encode with NVIDIA NVENC.
- `mp4_reels_libx264.bat`: Crop/scale to 1080x1920 and encode with libx264.
- `mp4_reels_fullscreen_overlay.bat`: Stack a top full-width view and bottom cropped view for 1080x1920 Reels.
- `mp4_reels_h264_nvenc_APEX_Legend_HP_overlay.bat`: NVENC variant with an Apex Legends HP overlay crop.
