#!/bin/bash
if [ -z "$1" ]; then
    echo Enter device IP
    read ip
else 
    ip=$1
fi
echo "Checking for Flutter devices..."
DEVICE=$(flutter devices) # Error when piping flutter devices
NODEV=$(echo $DEVICE | cut -c1-19)
if [[ "$NODEV" == "No devices detected" ]]; then
    echo $NODEV 
    echo "Connect your device over USB first to connect wirelessly"
    exit 1
else
    echo "Device found"
fi
adb tcpip 5555
adb connect $ip