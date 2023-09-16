@echo off
powershell -ExecutionPolicy Bypass -File "%~dp0process_srt_style.ps1" "%~1"
pause

