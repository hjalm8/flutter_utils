#!/bin/bash
echo Enter device IP
read varname
adb tcpip 5555
adb connect $varname
echo Connected to $varname:5555
