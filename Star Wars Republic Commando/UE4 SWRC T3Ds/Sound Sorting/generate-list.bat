@echo off

for /f "delims=|" %%i in (category.txt) do (
  echo move /Y "%%start%%\Sounds\geo_music\%%i.wav" "%%start%%\Sounds\geo_music\Jesse_Music_Test_Map\%%i.wav">> written.txt
)

pause
exit

REM remember to update %categoryname% each time
