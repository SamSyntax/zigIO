# [←](../uString.md) `uString`.`insertVisual`

> Inserts a `slice` into the `uString` instance at the specified `position` by **visual position**.

```zig
pub fn insertVisual(self: *Self, allocator: Allocator, slice: []const u8, pos: usize) insertVisualError!void
```


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### 🧩 Parameters

    | Parameter   | Type                | Description                       |
    | ----------- | ------------------- | --------------------------------- |
    | `self`      | `*Self`             | The `uString` instance.           |
    | `allocator` | `std.mem.Allocator` | The allocator to use.             |
    | `slice`     | `[]const u8`        | The slice to insert.              |
    | `pos`       | `usize`             | The visual position to insert at. |

- #### 🚫 Errors
    
    | Error             | Reason                                         |
    | ----------------- | ---------------------------------------------- |
    | `AllocatorError` | The allocator returned an error.               |
    | `InvalidValue`    | The `slice` contains invalid UTF-8 characters. |
    | `InvalidPosition` | The position is invalid.                       |
    | `OutOfRange`      | The `pos` is greater than `uString` length.    |

- #### ✨ Returns : `void`

    > Modifies the `uString` instance in place **_if `slice` length is greater than 0_.**

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### 🧪 Examples

    ```zig
    const uString = @import("io").types.uString;
    var string = try uString.initCapacity(allocator, 18);
    defer string.deinit(allocator);
    ```

    - ##### 🟢 Success Cases

        ```zig
        _ = try string.insertVisual(allocator, "H",   0); // 👉 "H"
        _ = try string.insertVisual(allocator, "👨‍🏭",  1); // 👉 "H👨‍🏭"
        _ = try string.insertVisual(allocator, "o",   1); // 👉 "Ho👨‍🏭"
        _ = try string.insertVisual(allocator, "ell", 1); // 👉 "Hello👨‍🏭"
        _ = try string.insertVisual(allocator, " ",   5); // 👉 "Hello 👨‍🏭"
        _ = try string.insertVisual(allocator, "!",   7); // 👉 "Hello 👨‍🏭!"
        ```
    - ##### 🔴 Failure Cases
        
        > **_InvalidValue._**

        ```zig
        _ = try string.insertVisual(allocator, "\x80", 0); // 👉 error.InvalidValue
        ```
        
        > **_OutOfRange._**

        ```zig
        _ = try string.insertVisual(allocator, "@", 99); // 👉 error.OutOfRange
        ```

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- ##### 🔗 Related

  > [`uString.initCapacity`](./initCapacity.md)

  > [`uString.insert`](./insert.md)

  > [`uString.insertOne`](./insertOne.md)

  > [`uString.insertVisualOne`](./insertVisualOne.md)

  > [`uString.append`](./append.md)

  > [`uString.appendOne`](./appendOne.md)

  > [`uString.prepend`](./prepend.md)

  > [`uString.prependOne`](./prependOne.md)

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

<p align="center" style="color:grey;"><br />Made with ❤️ by <a href="http://github.com/maysara-elshewehy" target="blank">Maysara</a>.</p>