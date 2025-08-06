@echo off
rem -------------------------------------------------
rem Paradox repair automation using Pdxrbld.exe
rem Usage:  repair_paradox_tables.bat  <path_to_branch_folder>
rem Example: repair_paradox_tables.bat  "D:\Branches\Branch01"
rem -------------------------------------------------

setlocal enabledelayedexpansion

if "%~1"=="" (
    echo Missing folder path
    echo Syntax: %~nx0  PathToParadoxFolder
    exit /b 1
)

rem Path to the tool
set TOOL=%~dp0pdxrbld.exe
if not exist "%TOOL%" (
    echo Pdxrbld.exe not found in %~dp0
    exit /b 1
)

set DBROOT=%~1
set LOGROOT=%DBROOT%\_repair_logs
if not exist "%LOGROOT%" mkdir "%LOGROOT%"

echo ====================================================
echo Starting Paradox verification and repair in AUTO mode
echo Source folder : %DBROOT%
echo Log folder    : %LOGROOT%
echo ====================================================

echo Table,Result,ReturnCode> "%LOGROOT%\summary.csv"

for %%T in ("%DBROOT%\*.db") do (
    echo Processing %%~nxT
    "%TOOL%" "%%~fT" AUTO /LOG:"%LOGROOT%\%%~nT.log"
    set RC=!ERRORLEVEL!
    if !RC! EQU 0 (
        echo %%~nxT,OK,!RC!>> "%LOGROOT%\summary.csv"
    ) else (
        echo %%~nxT,Issue found,!RC!>> "%LOGROOT%\summary.csv"
    )
)

echo ----------------------------------------------------
echo Done. Review %LOGROOT%\summary.csv for a quick status
echo Detailed logs are stored beside each table
echo ----------------------------------------------------
endlocal
