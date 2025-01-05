# [←](../index.md) `io`.`Bytes`

<p align="center">
  <img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/_dist/img/logo/Bytes/logo.png" alt="Bytes" width="1000" />
</p>

<p align="center">
     <a href="https://github.com/Super-ZIG/io/actions/workflows/main.yml">
        <img src="https://github.com/Super-ZIG/io/actions/workflows/main.yml/badge.svg" alt="CI" />
    </a>
    <img src="https://img.shields.io/github/issues/Super-ZIG/io?style=flat" alt="Github Repo Issues" />
    <img src="https://img.shields.io/github/stars/Super-ZIG/io?style=social" alt="GitHub Repo stars" />
</p>

<p align="center">
  <b>Simplified and perfected.</b><br />
</p>

<br />

<div align="center">
    <img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/_dist/img/md/line.png" alt="line" style="display: block; margin-top:20px;margin-bottom:20px;width:500px;"/>
</div>

> The `Bytes` module combines simplicity with power, offering a seamless experience for byte and bit-level manipulation while ensuring data integrity and maintaining high performance.

> Tailored for handling `UTF-8` encoding as the standard format in our projects, the `Bytes` module excels in applications that require precise control over memory and binary data structures.
>
> Perfect for developers who demand efficiency, consistency, and compatibility in projects leveraging the `UTF-8` standard.


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/_dist/img/md/line.png" alt="line" style="display: block; margin-top:20px;margin-bottom:20px;width:500px;"/>
</div>

- ### Usage

    ```zig
    const Bytes = @import("io").Bytes;
    ```

    > **Create an empty buffer of size 64.**

    ```zig
    var res = try Bytes.init(64);

    _ = res.len;          // 👉 64
    _ = Bytes.count(res); // 👉 0
    ```

    > **Create a buffer of size 64 and copy a bytes into it.**

    ```zig
    var res = try Bytes.initWith(64, "Hello 🌍!");

    _ = res.len;          // 👉 64
    _ = Bytes.count(res); // 👉 11
    ```

    > **Clone a bytes into a new buffer.**

    ```zig
    var res = Bytes.instant("Hello 🌍!");

    _ = res.len;          // 👉 11
    _ = Bytes.count(res); // 👉 11
    ```

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/_dist/img/md/line.png" alt="line" style="display: block; margin-top:20px;margin-bottom:20px;width:500px;"/>
</div>

- ### Functions

   - #### ❱ Starting with bytes.

        | Method                        | Description                                                   |
        | ----------------------------- | ------------------------------------------------------------- |
        | [`isByte`](./api/isByte.md)   | Returns `true` if the type of `input` is a [`byte`](#types).  |
        | [`isBytes`](./api/isBytes.md) | Returns `true` if the type of `input` is a [`bytes`](#types). |
        | [`toByte`](./api/toByte.md)   | Safely casts the `input` value to a [`byte`](#types).         |

   - #### ❱ Make some bytes.

        | Method                          | Description                                                                             |
        | ------------------------------- | --------------------------------------------------------------------------------------- |
        | [`init`](./api/init.md)         | Initializes an array of `size` bytes.                                                   |
        | [`initWith`](./api/initWith.md) | Initializes a valid `utf-8` array of `size` bytes and copies the `input` bytes into it. |
        | [`instant`](./api/instant.md)   | Copies the `input` bytes into a `new` array.                                            |

   - #### ❱ Count the bytes.

        | Method                    | Description                                                                                  |
        | ------------------------- | -------------------------------------------------------------------------------------------- |
        | [`count`](./api/count.md) | Returns the number of bytes in the `input` array, stops at the first 0 byte, or at the size. |


   - #### ❱ ..

        | Method                  | Description                                    |
        | ----------------------- | ---------------------------------------------- |
        | [`copy`](./api/copy.md) | Copies the `input` bytes into `another` array. |

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/_dist/img/md/line.png" alt="line" style="display: block; margin-top:20px;margin-bottom:20px;width:500px;"/>
</div>

- ### Types

    > You can access to types using `Bytes.Types.<typeName>`

    | Type     | Refer To       |
    | -------- | -------------- |
    | `byte`   | `u8`           |
    | `bytes`  | `[]byte`       |
    | `cbytes` | `[]const byte` |
    | `len`    | `usize`        |
    | `range`  | `[2]len`       |

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/_dist/img/md/line.png" alt="line" style="display: block; margin-top:20px;margin-bottom:20px;width:500px;"/>
</div>

<p align="center" style="color:grey;">Made with ❤️ by <a href="http://github.com/maysara-elshewehy" target="blank">Maysara</a>.</p>