# srt2ass: Convert SRT to ASS and Modify Styles

## Purpose
This script is used to convert SRT (SubRip) subtitle files to ASS (Advanced SubStation Alpha) format and modify the ASS styles to meet specific requirements.

## Quick Usage (Drag and Drop)
1. Drag and drop SRT files onto `srt2ass.bat`.
2. The script will automatically convert the dragged files to ASS format with modified styles.
3. The converted ASS files will be saved in the same directory as SRT subtitle files.

## Style Modification
In Batch Script 1, you can modify the style by editing the following code segment:

```batch
echo Style: Default,Microsoft JhengHei,20,^&Hffffff,^&Hffffff,^&H0,^&H0,5,0,0,0,100,100,0,0,1,1,0,2,10,10,10,1 >> "!output_ass!"
```

Here, we define a style named "Default" using the "Microsoft JhengHei" font with a font size of 20. You can modify these style properties according to your needs.

# render_ass: Embed ASS Subtitles into Videos

## Purpose
This script is used to embed ASS-formatted subtitles into video files, creating a new video file with embedded subtitles.

## Quick Usage (Drag and Drop)
1. Place the ASS subtitle files and MP4 video files you want to convert in the same directory.
2. Ensure that both the ASS and MP4 video files have the same name (except for the file extensions).
3. Drag and drop MP4 video files onto render_ass_h264_nvenc.bat.
4. The script will use FFmpeg to embed the ASS subtitles into the video and generate a new video file with subtitles.
   
## Notes
- Ensure that FFmpeg is installed and accessible from the command line.
- There are two versions available for your convenience:
   - `render_ass_h264_nvenc.bat`: This version is optimized for systems with an NVIDIA GPU and utilizes hardware acceleration. It is recommended for faster video encoding.
   - `render_ass_h264.bat`: Use this version if you don't have an NVIDIA GPU or prefer software encoding.

You can directly use the version that best suits your system and preferences.



These scripts can help you efficiently process subtitle files and video files, resulting in a final video file with customized styles and subtitles. We hope these instructions are helpful to you!
