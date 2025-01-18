# [←](../bytes.md) `bytes`.`initArrayWith`

> Initializes an array of bytes of a given `size` and `value`,
> terminated with a null byte **if the `size` is greater than the length of `value`**.

```zig
pub fn initArrayWith(comptime size: usize, value: []const u8)initArrayWithError![size]u8
```


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### 🧩 Parameters

    | Parameter | Type             | Description                     |
    | --------- | ---------------- | ------------------------------- |
    | `size`    | `comptime usize` | The size of the array.          |
    | `value`   | `[]const u8`     | The initial value of the array. |

- #### 🚫 Errors
    
    | Error        | Reason                                |
    | ------------ | ------------------------------------- |
    | `ZeroSize`   | The `size` is `0`.                    |
    | `OutOfRange` | The length of `value` exceeds `size`. |

- #### ✨ Returns : `[size]u8`

    > Produces an array of bytes of the specified size, initialized with the given value and terminated with a null byte, _**if the `size` is greater than the length of `value`**_.

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### 🧪 Examples

    ```zig
    const bytes = @import("io").utils.bytes;
    ```

    - ##### 🟢 Success Cases

        ```zig
        _ = try bytes.initArrayWith(1, "A");    // 👉 { 'A' }
        _ = try bytes.initArrayWith(2, "A");    // 👉 { 'A', 0 }
        ```

    - ##### 🔴 Failure Cases
        
        > **_ZeroSize._**

        ```zig
        _ = try bytes.initArrayWith(0, "..");   // 👉 error.ZeroSize
        ```

        > **_OutOfRange._**

        ```zig
        _ = try bytes.initArrayWith(1, "AB");   // 👉 error.OutOfRange
        ```

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- ##### 🔗 Related

  > [`bytes.initArray`](./initArray.md)

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

<p align="center" style="color:grey;"><br />Made with ❤️ by <a href="http://github.com/maysara-elshewehy" target="blank">Maysara</a>.</p>