SET level=C:\Program Files (x86)\Steam\steamapps\common\Star Wars Republic Commando\GameData\System
SET game=C:\SGA
set output=C:\TEST

cd %level%

for /f "delims=|" %%f in ('dir /b "%game%\Maps"') do ucc batchexport "%game%\Maps\%%f" level t3d "%output%\T3DTEST\%%~nf"

pause
exit