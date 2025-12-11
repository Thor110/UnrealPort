SET level=C:\GOG Games\SWAT 4\Content
set output=C:\TEST\SWAT

cd %level%\System

REM Export T3D files using UCC

for /f "delims=|" %%f in ('dir /b "%level%\Maps"') do ucc batchexport "%level%\Maps\%%f" level t3d "%output%\Maps\%%~nf"

REM Rename T3D files from myLevel to MapName, move to parent folder and delete the folder

FOR /D %%d IN ("%output%\Maps\*") DO (REN "%%d\myLevel.t3d" "%%~nxd.t3d" & MOVE "%%d\%%~nxd.t3d" "%output%\Maps" & RD /S /Q "%%d")

pause
exit