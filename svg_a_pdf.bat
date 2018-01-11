:11-01-2018
:https://github.com/JoaquinBelloJimenez

@ECHO OFF
TITLE svg a pdf

SET /A "cont=0"

:Leer los archivos de la capeta
FOR %%G IN (*.svg) DO (
	ECHO %%G
	SET /A "cont=cont+1"
	)

IF "%cont%" GEQ "1" (
	GOTO procesar_documentos
	)

:Si no existen archivos, salir
	ECHO Documentos SVG no encontrados
	ECHO Pulsa cualquier tecla para salir. . .
	GOTO salir


:procesar_documentos
ECHO Convirtiendo SVG a PDF
ECHO Espere un momento, por favor...

:Generar la carpeta PDF
if NOT EXIST "pdf\" MKDIR pdf

:Generar todos los archivos pdf de la carpeta
FOR %%G IN (*.svg) DO (
	START inkscape %%G -A pdf/%%~nG.pdf
	)

:Fin del programa
ECHO.
ECHO Documentos convertidos satisfactoriamente :)
ECHO.
ECHO Pulsa cualquier tecla para continuar. . .
:salir
PAUSE >NUL
