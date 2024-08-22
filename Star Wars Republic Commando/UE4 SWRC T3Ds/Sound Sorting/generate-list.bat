@echo off

for /f "delims=|" %%i in (category.txt) do (
  echo move /Y "%%start%%\Sounds\geo_sound\%%i.wav" "%%start%%\Sounds\geo_sound\Prologue\%%i.wav">> written.txt
)

pause
exit

REM remember to update %categoryname% each time