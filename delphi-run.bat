REM Busca compilador
call "C:\Program Files (x86)\Embarcadero\Studio\18.0\bin\rsvars.bat"
REM Busca arquivo do projeto
FOR /F "delims=" %%i IN ('dir /b "*.dproj"') DO set projeto=%%i
REM Compila projeto
msbuild %projeto% /p:Config=Debug /t:Build
@echo off
REM Extrai nome do projeto
set nome_projeto=%projeto:.dproj=%
REM Busca executável
FOR /F "delims=" %%i IN ('dir /s /b "%nome_projeto%.exe"') DO set executavel=%%i
REM executa
%executavel%
@echo on
