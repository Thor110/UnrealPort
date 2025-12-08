goto :TEST

REM for adding to the full script when ready
:UE-EXPLORER
SET /P explore="Enter your UE-Explorer Directory:"
if exist "%explore%\Eliot.UELib.dll" (
  echo UE-Explorer Found.
) else (
  echo UE-Explorer Not Found!
  goto :UE-EXPLORER
)

SET explore=%explore%\Eliot.UELib.dll

REM run once for System
:TEST
SET level=C:\SWRC\System
SET start=C:\TEST\System
SET explore=C:\Program Files (x86)\EliotVU\UE Explorer\Eliot.UELib.dll

REM run once for Properties or other folders containing .u files which may vary per game
:UE-CONVERT
for /r "%level%" %%x in (*.u) do PowerShell -NoProfile -ExecutionPolicy Bypass -File "%cd%\u-decompile.ps1" "%%x" "%start%" "%explore%"
SET level=C:\SWRC\Properties
SET start=C:\TEST\Properties
for /r "%level%" %%x in (*.u) do PowerShell -NoProfile -ExecutionPolicy Bypass -File "%cd%\u-decompile.ps1" "%%x" "%start%" "%explore%"

:EXIT
exit