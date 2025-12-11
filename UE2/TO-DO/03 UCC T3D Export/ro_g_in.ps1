param(
    [string]$LevelPath
)

# Hardcoded original path with Unicode character
$OriginalPath = "Maps\RO-Görlitz.rom"
# Hardcoded ASCII-safe name
$NewName = "RO-Gorlitz.rom"

# Construct the full path using Join-Path
$FullPath = Join-Path -Path $LevelPath -ChildPath $OriginalPath

# *** THE CRITICAL FIX: Bypass Test-Path with the .NET System.IO.File Class ***
if ([System.IO.File]::Exists($FullPath)) {
    Write-Host "Renaming '$OriginalPath' to '$NewName'..."
    # Rename to ASCII-safe name (RO-Gorlitz.rom)
    # We must use -LiteralPath here, as the string contains the Unicode character
    Rename-Item -LiteralPath $FullPath -NewName $NewName -ErrorAction Stop
    Write-Host "Rename successful."
} else {
    Write-Host "File '$FullPath' not found. Skipping rename."
}