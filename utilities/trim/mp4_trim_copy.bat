@echo off
setlocal EnableExtensions EnableDelayedExpansion

if "%~1"=="" (
  echo Drag one or more video files onto this script.
  pause
  exit /b
)

:reinput
set /p begin="Start time (hh:mm:ss, example 00:01:20): "
set /p end="End time (hh:mm:ss, example 00:02:11): "
echo Trim from %begin% to %end%
set "INPUT=r"
set /p INPUT="Continue? y=yes, n=cancel, r=re-enter: "

if /I "%INPUT%"=="r" goto reinput
if /I "%INPUT%"=="n" goto done
if /I not "%INPUT%"=="y" goto reinput

for %%a in (%*) do (
  if %%~za EQU 0 (
    echo Skipping empty input file: %%~fa
  ) else (
    set "OUT=%%~dpna_trim_result.mp4"
    set "TMP=%%~dpna_trim_result.tmp.mp4"
    if exist "!TMP!" del /q "!TMP!"

    ffmpeg.exe -y -ss %begin% -i "%%~fa" -to %end% -c copy -avoid_negative_ts make_zero -copyts -f mp4 "!TMP!"

    if errorlevel 1 (
      echo Failed: %%~fa
      if exist "!TMP!" del /q "!TMP!"
    ) else (
      move /y "!TMP!" "!OUT!" > nul
      echo Created: !OUT!
    )
  )
)

:done
pause
