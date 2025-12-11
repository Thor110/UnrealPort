SET level=C:\Program Files (x86)\Steam\steamapps\common\ROBetaWinDedicatedServer
set output=C:\TEST\RO

cd %level%\System

REM Export T3D files using UCC

REM rename RO-Görlitz to RO-Gorlitz

PowerShell -NoProfile -ExecutionPolicy Bypass -File "%local%\ro_g_in.ps1" "%level%"

REM note that Gorlitz fails anyway due to a missing texture package Gorlitz_T

for /f "delims=|" %%f in ('dir /b "%level%\Maps\*.rom"') do ucc batchexport "%level%\Maps\%%f" level t3d "%output%\Maps\%%~nf"

REM rename RO-Gorlitz back to RO-Görlitz

PowerShell -NoProfile -ExecutionPolicy Bypass -File "%local%\ro_g_out.ps1" "%level%"

REM Rename T3D files from myLevel to MapName, move to parent folder and delete the folder

FOR /D %%d IN ("%output%\Maps\*") DO (REN "%%d\myLevel.t3d" "%%~nxd.t3d" & MOVE "%%d\%%~nxd.t3d" "%output%\Maps" & RD /S /Q "%%d")

pause
exit