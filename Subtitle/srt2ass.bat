@echo off
setlocal enabledelayedexpansion

rem 定义样式参数
set "fontname=Microsoft JhengHei"
set "fontsize=24"
set "primary_colour=&HFFFFFF"
set "outline_colour=&H000000"

for %%F in (*.srt) do (
    set "input_srt=%%~nF.srt"
    set "output_ass=%%~nF.ass"
    echo Converting !input_srt! to !output_ass!
    
    rem 使用 ffmpeg 将 SRT 转换为 ASS 并应用样式
    ffmpeg -i "!input_srt!" -vf "ass=style=FontName=!fontname!:FontSize=!fontsize!:PrimaryColour=!primary_colour!:OutlineColour=!outline_colour!" -c:v copy -f ass "!output_ass!" -y
)

echo All SRT files converted to ASS with custom style.
set /p dummy=Press Enter to exit...
