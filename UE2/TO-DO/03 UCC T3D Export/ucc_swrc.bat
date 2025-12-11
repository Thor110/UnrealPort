REM this doesn't work at the moment

echo this script fails at the moment

pause
exit


SET level=C:\Program Files (x86)\Steam\steamapps\common\Star Wars Republic Commando\GameData
set output=C:\TEST\SWRC

cd %level%\System

REM Export T3D files using UCC

for /f "delims=|" %%f in ('dir /b "%level%\Maps"') do ucc batchexport "%level%\Maps\%%f" level t3d "%output%\Maps"

pause
exit