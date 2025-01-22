# [←](../Buffer.md) `Buffer`.`appendOne`

> Appends a `byte` into the `Buffer` instance.

```zig
pub fn appendOne(self: *Self, byte: u8) appendError!void
```


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### 🧩 Parameters

    | Parameter | Type    | Description            |
    | --------- | ------- | ---------------------- |
    | `self`    | `*Self` | The `Buffer` instance. |
    | `byte`    | `u8`    | The byte to insert.    |

- #### 🚫 Errors
    
    | Error          | Reason                                                     |
    | -------------- | ---------------------------------------------------------- |
    | `InvalidValue` | The `byte` is not valid UTF-8.                             |
    | `OutOfRange`   | The insertion exceeds the bounds of the `Buffer` instance. |

- #### ✨ Returns : `void`

    > Modifies the `Buffer` instance in place.

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### 🧪 Examples

    ```zig
    const Buffer = @import("io").types.Buffer;
    var buffer = try Buffer.initCapacity(7);
    ```

    - ##### 🟢 Success Cases

        ```zig
        _ = try buffer.appendOne('H'); // 👉 "H"
        _ = try buffer.appendOne('e'); // 👉 "He"
        _ = try buffer.appendOne('l'); // 👉 "Hel"
        _ = try buffer.appendOne('l'); // 👉 "Hell"
        _ = try buffer.appendOne('o'); // 👉 "Hello"
        _ = try buffer.appendOne(' '); // 👉 "Hello "
        _ = try buffer.appendOne('!'); // 👉 "Hello !"
        ```

    - ##### 🔴 Failure Cases
        
        > **_InvalidValue._**

        ```zig
        _ = try buffer.appendOne('\x80'); // 👉 error.InvalidValue
        ```
        
        > **_OutOfRange._**

        ```zig
        _ = try Buffer.appendOne('@'); // 👉 error.OutOfRange
        ```

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- ##### 🔗 Related

  > [`Buffer.initCapacity`](./initCapacity.md)

  > [`Buffer.insert`](./insert.md)

  > [`Buffer.insertOne`](./insertOne.md)

  > [`Buffer.insertVisual`](./insertVisual.md)

  > [`Buffer.insertVisualOne`](./insertVisualOne.md)

  > [`Buffer.append`](./append.md)

  > [`Buffer.prepend`](./prepend.md)

  > [`Buffer.prependOne`](./prependOne.md)

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

<p align="center" style="color:grey;"><br />Made with ❤️ by <a href="http://github.com/maysara-elshewehy" target="blank">Maysara</a>.</p>