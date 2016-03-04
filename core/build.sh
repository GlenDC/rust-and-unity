#!/bin/bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# CONSTANTS
##########################

UNITY_LIB_DIR="$ROOT/../unity/Assets/Plugins"
ANDROID_LIB_DIR="$UNITY_LIB_DIR/Android"
IOS_LIB_DIR="$UNITY_LIB_DIR/iOS"
OSX_LIB_DIR="$UNITY_LIB_DIR/OSX"

ANDROID_TARGET="arm-linux-androideabi"
IOS_TARGET="x86_64-apple-ios"
OSX_TARGET="x86_64-apple-darwin"

JAVA_CORE_VERSION="0.1.0"

# ANDROID
##########################

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

# iOS
##########################

mkdir -p $IOS_LIB_DIR 2>/dev/null

## Build iOS Lib
cargo build --target=$IOS_TARGET --release || \
    { echo 'building the iOS lib failed... exiting' ; exit 1; }
cp $ROOT/target/$IOS_TARGET/release/libcore.a \
    $IOS_LIB_DIR/libcore.a

# OSX
##########################

mkdir -p $OSX_LIB_DIR 2>/dev/null

## Build OSX Lib
cargo build --target=$OSX_TARGET --release || \
    { echo 'building the OSX lib failed... exiting' ; exit 1; }
cp $ROOT/target/$OSX_TARGET/release/libcore.dylib \
    $OSX_LIB_DIR/libcore.bundle
