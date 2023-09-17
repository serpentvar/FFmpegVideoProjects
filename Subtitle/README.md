# srt2ass: Convert SRT to ASS and Modify Styles

## Purpose
This script is used to convert SRT (SubRip) subtitle files to ASS (Advanced SubStation Alpha) format and modify the ASS styles to meet specific requirements.

## Usage
1. Place the SRT subtitle files you want to convert in the same directory as Batch Script 1.
2. Run Batch Script 1.
3. The script will automatically scan all SRT files in the directory and convert them to ASS format.
4. The converted ASS files will be saved in the same directory with styles modified as specified.

## Style Modification
In Batch Script 1, you can modify the style by editing the following code segment:

```batch
echo Style: Default,Microsoft JhengHei,20,^&Hffffff,^&Hffffff,^&H0,^&H0,5,0,0,0,100,100,0,0,1,1,0,2,10,10,10,1 >> "!output_ass!"
```

Here, we define a style named "Default" using the "Microsoft JhengHei" font with a font size of 20. You can modify these style properties according to your needs.

# render_ass: Embed ASS Subtitles into Videos

## Purpose
This script is used to embed ASS-formatted subtitles into video files, creating a new video file with embedded subtitles.

## Usage
1. Place the video files you want to process in the same directory as Batch Script 2.
2. Run Batch Script 2, passing the video file you want to process as an argument, for example:

```batch
script2.bat video.mp4
```

3. The script will use FFmpeg to embed the ASS subtitles into the video and generate a new video file with subtitles.

## Notes
- Ensure that FFmpeg is installed and accessible from the command line.
- Modify the FFmpeg command-line options in Batch Script 2 to suit your needs, such as video dimensions, encoding, etc.

These scripts can help you efficiently process subtitle files and video files, resulting in a final video file with customized styles and subtitles. We hope these instructions are helpful to you!