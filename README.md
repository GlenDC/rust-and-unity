# Rust and Unity

A repository containing experimental code to test the viability of developing a Rust library that can be used within a Unity (C#) Project.
More specifically for games that would target iOS and Android.

## Requirements

+ Rust
+ Unity3D
+ Multirust (a tool to switch between different rust environments for specific local folders)
  + this way you can download the nightlies for iOS/Android/OSX and use them for this repository;
  + You can find a nightly version with all the std libs @ [Rust Downloads Archives](http://static.rust-lang.org/dist/index.html);
  + I used the 2016/02/29 versions for my experiments and they work on all 3 platforms mentioned;
+ iOS Toolchain (Xcode + SDK)
+ Android ToolChain (SDK/NDK/Standalone Toolchain)

### References

+ [Build Servo for Android](https://github.com/servo/servo/wiki/Building-for-Android): Requirements for Android
+ [Cross Compilation of Rust](https://github.com/japaric/rust-cross#cross-compiling-with-cargo): All information about the different targets for cargo
