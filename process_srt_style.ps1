param (
    [string]$inputSrtPath
)

# Get the path and name of the input file
$inputFilePath = [System.IO.Path]::GetFullPath($inputSrtPath)
$inputDirectory = [System.IO.Path]::GetDirectoryName($inputFilePath)
$inputFileName = [System.IO.Path]::GetFileNameWithoutExtension($inputFilePath)

# Build the path for the output file
$outputSrtPath = Join-Path -Path $inputDirectory -ChildPath "${inputFileName}_styled.srt"

# Read the content of the original SRT file with UTF-8 encoding
$srtContent = Get-Content -Path $inputSrtPath -Encoding utf8

# Initialize the modified SRT content
$modifiedSrtContent = @()
$styleOption = "{\fnMicrosoft JhengHei\fs24\c&HFFFFFF&\3c&H000000&}"

# Process each line of the subtitles
$addStyle = $false
foreach ($line in $srtContent) {
    if ($line -match '^\d{2}:\d{2}:\d{2},\d{3} --> \d{2}:\d{2}:\d{2},\d{3}$') {
        # Line contains the timecode, set the flag to add style after this
        $addStyle = $true
    }

    if ($addStyle) {
        # Add the style after the timecode
        $modifiedSrtContent += $line
        $modifiedSrtContent += $styleOption
        $addStyle = $false
    } else {
        $modifiedSrtContent += $line
    }
}

# Write the modified SRT content to a new file with UTF-8 encoding
$modifiedSrtContent | Set-Content -Path $outputSrtPath -Encoding utf8

Write-Host "Subtitle style applied and saved to $outputSrtPath"
