@echo off
set option="%~1"

if %option%=="" goto :blank
if %option%=="clean" goto :clean
if %option%=="build" goto :build
if %option%=="rebuild" goto :rebuild


:blank
echo "Usage env_setup.bat <option>"
echo "<option>"
echo "   build - creates venv, builds protobufs"
echo "   clean - removes all non-version files"
echo "   rebuild - runs clean, then build"
exit /b 0

:rebuild
call :clean
call :build
exit /b 0

:build
if not exist venv python -m venv venv
call venv\Scripts\activate.bat & python -m pip install -r requirements.txt

exit /b 0

:clean
call git clean -ffxd
exit /b 0

