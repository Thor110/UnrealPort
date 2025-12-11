SET level=C:\Program Files (x86)\Steam\steamapps\common\ROBetaWinDedicatedServer
set output=C:\TEST\RO

set local=%cd%

cd %level%\System

PowerShell -NoProfile -ExecutionPolicy Bypass -File "%local%\ro_g_in.ps1" "%level%"

ucc batchexport "%level%\Maps\RO-Gorlitz.rom" level t3d "%output%\Maps\RO-Gorlitz" -nohomeless

PowerShell -NoProfile -ExecutionPolicy Bypass -File "%local%\ro_g_out.ps1" "%level%"

pause
exit