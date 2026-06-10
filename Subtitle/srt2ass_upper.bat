@echo off
setlocal EnableExtensions EnableDelayedExpansion

rem Set output encoding to UTF-8
chcp 65001 > nul

for %%F in (*.srt) do (
    set "input_srt=%%~nF.srt"
    set "output_ass_temp=%%~nF.ffmpeg.tmp.ass"
    set "output_ass_work=%%~nF.tmp.ass"
    set "output_ass=%%~nF.ass"

    if exist "!output_ass_temp!" del /q "!output_ass_temp!"
    if exist "!output_ass_work!" del /q "!output_ass_work!"

    echo Converting !input_srt! to !output_ass_temp!
    ffmpeg -hide_banner -y -i "!input_srt!" -c:v copy -f ass "!output_ass_temp!"

    if errorlevel 1 (
        echo Failed to convert !input_srt!
        if exist "!output_ass_temp!" del /q "!output_ass_temp!"
        if exist "!output_ass_work!" del /q "!output_ass_work!"
    ) else (
        echo Modifying styles in !output_ass_temp! and saving as !output_ass!
        set "write=1"

        (for /f "usebackq delims=" %%A in ("!output_ass_temp!") do (
            set "line=%%A"
            if "!line!"=="[V4+ Styles]" (
                echo [V4+ Styles] >> "!output_ass_work!"
                echo Format: Name, Fontname, Fontsize, PrimaryColour, SecondaryColour, OutlineColour, BackColour, Bold, Italic, Underline, StrikeOut, ScaleX, ScaleY, Spacing, Angle, BorderStyle, Outline, Shadow, Alignment, MarginL, MarginR, MarginV, Encoding >> "!output_ass_work!"
                echo Style: Default,Microsoft JhengHei,20,^&Hffffff,^&Hffffff,^&H0,^&H0,5,0,0,0,100,100,0,0,1,1,0,2,10,10,50,1 >> "!output_ass_work!"
                rem Last three values are MarginL, MarginR, MarginV. MarginV=50 moves subtitles upward.
                set "write=0"
            ) else (
                if "!write!"=="1" (
                    echo !line! >> "!output_ass_work!"
                ) else (
                    if "!line!"=="[Events]" (
                        set "write=1"
                        echo.>> "!output_ass_work!"
                        echo [Events] >> "!output_ass_work!"
                    )
                )
            )
        ))

        if exist "!output_ass_work!" (
            move /y "!output_ass_work!" "!output_ass!" > nul
            echo Style modification completed for !input_srt!
        ) else (
            echo Failed to write !output_ass!
        )

        if exist "!output_ass_temp!" del /q "!output_ass_temp!"
    )
)

echo SRT to ASS conversion and style modifications completed for all files.
