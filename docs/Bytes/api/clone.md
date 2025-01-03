# [←](../Bytes.md) `Bytes`.`clone`

> Copies the `input` bytes into a `new` array.

```zig
pub fn clone(comptime _it: Types.cbytes) [_it.len]Types.byte
```


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/_dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### Parameters

    - `comptime _it` : `Types.cbytes`

        > The input to clone.


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/_dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### Returns : `[_it.len]Types.byte`

    > A new array with `_it.len` as the size, initialized with the contents of `_it`.

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/_dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### Example

    ```zig
    const Bytes = @import("io").Bytes;
    ```

    > Empty value

    ```zig
    _ = Bytes.clone("");            // 👉 "", size: 0
    ```

    > Non-Empty value

    ```zig
    _ = Bytes.clone("Hello 🌍!");   // 👉 "Hello 🌍!", size: 11
    ```

    > Constant array of bytes.

    ```zig
    const src = "Hello 🌍!";
    _ = Bytes.clone(src);           // 👉 "Hello 🌍!", size: 11
    ```

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/_dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- ##### Related

  > [`Bytes.copy`](./copy.md)


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/_dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

<p align="center" style="color:grey;"><br />Made with ❤️ by <a href="http://github.com/maysara-elshewehy" target="blank">Maysara</a>.</p>