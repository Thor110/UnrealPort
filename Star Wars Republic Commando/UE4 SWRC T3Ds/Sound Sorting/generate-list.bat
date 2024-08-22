@echo off

for /f "delims=|" %%i in (category.txt) do (
  echo move /Y "%%start%%\Sounds\briefings_voice\%%i.wav" "%%start%%\Sounds\briefings_voice\EPILOGUE\%%i.wav">> written.txt
)

pause
exit

REM remember to update %categoryname% each time
