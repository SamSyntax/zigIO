<p align="center"> <br>
  <img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/logo/String/logo.png" alt="String" width="1000" />
</p>

<p align="center">
     <a href="#">
        <img src="https://img.shields.io/badge/under--development-yellow.svg" alt="Under Development" />
    </a>
    <a href="https://github.com/Super-ZIG/io/actions/workflows/main.yml">
        <img src="https://github.com/Super-ZIG/io/actions/workflows/main.yml/badge.svg" alt="CI" />
    </a>
    <img src="https://img.shields.io/github/issues/Super-ZIG/io?style=flat" alt="Github Repo Issues" />
    <img src="https://img.shields.io/github/stars/Super-ZIG/io?style=social" alt="GitHub Repo stars" />
</p>

<p align="center"> <b>Managed dynamic UTF-8 string done right.</b> </p>

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="display: block; margin-top:20px;margin-bottom:20px;width:500px;"/><br>
</div>

- ### Usage

    ```zig
    const String = @import("io").types.String;
    ```

    > **..?**

    ```zig
    ..?  // 👉 ..?
    ```


<div align="center"><br>
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="display: block; margin-top:20px;margin-bottom:20px;width:500px;"/>
</div>

- ### API

  - #### 🧩 Fields

      | Field       | Type                | Description                                          |
      | ----------- | ------------------- | ---------------------------------------------------- |
      | `allocator` | `std.mem.Allocator` | Allocator used for memory management.                |
      | `source`    | `[]u8`              | The mutable UTF-8 encoded bytes.             |
      | `length`    | `usize`             | The number of written bytes to `source`.             |
      | `capacity`  | `usize`             | The number of bytes that can be written to `source`. |

   - #### ✨ Initialization

        | Function                                | Description                                                                 |
        | --------------------------------------- | --------------------------------------------------------------------------- |
        | [`init`](./api/init.md)                 | Initializes a new `String` instance with the given `allocator` and `value`. |
        | [`initAlloc`](./api/initAlloc.md)       | Initializes a new `String` instance with the given `allocator`.             |
        | [`initCapacity`](./api/initCapacity.md) | Initializes a new `String` instance with `allocator` and `size`.                     |
        | [`deinit`](./api/deinit.md)             | Release all allocated memory.                       |

   - #### 🚀 Iterations

        | Function                        | Description                                         |
        | ------------------------------- | --------------------------------------------------- |
        | [`iterator`](./api/iterator.md) | Creates an iterator for traversing the UTF-8 bytes. |

   - #### 🌟 More

        | Function                                    | Description                                               |
        | ------------------------------------------- | --------------------------------------------------------- |
        | [`allocatedSlice`](./api/allocatedSlice.md) | Returns a slice of all the bytes plus the extra capacity. |
        | [`writtenSlice`](./api/writtenSlice.md)     | Returns a slice of only written bytes.                    |

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="display: block; margin-top:20px;margin-bottom:20px;width:500px;"/><br>
</div>

- #### 🔗 Related

  - #### [io.type.uString](../uString/uString.md)
    > Unmanaged dynamic UTF-8 type.

  - #### [io.type.Viewer](../Viewer/Viewer.md)
    > Immutable fixed UTF-8 type.

  - #### [io.type.Buffer](../Buffer/Buffer.md)
    > Mutable fixed UTF-8 type.

<div align="center"><br>
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="display: block; margin-top:20px;margin-bottom:20px;width:500px;"/>
</div>

<p align="center" style="color:grey;"><br>Made with ❤️ by <a href="http://github.com/maysara-elshewehy" target="blank">Maysara</a>.</p>