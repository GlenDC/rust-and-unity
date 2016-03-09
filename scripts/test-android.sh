#!/bin/sh

SCRIPT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT=$SCRIPT_ROOT/..
UNITY=${1:-"/Applications/Unity/Unity.app/Contents/MacOS/Unity"}

PACKAGE=com.exient.test

cd $ROOT/core && ./build.sh android && cd $ROOT && \
    $UNITY -batchMode -quit -nographics -logFile /dev/stdout \
        -executeMethod AutoBuilder.PerformAndroidBuild -projectPath $ROOT/unity \
    && adb install -r $ROOT/unity/RustAndUnity.apk \
    && adb shell am start -n $PACKAGE/com.unity3d.player.UnityPlayerActivity
