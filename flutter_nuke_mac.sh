#!/bin/bash
# Check if in parent of Flutter root
test -f app/pubspec.yaml && echo "Moving to flutter dir app/" && cd app
# Check if in subdir of flutter project, i.e. ios/, android/
test -f ../pubspec.yaml && echo "Moving to parent dir ../" && cd ..
# Check if in Flutter repo root
test ! -f ./pubspec.yaml && echo "Not in flutter project" && exit 1
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
