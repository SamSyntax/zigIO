# [←](../readme.md) `io`.`utils`.`chars`.`removeReal`

> Removes a _(`range` or `real position`)_ from the string.

```zig
pub inline fn removeReal(_from: types.str, _it: anytype) void
```


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### Parameters

    - `_from` : `types.str`

        > The string to remove from.


    - `_it` : `types.range` or `types.unsigned`

        > The _(`range` or `real position`)_ to be remove.


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### Returns : `void`

    > Modifies the string in place, does not return a value.

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### Example

    ```zig
    const chars = @import("io").utils.chars;
    ```

    ```zig
    const src = chars.make(64, "=🌍🌟!");
    ```

    > Remove using a `position`.

    ```zig
    chars.removeReal(res[0..], 0);          // 👉 "🌍🌟!"
    ```

    > Remove using a `range`.

    ```zig
    chars.removeReal(res[0..], .{ 4, 8 });  // 👉 "🌍!"
    chars.removeReal(res[0..], .{ 0, 4 });  // 👉 "!"
    ```

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- ##### Related

  > [`io.utils.chars.remove`](./remove.md)

  > [`io.utils.chars.pop`](./pop.md)

  > [`io.utils.chars.shift`](./shift.md)

  > [`io.utils.chars.zeros`](./zeros.md)


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/docs/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

<p align="center" style="color:grey;"><br />Made with ❤️ by <a href="http://github.com/maysara-elshewehy" target="blank">Maysara</a>.</p>