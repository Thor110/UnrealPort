@echo off

for /f "delims=|" %%i in (category.txt) do (
  echo move /Y "%%start%%\Sounds\gen_sound\%%i.wav" "%%start%%\Sounds\gen_sound\Weapons\%%i.wav">> written.txt
)

pause
exit

REM remember to update %categoryname% each time