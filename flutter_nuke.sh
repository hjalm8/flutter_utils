#!/bin/bash
echo "Cleaning..."
flutter clean
cd ios
pod cache clean --all
cd ..
echo "Flutter/Cocoapods cleaned"
echo "Reinstalling packages..."
flutter pub get
cd ios
pod update
cd ..
echo "Done nuking"
date > .lastnuke
terminal-notifier -title "Flutter" -message "Nuke is done" -sound Glass
