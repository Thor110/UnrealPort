param(
    [string]$LevelPath
)

# Hardcoded ASCII-safe name
$SourceFile = "Maps\RO-Gorlitz.rom"
# Hardcoded original path with Unicode character
$NewName = "RO-Görlitz.rom"

# Construct the full path using Join-Path
$FullPath = Join-Path -Path $LevelPath -ChildPath $SourceFile

# *** THE CRITICAL FIX: Bypass Test-Path with the .NET System.IO.File Class ***
if ([System.IO.File]::Exists($FullPath)) {
    Write-Host "Renaming '$SourceFile' back to '$NewName'..."
    # Rename back to original Unicode name (RO-Görlitz.rom)
    # The source path is ASCII-safe, but the NewName contains the Unicode character
    Rename-Item -LiteralPath $FullPath -NewName $NewName -ErrorAction Stop
    Write-Host "Rename successful."
} else {
    Write-Host "File '$FullPath' not found. Skipping rename."
}