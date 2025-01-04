# [←](../String.md) `String`.`free`

> Deallocate the allocated memory and reset the string.

```zig
pub fn free(_self: *String) void
```


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/_dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### Parameters

    - `_self` : `*String`

        > The string structure to free its allocated space.

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/_dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### Returns : `void`

    > Modifies(Reset) the string in place.

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/_dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### Example

    ```zig
    const std = @import("std");
    const String = @import("io").String;
    ```

    ```zig
    var str = String.init();    // 👉 "", size: 0, len: 0

    // Allocate some space.
    try str.alloc(5);           // 👉 "", size: 5, len: 0

    // Deallocate the allocated space.
    defer str.deinit();           // 👉 "", size: 0, len: 0
    ```

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/_dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- ##### Related

  > [`String.alloc`](./alloc.md)


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/_dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

<p align="center" style="color:grey;"><br />Made with ❤️ by <a href="http://github.com/maysara-elshewehy" target="blank">Maysara</a>.</p>