@echo off
setlocal enabledelayedexpansion

rem Set output encoding to UTF-8
chcp 65001 > nul

for %%F in (*.srt) do (
    set "input_srt=%%~nF.srt"
    set "output_ass_temp=%%~nF_temp.ass"
    set "output_ass=%%~nF.ass"
    echo Converting !input_srt! to !output_ass_temp!
    
    rem Use FFmpeg to convert SRT to ASS
    ffmpeg -i "!input_srt!" -c:v copy -f ass "!output_ass_temp!" -y
    
    echo Modifying styles in !output_ass_temp! and saving as !output_ass!
    
    rem Create a flag to determine whether to write lines or skip them
    set "write=1"
    
    rem Read the input ASS file line by line and replace [V4+ Styles] section
    (for /f "usebackq delims=" %%A in ("!output_ass_temp!") do (
        set "line=%%A"
        if "!line!"=="[V4+ Styles]" (
            echo [V4+ Styles] >> "!output_ass!"
            echo Format: Name, Fontname, Fontsize, PrimaryColour, SecondaryColour, OutlineColour, BackColour, Bold, Italic, Underline, StrikeOut, ScaleX, ScaleY, Spacing, Angle, BorderStyle, Outline, Shadow, Alignment, MarginL, MarginR, MarginV, Encoding >> "!output_ass!"
            echo Style: Default,Microsoft JhengHei,20,^&Hffffff,^&Hffffff,^&H0,^&H0,5,0,0,0,100,100,0,0,1,1,0,2,10,10,10,1 >> "!output_ass!"
            rem Set the flag to skip lines
            set "write=0"
        ) else (
            if "!write!"=="1" (
                echo !line! >> "!output_ass!"
            ) else (
                rem Check for the end of the [V4+ Styles] section
                if "!line!"=="[Events]" (
                    set "write=1"
                    echo.>> "!output_ass!"
                    echo [Events] >> "!output_ass!"
                )
            )
        )
    ))
    
    rem Delete the temporary ASS file
    del "!output_ass_temp!"
    
    echo Style modification completed for !input_srt!
)

echo SRT to ASS conversion and style modifications completed for all files.
