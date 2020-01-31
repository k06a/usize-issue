#!/usr/bin/env bash

# Exit script as soon as a command fails.
set -e

RUSTFLAGS='-C link-arg=-s' cargo +nightly build --target wasm32-unknown-unknown --release
#rm -rf target
