SET level=C:\GOG Games\Unreal Tournament 2004\System
SET game=C:\SGA - Copy
set output=C:\TEST

cd %level%

for /f "delims=|" %%f in ('dir /b "%game%\Maps"') do ucc batchexport "%game%\Maps\%%f" level t3d "%output%\T3DTEST\%%~nf"

pause
exit

notes

C:\GOG Games\Unreal Tournament 2004\System\UCC.exe
