#!/bin/sh

# Build debug apk and load it on connected device or simulator
# Fails if more than one device is connected
# failing to get found?
react-native bundle --platform android --dev false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res
cd android
./gradlew assembleDebug
cd ..
echo "Uninstalling previous apk..."
adb uninstall com.murphysw.golfmover
echo "Installing new debug apk..."
adb install android/app/build/outputs/apk/app-debug.apk
