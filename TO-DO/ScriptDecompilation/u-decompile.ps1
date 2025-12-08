# For reference
# https://github.com/UE-Explorer/UE-Explorer/blob/UE-Explorer/UE%20Explorer/ExportHelpers.cs
# This script is basically implementing the same functions using just the .dll
# Original : https://codeberg.org/Laur1n/unreal-migrations/src/branch/main/u-decompile.ps1 by Laur1n
# Updated by Thor110
param (
    # Path to the input .u file
    [Parameter(mandatory=$true)][string]$input_u_file,
    # Path to the output directory
    [Parameter(mandatory=$true)][string]$out_dir,
    # Path to the Eliot.UELib.dll
    [string]$uelib_dll_path = 'c:/Program Files (x86)/EliotVU/UE Explorer/Eliot.UELib.dll'
)

# --- DEPENDENCY LOADING ---
# Gets the directory of $uelib_dll_path and joins 'System.Runtime.CompilerServices.Unsafe.dll' to it.
$unsafe_dll_path = Join-Path -Path (Split-Path -Parent $uelib_dll_path) -ChildPath "System.Runtime.CompilerServices.Unsafe.dll"

# Load dependency first
Add-Type -Path $unsafe_dll_path 
# Load the main library
Add-Type -Path $uelib_dll_path 

# Get the loaded assembly object directly
$UELibAssembly = [System.AppDomain]::CurrentDomain.GetAssemblies() | Where-Object {$_.GetName().Name -eq "Eliot.UELib"} | Select-Object -First 1

# Load the package by calling the Invoke method directly after retrieving the needed parts.
$unrealPackage = $UELibAssembly.GetType('UELib.UnrealLoader').GetMethod('LoadFullPackage').Invoke($null, @($input_u_file, [System.IO.FileAccess]::Read) )

# Set up output directory
$full_out_dir = Join-Path $out_dir $unrealPackage.PackageName
[System.IO.Directory]::CreateDirectory($full_out_dir) | Out-Null

# Get UClass type for filtering
$uClassType = $UELibAssembly.GetTypes() | Where-Object {$_.Name -eq 'UClass'}

# Export .uc files 
foreach($obj in $unrealPackage.Objects){
    # o => o is UClass && o.ExportTable != null 
    if (!($obj -is $uClassType -and $obj.ExportTable)) { continue }
	
    # Conditional Decompile logic
    $exportData = if ($obj.ScriptText) {
        $obj.ScriptText.Decompile()
    } else {
        $obj.Decompile()
    }
	
    $file_out = $obj.Name.toString() + ".uc"
    $fname = Join-Path $full_out_dir $file_out
    $exportData | Out-File -FilePath $fname
}

# Create UPKG file
$packageFlagType = $UELibAssembly.GetTypes() | Where-Object {$_.Name -eq 'PackageFlag'}

$upkgContent = @(
    "[Flags]",
    ("AllowDownload=" + $unrealPackage.Summary.PackageFlags.HasFlag([Enum]::Parse($packageFlagType, "AllowDownload"))),
    ("ClientOptional=" + $unrealPackage.Summary.PackageFlags.HasFlag([Enum]::Parse($packageFlagType, "ClientOptional"))),
    ("ServerSideOnly=" + $unrealPackage.Summary.PackageFlags.HasFlag([Enum]::Parse($packageFlagType, "ServerSideOnly")))
)

$outputFile = Join-Path $full_out_dir ($unrealPackage.PackageName + ".upkg")
[System.IO.File]::WriteAllLines($outputFile, $upkgContent)