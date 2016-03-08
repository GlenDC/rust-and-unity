#!/bin/sh

SCRIPT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT=$SCRIPT_ROOT/..
UNITY=${1:-"/Applications/Unity/Unity.app/Contents/MacOS/Unity"}


cd $ROOT/core && ./build.sh ios && cd $ROOT && \
    $UNITY -batchMode -quit -nographics -logFile /dev/stdout \
        -executeMethod AutoBuilder.PerformiOSBuild -projectPath $ROOT/unity \
    && open $ROOT/unity/Build-iOS/Unity-iPhone.xcodeproj
