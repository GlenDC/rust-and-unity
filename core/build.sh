#!/bin/bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TARGET_PLATFORM=${1:-"all"}

# CONSTANTS
##########################

UNITY_LIB_DIR="$ROOT/../unity/Assets/Plugins"
ANDROID_LIB_DIR="$UNITY_LIB_DIR/Android"
IOS_LIB_DIR="$UNITY_LIB_DIR/iOS"
OSX_LIB_DIR="$UNITY_LIB_DIR/OSX"

ANDROID_TARGET="arm-linux-androideabi"
IOS_TARGET="x86_64-apple-ios" # normally we would need armv7s or so, but we
                            # build for simulator in this test project
OSX_TARGET="x86_64-apple-darwin"

JAVA_CORE_VERSION="0.1.0"

# ANDROID
##########################

if [ $TARGET_PLATFORM = "all" ] || [ $TARGET_PLATFORM = "android" ] ; then
    mkdir -p $ANDROID_LIB_DIR 2>/dev/null

    ## Build Java-Glue jar
    (cd $ROOT/android && mvn package) || \
        { echo 'building the java-glue failed... exiting' ; exit 1; }
    cp $ROOT/android/target/java-core-$JAVA_CORE_VERSION-fat.jar \
        $ANDROID_LIB_DIR/java-core.jar

    ## Build Android Lib
    cargo build --target=$ANDROID_TARGET --release || \
        { echo 'building the android lib failed... exiting' ; exit 1; }
    cp $ROOT/target/$ANDROID_TARGET/release/libcore.so \
        $ANDROID_LIB_DIR/libcore.so
fi

# iOS
##########################

if [ $TARGET_PLATFORM = "all" ] || [ $TARGET_PLATFORM = "ios" ] ; then
    mkdir -p $IOS_LIB_DIR 2>/dev/null

    IOS_SDK=iphonesimulator

    ## Build iOS-Glue Obj-C Lib
    (xcodebuild -sdk ${IOS_SDK}9.1 -arch x86_64 -project $ROOT/ios/core-ios.xcodeproj) || \
        { echo 'building the ios-glue failed... exiting' ; exit 1; }
    cp $ROOT/ios/build/Release-${IOS_SDK}/libcore-ios.a \
        $IOS_LIB_DIR/libcore-ios.a

    ## Build iOS Lib
    cargo build --target=$IOS_TARGET --release || \
        { echo 'building the iOS lib failed... exiting' ; exit 1; }
    cp $ROOT/target/$IOS_TARGET/release/libcore.a \
        $IOS_LIB_DIR/libcore.a
fi

# OSX
##########################

if [ $TARGET_PLATFORM = "all" ] || [ $TARGET_PLATFORM = "osx" ] ; then
    mkdir -p $OSX_LIB_DIR 2>/dev/null

    ## Build OSX Lib
    cargo build --target=$OSX_TARGET --release || \
        { echo 'building the OSX lib failed... exiting' ; exit 1; }
    cp $ROOT/target/$OSX_TARGET/release/libcore.dylib \
        $OSX_LIB_DIR/libcore.bundle
fi
