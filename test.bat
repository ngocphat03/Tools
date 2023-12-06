@echo off
echo Installing Python packages...


echo Installation complete.

@echo off
echo Start download tool

:: Create a temporary directory with a unique name

:: Download the Python script
curl -o main.py https://ngocphat03.github.io/Tools/ToolTracking/main.py

echo Finish download tool

:: Run the Python script
echo Run tool...
python main.py

echo Finish
pause
