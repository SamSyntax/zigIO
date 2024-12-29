# [←](../readme.md) `io`.`types`.`string`.`initWith`

> Initialize a string using a _(custom `allocator`)_ and a given _(`string` or `char`)_.

```zig
pub fn initWith(_alloc: std.mem.Allocator, _it: anytype) Error!Self
```


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### Parameters

    - `_it` : `types.cstr` or `types.char` or `Self`

        > The initial value to be used for creating the string.

    - `_alloc` : `std.mem.Allocator`

        > The allocator to be used for allocating the string's buffer.

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### Returns : `Self` or `Error`

    > An initialized string structure or error if failed.

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### Example

    ```zig
    const string = @import("io").utils.string;
    ```

    > using array of characters.

    ```zig
    var str = try string.initWith(<yourAllocator>, "Hello 🌍!");     // 👉 "Hello 🌍!"
    defer str.deinit();
    ```

    > using character.

    ```zig
    var str = try string.initWith(<yourAllocator>, '!');             // 👉 "!"
    defer str.deinit();
    ```

    > using another string structure.

    ```zig
    var str1 = try string.initWith(<yourAllocator>, "Hello 🌍!");    // 👉 "Hello 🌍!"
    defer str.deinit();

    var str2 = try string.initWith(<yourAllocator>, str1);           // 👉 "Hello 🌍!"
    defer str.deinit();
    ```

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- ##### Related

  > [`io.types.string.init`](./init.md)

  > [`io.types.string.deinit`](./deinit.md)

  > [`io.types.string.allocate`](./allocate.md)

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

<p align="center" style="color:grey;"><br />Made with ❤️ by <a href="http://github.com/maysara-elshewehy" target="blank">Maysara</a>.</p>