# [←](../readme.md) `io`.`types`.`buffer`.`startsWith`

> Returns true if the string starts with the given _(`string` or `char`)_.

```zig
pub inline fn startsWith(_self: Self, _with: anytype) bool
```


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### Parameters

    - `_self` : `Self`

        > The string to search inside.


    - `_with` : `types.cstr` or `types.char` or `Self`

        > The value to search for.


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### Returns : `bool`

    > Returns true if string starts with `_with`.

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### Example

    ```zig
    const buffer = @import("io").types.buffer;
    ```

    ```zig
    var str = try string.initWith(alloc, "=🌍🌟!");
    defer str.deinit();

    str.startsWith("");   // 👉 false
    str.startsWith("🌍"); // 👉 false
    str.startsWith('=');  // 👉 true

    ```

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- ##### Related

  > [`io.types.buffer.endsWith`](./endsWith.md)

  > [`io.types.buffer.eql`](./eql.md)

  > [`io.types.buffer.includes`](./includes.md)


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

<p align="center" style="color:grey;"><br />Made with ❤️ by <a href="http://github.com/maysara-elshewehy" target="blank">Maysara</a>.</p>