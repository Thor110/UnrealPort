

@echo off
set "search=C:\"

for /f "delims=" %%a in (umodel.cfg) do (
  for %%b in (%%a) do (
    echo %%b|find "%search%"
  )
)

pause

ExportPath = "C:\umodel_win32\UmodelExport\"




exit

:IN
REM backup old config
REN %model%\umodel.cfg old-umodel.cfg
copy %cd%\umodel.cfg %model%\umodel.cfg

:OUT
REM restore old config
del %model%\umodel.cfg
ren %model%\old-umodel.cfg umodel.cfg