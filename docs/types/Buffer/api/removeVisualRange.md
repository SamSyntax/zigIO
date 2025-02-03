# [←](../Buffer.md) `Buffer`.`removeVisualRange`

> Removes a `range` of bytes from the `Buffer` instance by the `visual position`.

```zig
pub fn removeVisualRange(self: *Self, pos: usize, len: usize) removeVisualError![]const u8
```


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### 🧩 Parameters

    | Parameter | Type    | Description                                     |
    | --------- | ------- | ----------------------------------------------- |
    | `self`    | `*Self` | The `Buffer` instance.                          |
    | `pos`     | `usize` | The visual position of the character to remove. |
    | `len`     | `usize` | The length to remove.                           |

- #### 🚫 Errors

    | Error             | Reason                                              |
    | ----------------- | --------------------------------------------------- |
    | `InvalidPosition` | The `pos` is invalid.                               |
    | `OutOfRange`      | The `pos` is greater than `Buffer` instance length. |

- #### ✨ Returns : `[]const u8`

    > Returns the removed slice.

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### 🧪 Examples

    ```zig
    const Buffer = @import("io").types.Buffer;
    var buffer = try Buffer.init(18, "Hello 👨‍🏭!");
    ```

    - ##### 🟢 Success Cases

        ```zig
        _ = try buffer.removeVisualRange(6, 1); // 👉 (👨‍🏭), "Hello !"
        _ = try buffer.removeVisualRange(0, 1); // 👉 (H), "ello !"
        _ = try buffer.removeVisualRange(5, 1); // 👉 (!), "ello "
        _ = try buffer.removeVisualRange(3, 1); // 👉 (o), "ell "
        _ = try buffer.removeVisualRange(1, 1); // 👉 (l), "el "
        _ = try buffer.removeVisualRange(0, 1); // 👉 (e), "l "
        _ = try buffer.removeVisualRange(0, 1); // 👉 (l), " "
        _ = try buffer.removeVisualRange(0, 1); // 👉 ( ), ""
        ```

    - ##### 🔴 Failure Cases

        > **_OutOfRange._**

        ```zig
        _ = buffer.removeVisualRange(1, 1); // 👉 error.OutOfRange
        ```

        > **_InvalidPosition._**

        ```zig
        var buffer = try Buffer.init(11, "👨‍🏭");
        _ = buffer.removeVisualRange(2, 1); // 👉 error.InvalidPosition
        ```

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- ##### 🔗 Related

  > [`Buffer.init`](./init.md)

  > [`Buffer.remove`](./remove.md)

  > [`Buffer.removeRange`](./removeRange.md)

  > [`Buffer.removeVisual`](./removeVisual.md)

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

<p align="center" style="color:grey;"><br />Made with ❤️ by <a href="http://github.com/maysara-elshewehy" target="blank">Maysara</a>.</p>