@echo off
    call :checking_environment
pause
goto :eof

:checking_environment
echo Checking environment

python --version > nul 2>nul

if %errorlevel% equ 0 (
    echo Install package...
    call :install_python_packages
) else (
    echo Python is not installed.
    call :install_python
)
goto :eof

:: Install package
:install_python_packages
echo Installing Python packages...

pip install telegram
pip install numpy
pip install opencv-python
pip install telebot
pip install python-telegram-bot
pip install Pillow
pip install geocoder
pip install geopy
pip install pytz

echo Installation complete.
goto :eof

:: Install python
:install_python
echo Installing Python...
@echo off

set PYTHON_VERSION=2.7.6
set PYTHON_MSI=python-%PYTHON_VERSION%.msi
set PYTHON_EXE=c:\Python27\python.exe
set PYTHON_PATH=c:\Python27;c:\Python27\Scripts
set PYTHON_APPDATA=c:\Python27\AppData

set PYWIN_BUILD=218
set PYWIN_EXE=pywin32-%PYWIN_BUILD%.win32-py2.7.exe

echo,
echo ------------------------------------------------------------------
echo Download Python
echo ------------------------------------------------------------------
echo,

if not exist %PYTHON_EXE% (
if not exist %PYTHON_MSI% (
    curl -L -O http://python.org/ftp/python/%PYTHON_VERSION%/%PYTHON_MSI%
)
)

echo,
echo ------------------------------------------------------------------
echo Install Python
echo ------------------------------------------------------------------
echo,
if not exist %PYTHON_EXE% (
if exist %PYTHON_MSI% (
    msiexec.exe /qb /i %PYTHON_MSI% ALLUSERS=1 ADDLOCAL=ALL
) else (
    echo Python installer package didn't seem to download correctly.
    exit /b 1
)
)

echo,
echo ------------------------------------------------------------------
echo Add Python to PATH
echo ------------------------------------------------------------------
echo,
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /f /v PATH /t REG_EXPAND_SZ /d "%PATH%;%PYTHON_PATH%"

mkdir %PYTHON_APPDATA%
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" /f /v LOCALAPPDATA /t REG_SZ /d "%PYTHON_APPDATA%"
set LOCALAPPDATA=%PYTHON_APPDATA%
set PATH=%PATH%;%PYTHON_PATH%

echo,
echo ------------------------------------------------------------------
echo Python %PYTHON_VERSION%, easy_install, pip, and virtual installed!
echo ------------------------------------------------------------------
echo,
echo Installation complete.
goto :eof