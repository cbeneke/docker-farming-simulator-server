#!/bin/bash

# Start fake X
export DISPLAY=:0
/usr/bin/Xvfb $DISPLAY -ac &

# Sping up farmining simulator
WINEPREFIX=/app wine64 'C:\Program Files (x86)/Farming Simulator 2019/dedicatedServer.exe'
