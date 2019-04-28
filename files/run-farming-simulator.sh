#!/bin/bash

# Add wine-staging bin to PATH
export PATH="/opt/wine-staging/bin:$PATH"

# Start fake X
export DISPLAY=:0
/usr/bin/Xvfb $DISPLAY -ac &

# Sping up farmining simulator
WINEPREFIX=/app wine64 'C:\Program Files (x86)/Farming Simulator 2019/dedicatedServer.exe'
