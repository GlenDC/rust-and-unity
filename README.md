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

## Note About Rust Cross-Compilation

As long as you're developing within and OSX environment, it is pretty easy to deploy your code onto iOS and OSX. Pretty much the only requirements seem to be that you have the iOS SDK and have the std libs of your rust lib available in your Rust Environment. These can be build yourself if you like to wait for an hour, or you can simply download the from the archives as mentioned above.

For Android however you won't get away with simply downloading the SDK, NDK and setting up the Standalone toolchain. On top of that you also need to add _2 lines_ into your global `$HOME/.cargo/config` file:

    [target.arm-linux-androideabi]
    linker = "arm-linux-androideabi-gcc"

This basically defines that when passing the target to `cargo build` (as can be seen in the `core/build.sh` script of this repository) that it will use `arm-linux-androideabi-gcc` as the linker. As long as you've setup your Android Development Environment correctly, it should be as simple as that.

## References

+ [Build Servo for Android](https://github.com/servo/servo/wiki/Building-for-Android): Requirements for Android;
+ [Cross Compilation of Rust](https://github.com/japaric/rust-cross#cross-compiling-with-cargo): All information about the different targets for cargo;
+ [Rust FAQ - "Can Rust be used for Android/IOS Programming"](https://www.rust-lang.org/faq.html#can-rust-be-used-for-android-ios-programs): That basically gave me the confidence that it's possible. It also links to 2 sources that helped me with some problems I faced. (e.g. missing symboles on iOS);
