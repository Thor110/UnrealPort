@echo off

for /f "delims=|" %%i in (category.txt) do (
  echo move /Y "%%start%%\Sounds\prologue_voice\%%i.wav" "%%start%%\Sounds\prologue_voice\Taun_We\%%i.wav">> written.txt
)

pause
exit

REM remember to update %categoryname% each time
