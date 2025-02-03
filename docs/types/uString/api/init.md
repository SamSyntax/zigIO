# [←](../uString.md) `uString`.`init`

> Initializes a new `uString` instance using `allocator` and `value`.

```zig
pub fn init(allocator: Allocator, value: []const u8) initError!Self
```


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### 🧩 Parameters

    | Parameter   | Type                | Description                           |
    | ----------- | ------------------- | ------------------------------------- |
    | `allocator` | `std.mem.Allocator` | The allocator to use.                 |
    | `value`     | `[]const u8`        | The unicode encoded bytes to be viewed. |

- #### 🚫 Errors

    | Error                     | Reason                           |
    | ------------------------- | -------------------------------- |
    | `ZeroSize`                | The `size` is 0.                 |
    | `std.mem.Allocator.Error` | The allocator returned an error. |

- #### ✨ Returns : `Self`

    > Produces a `uString` instance initialized using the given size.

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### 🧪 Examples

    ```zig
    const uString = @import("io").types.uString;
    ```

    - ##### 🟢 Success Cases

        ```zig
        var myString = try uString.init(allocator, "Hello World!");
        defer myString.deinit(allocator);

        _ = myString.length;   // 👉 12
        _ = myString.capacity; // 👉 24
        ```

    - ##### 🔴 Failure Cases

        > **_ZeroSize._**

        ```zig
        _ = uString.init(allocator, ""); // 👉 error.ZeroSize
        ```

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- ##### 🔗 Related

  > [`uString.initCapacity`](./initCapacity.md)

  > [`uString.deinit`](./deinit.md)

  > [`uString.iterator`](./iterator.md)

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

<p align="center" style="color:grey;"><br />Made with ❤️ by <a href="http://github.com/maysara-elshewehy" target="blank">Maysara</a>.</p>