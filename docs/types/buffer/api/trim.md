# [←](../readme.md) `io`.`types`.`buffer`.`trim`

> Removes all matching characters fromt both `beg` and `end` of the string.


```zig
pub inline fn trim(_self: *Self, _char: types.char) void
```


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### Parameters

    - `_self` : `*Self`

        > The string structure to be used.

    - `_char` : `types.char`

        > The _(`character`)_ to remove with.


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### Returns : `void`

    > Modifies the string in place.

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### Example

    ```zig
    var str = try string.initWith("  =🌍🌟!  ");
    defer str.deinit();

    str.trim(' '); // 👉 "=🌍🌟!"
    ```

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- ##### Related

  > [`io.types.buffer.trimStart`](./trimStart.md)

  > [`io.types.buffer.trimEnd`](./trimEnd.md)

  > [`io.types.buffer.pop`](./pop.md)

  > [`io.types.buffer.shift`](./shift.md)

  > [`io.types.buffer.remove`](./remove.md)


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

<p align="center" style="color:grey;"><br />Made with ❤️ by <a href="http://github.com/maysara-elshewehy" target="blank">Maysara</a>.</p>