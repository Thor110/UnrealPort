@echo off

for /f "delims=|" %%i in (category.txt) do (
  echo move /Y "%%start%%\Sounds\yyy_sound\%%i.wav" "%%start%%\Sounds\yyy_sound\YYY_01\%%i.wav">> written.txt
)

pause
exit

REM remember to update %categoryname% each time
