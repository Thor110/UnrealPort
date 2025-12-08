set level=C:\SWRC
set start=C:\TEST

set IMAGEMAGICK_DIR=C:\Program Files\ImageMagick-7.1.1-Q16-HDRI

cd C:\SWRC\System

REM export any G16 BMP heightmaps
set list=dm_canyon geo_01briefing geo_03a geo_04a geo_04b geo_04d ras_04b yyy_01b yyy_35a yyy_35b yyy_35c
for %%a in (%list%) do (
	ucc batchexport "%level%\Maps\%%a.ctm" texture bmp "%start%\Maps\%%a\Heightmaps" >nul 2>&1
	REM delete excess data
	for %%x in ("%start%\Maps\%%a\Alphamaps\*.png") do del "%start%\Maps\%%a\Heightmaps\%%~nx.bmp"
	REM convert G16 BMP heightmaps
	for %%f in ("%start%\Maps\%%a\Heightmaps\*.bmp") do (
		REM 1. Convert, Force Grayscale, and Pad to UE4-compatible PNG
		REM    -colorspace Gray: Fixes the blue/green/yellow color issue.
		REM    -depth 16: Retains the required 65536 levels of height data.
		REM    -extent 1009x1009: PADS the image to a valid UE4 Landscape dimension.
		"%IMAGEMAGICK_DIR%\magick.exe" "%%f" -colorspace Gray -depth 16 -type Grayscale -background black -gravity center -extent 1009x1009 "%start%\Maps\%%a\Heightmaps\%%~nf.png"
		REM 2. Delete the original, incorrect-format BMP file
		del "%%f"
	)
)

pause