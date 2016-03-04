#!/bin/bash

UNITY_LIB_DIR="../unity/Assets/Plugins"
ANDROID_LIB_DIR="$UNITY_LIB_DIR/Android"
IOS_LIB_DIR="$UNITY_LIB_DIR/iOS"
OSX_LIB_DIR="$UNITY_LIB_DIR/OSX"

ANDROID_TARGET="arm-linux-androideabi"
IOS_TARGET="x86_64-apple-ios"
OSX_TARGET="x86_64-apple-darwin"

# Build Android
cargo build --target=$ANDROID_TARGET --release
mkdir -p $ANDROID_LIB_DIR 2>/dev/null
cp target/$ANDROID_TARGET/release/libcore.so \
    $ANDROID_LIB_DIR/libcore.so

# Build iOS
cargo build --target=$IOS_TARGET --release
mkdir -p $IOS_LIB_DIR 2>/dev/null
cp target/$IOS_TARGET/release/libcore.a \
    $IOS_LIB_DIR/libcore.a

# Build OSX
cargo build --target=$OSX_TARGET --release
mkdir -p $OSX_LIB_DIR 2>/dev/null
cp target/$OSX_TARGET/release/libcore.dylib \
    $OSX_LIB_DIR/libcore.bundle
