@echo off

for /f "delims=|" %%i in (category.txt) do (
  echo move /Y "%%start%%\Sounds\yyy_music\%%i.wav" "%%start%%\Sounds\yyy_music\YYY_overlays\%%i.wav">> written.txt
)

pause
exit

REM remember to update %categoryname% each time