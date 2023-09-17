## Change srt style

### `change_srt_style.bat` Usage Instructions

1. Drag and drop the SRT subtitle file that you want to modify onto the `change_srt_style.bat` file.

2. The script will automatically execute and apply the specified style changes to the SRT subtitle file.

3. Once the process is complete, you will see a message indicating that the subtitle style has been applied, and the modified SRT file will be saved in the same directory as the original SRT file with "_styled" appended to the filename.

### `process_srt_style.ps1` Explanation

- `process_srt_style.ps1` is a PowerShell script called by `change_srt_style.bat`. It handles the application of style changes to SRT subtitles.

- **Style Customization**: You can customize the subtitle style within the script by modifying options such as font, size, color, and more to achieve your desired subtitle appearance.

- **File Location**: Ensure that both `change_srt_style.bat` and `process_srt_style.ps1` are located in the same directory as the SRT subtitle file you wish to modify.

- **Prerequisite**: PowerShell must be installed on your system for the script to function correctly.

## `render_srt.bat` Usage Instructions

1. **Drag and Drop**: To add SRT subtitles to video files, simply drag and drop one or more video files onto the `render_srt.bat` script.

2. **Automatic Processing**: The script will automatically process each video file and its corresponding SRT subtitle file located in the same directory.

3. **Output Files**: After processing, the script will generate new video files with the subtitles added. These files will have the same name as the original videos but with "_with_subtitles" appended. All output files will be saved in the same directory as the originals.

4. **Efficient Encoding**: The script utilizes the h264_nvenc video encoder for efficient video processing. You can adjust the video encoding settings within the script to suit your preferences.

5. **Completion Message**: Upon completing the processing of all files, you will receive a message indicating that all files have been successfully processed.

6. **Exit**: To exit the script, press the Enter key when prompted.

### Description

The `render_srt.bat` script streamlines the process of adding SRT subtitles to video files using FFmpeg. Its user-friendly drag-and-drop functionality simplifies the operation.

- **Dependencies**: Ensure that FFmpeg is installed and accessible via the command line for the script to function correctly.

- **File Placement**: Place your video files and their corresponding SRT subtitle files in the same directory as the script for seamless execution.

These scripts provide efficient and convenient methods for modifying SRT subtitle styles and rendering subtitles onto video content. Customize the scripts as needed to meet your specific requirements.
