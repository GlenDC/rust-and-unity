#!/bin/bash

cd core && cargo build --release \
  && cp target/release/libcore.dylib ../unity/Assets/Plugins/libcore.bundle
