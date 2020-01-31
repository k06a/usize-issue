# Usize issue in libraries referenced by non-path

1. Pull this repo recursively including sumbodules
2. Try to build for `wasm32-unknown-unknown` target using `./build.sh`

    ```
    Finished release [optimized] target(s) in 0.72s
    ```

3. Change dep to path-based in Cargo.toml and try to build again:

    ```
    error: literal out of range for `usize`
      --> rust-ethash/src/miller_rabin.rs:95:14
       |
    95 |             (4_759_123_140, &[2, 7, 61]),
       |              ^^^^^^^^^^^^^
       |
       = note: `#[deny(overflowing_literals)]` on by default

    error: literal out of range for `usize`
      --> rust-ethash/src/miller_rabin.rs:96:14
       |
    96 |             (1_112_004_669_632, &[2, 13, 23, 1662803]),
       |              ^^^^^^^^^^^^^^^^^

    error: literal out of range for `usize`
      --> rust-ethash/src/miller_rabin.rs:97:14
       |
    97 |             (2_152_302_898_746, &[2, 3, 5, 7, 11]),
       |              ^^^^^^^^^^^^^^^^^

    error: literal out of range for `usize`
      --> rust-ethash/src/miller_rabin.rs:98:14
       |
    98 |             (3_474_749_660_382, &[2, 3, 5, 7, 11, 13]),
       |              ^^^^^^^^^^^^^^^^^

    error: literal out of range for `usize`
      --> rust-ethash/src/miller_rabin.rs:99:14
       |
    99 |             (341_550_071_728_320, &[2, 3, 5, 7, 11, 13, 17]),
       |              ^^^^^^^^^^^^^^^^^^^

    error: literal out of range for usize
       --> rust-ethash/src/miller_rabin.rs:100:14
        |
    100 |             (0xFFFF_FFFF_FFFF_FFFF, &[2, 3, 5, 7, 11, 13, 17, 19, 23])
        |              ^^^^^^^^^^^^^^^^^^^^^
        |
        = note: the literal `0xFFFF_FFFF_FFFF_FFFF` (decimal `18446744073709551615`) does not fit into an `usize` and will become `4294967295usize`

    error: aborting due to 6 previous errors

    error: could not compile `ethash`.
    ```
