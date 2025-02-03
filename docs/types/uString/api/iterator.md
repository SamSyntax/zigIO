# [←](../uString.md) `uString`.`iterator`

> Creates an iterator for traversing the unicode bytes.

```zig
pub fn iterator(self: Self) Unicode.Iterator.Error!Unicode.Iterator
```


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### 🧩 Parameters

    | Parameter | Type   | Description             |
    | --------- | ------ | ----------------------- |
    | `self`    | `Self` | The `uString` instance. |

- #### 🚫 Errors

    | Error                    | Reason                       |
    | ------------------------ | ---------------------------- |
    | `Unicode.Iterator.Error` | if the initialization failed |

- #### ✨ Returns : [`Unicode.Iterator`](../../../utils/Unicode/api/Iterator.md)

    > Returns an iterator for traversing the unicode bytes of the `uString` instance.

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### 🧪 Examples

    ```zig
    const uString = @import("io").types.uString;
    ```

    - ##### 🟢 Success Cases

        ```zig
        var myString = try uString.init(allocator, "..");
        defer myString.deinit(allocator);

        _ = try myString.iterator();
        ```

    - ##### 🔴 Failure Cases

        > if the initilization failed, returns `Unicode.Iterator.Error`.

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- ##### 🔗 Related

  > [`uString.init`](./init.md)

  > [`uString.deinit`](./deinit.md)

  > [`io.utils.Unicode.Iterator`](../../../utils/Unicode/api/Iterator.md)

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

<p align="center" style="color:grey;"><br />Made with ❤️ by <a href="http://github.com/maysara-elshewehy" target="blank">Maysara</a>.</p>