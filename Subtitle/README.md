### `change_srt_style.bat` Usage Instructions

1. Drag and drop the SRT subtitle file that you want to modify onto the `change_srt_style.bat` file.

2. The script will automatically execute and apply the specified style changes to the SRT subtitle file.

3. Once the process is complete, you will see a message indicating that the subtitle style has been applied, and the modified SRT file will be saved in the same directory as the original SRT file with "_styled" appended to the filename.

### `process_srt_style.ps1` Explanation

The `process_srt_style.ps1` script is invoked by `change_srt_style.bat`. It applies the style changes to the SRT subtitles. The style options are defined within the script and include font, size, color, and more. You can modify these style options in the script to match your desired subtitle style.

Please make sure that both the `change_srt_style.bat` and `process_srt_style.ps1` files are located in the same directory as your SRT subtitle file. Additionally, ensure that you have PowerShell installed on your system for the scripts to work correctly.

### `render_srt.bat` Usage Instructions

1. **Drag and Drop**: To render SRT subtitles onto video files, simply drag and drop one or more video files onto the `render_srt.bat` file.

2. **Processing**: The script will automatically process each video file and its corresponding SRT subtitle file located in the same directory. It uses FFmpeg to render the subtitles onto the video with specified settings.

3. **Output**: After processing, the script will create new video files with the subtitles added. These new video files will have the same name as the original video files but with "_with_subtitles" appended to their names. The new video files will be saved in the same directory as the original files.

4. **Performance**: The script uses the h264_nvenc video encoder for efficient video processing. You can modify the video encoding settings within the script to suit your requirements.

5. **Completion**: Once all the files have been processed, you will see a message indicating that all files have been processed.

6. **Exit**: You can exit the script by pressing the Enter key when prompted.

### Description

The `render_srt.bat` script automates the process of adding SRT subtitles to video files using FFmpeg. It is designed for ease of use, allowing you to simply drag and drop video files onto the script to add subtitles. The script uses the h264_nvenc video encoder for efficient video processing.

Please ensure that you have FFmpeg installed and accessible via the command line for the script to work correctly. Also, make sure that your video files and their corresponding SRT subtitle files are in the same directory as the script.
