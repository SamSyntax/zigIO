# [←](../uString.md) `uString`.`removeVisualRange`

> Removes a `range` of bytes from the `uString` instance by the `visual position`.

```zig
pub fn removeVisualRange(self: *Self, pos: usize, len: usize) removeVisualError![]const u8
```


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### 🧩 Parameters

    | Parameter | Type    | Description                                     |
    | --------- | ------- | ----------------------------------------------- |
    | `self`    | `*Self` | The `uString` instance.                          |
    | `pos`     | `usize` | The visual position of the character to remove. |
    | `len`     | `usize` | The length to remove.                           |

- #### 🚫 Errors

    | Error             | Reason                                              |
    | ----------------- | --------------------------------------------------- |
    | `InvalidPosition` | The `pos` is invalid.                               |
    | `OutOfRange`      | The `pos` is greater than `uString` instance length. |

- #### ✨ Returns : `[]const u8`

    > Returns the removed slice.

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### 🧪 Examples

    ```zig
    const uString = @import("io").types.uString;
    var string = try uString.init(allocator, "Hello 👨‍🏭!");
    defer string.deinit(allocator);
    ```

    - ##### 🟢 Success Cases

        ```zig
        _ = try string.removeVisualRange(6, 1); // 👉 (👨‍🏭), "Hello !"
        _ = try string.removeVisualRange(0, 1); // 👉 (H), "ello !"
        _ = try string.removeVisualRange(5, 1); // 👉 (!), "ello "
        _ = try string.removeVisualRange(3, 1); // 👉 (o), "ell "
        _ = try string.removeVisualRange(1, 1); // 👉 (l), "el "
        _ = try string.removeVisualRange(0, 1); // 👉 (e), "l "
        _ = try string.removeVisualRange(0, 1); // 👉 (l), " "
        _ = try string.removeVisualRange(0, 1); // 👉 ( ), ""
        ```

    - ##### 🔴 Failure Cases

        > **_OutOfRange._**

        ```zig
        _ = try string.removeVisualRange(1, 1); // 👉 error.OutOfRange
        ```

        > **_InvalidPosition._**

        ```zig
        var string = try uString.init(allocator, "👨‍🏭");
        defer string.deinit(allocator);

        _ = try string.removeVisualRange(2, 1); // 👉 error.InvalidPosition
        ```

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- ##### 🔗 Related

  > [`uString.init`](./init.md)

  > [`uString.remove`](./remove.md)

  > [`uString.removeRange`](./removeRange.md)

  > [`uString.removeVisual`](./removeVisual.md)

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

<p align="center" style="color:grey;"><br />Made with ❤️ by <a href="http://github.com/maysara-elshewehy" target="blank">Maysara</a>.</p>