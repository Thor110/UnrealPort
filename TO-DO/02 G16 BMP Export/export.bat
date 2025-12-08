set level=C:\SWRC
set start=C:\TEST

cd C:\SWRC\System

REM export any G16 BMP heightmaps
set list=dm_canyon geo_01briefing geo_03a geo_04a geo_04b geo_04d ras_04b yyy_01b yyy_35a yyy_35b yyy_35c
for %%a in (%list%) do (
	ucc batchexport "%level%\Maps\%%a.ctm" texture bmp "%start%\Maps\%%a\Heightmaps" >nul 2>&1
	REM delete excess data
	REM for %%x in ("%start%\Maps\%%a\Alphamaps\*.png") do del "%start%\Maps\%%a\Heightmaps\%%~nx.bmp"
)

pause