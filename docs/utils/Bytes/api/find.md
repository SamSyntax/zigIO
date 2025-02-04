# [←](../Bytes.md) `Bytes`.`find`

> Finds the `position` of the **first** occurrence of `target`.

```zig
pub fn find(dest: []const u8, target: []const u8) ?usize
```

<div align="center">
<img src="https://raw.githubusercontent.com/maysara-elshewehy/io-bench/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### 🧩 Parameters

    | Parameter | Type         | Description                                    |
    | --------- | ------------ | ---------------------------------------------- |
    | `dest`    | `[]const u8` | The destination slice where the search occurs. |
    | `target`  | `[]const u8` | The value to search for.                       |

- #### ✨ Returns : `?usize`

    > Returns the position of the **first occurrence** of `target` in `dest`. If not found, returns `null`.

<div align="center">
<img src="https://raw.githubusercontent.com/maysara-elshewehy/io-bench/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### 🧪 Examples

    ```zig
    const Bytes = @import("io").utils.Bytes;
    const array = try Bytes.init(18, "Hello 👨‍🏭!");
    ```

    ```zig
    _ = Bytes.find(&array, "H");  // 👉 0
    _ = Bytes.find(&array, "e");  // 👉 1
    _ = Bytes.find(&array, "l");  // 👉 2 (first occurrence)
    _ = Bytes.find(&array, "o");  // 👉 4
    _ = Bytes.find(&array, " ");  // 👉 5
    _ = Bytes.find(&array, "👨‍🏭"); // 👉 6
    _ = Bytes.find(&array, "!");  // 👉 17
    _ = Bytes.find(&array, "@");  // 👉 null
    ```

<div align="center">
<img src="https://raw.githubusercontent.com/maysara-elshewehy/io-bench/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- ##### 🔗 Related

  > [`Bytes.init`](./init.md)

  > [`Bytes.rfind`](./rfind.md)

  > [`Bytes.findVisual`](./findVisual.md)

  > [`Bytes.rfindVisual`](./rfindVisual.md)

<div align="center">
<img src="https://raw.githubusercontent.com/maysara-elshewehy/io-bench/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

<div align="center"><br>
<a href="https://github.com/maysara-elshewehy"> <img src="https://img.shields.io/badge/Made with ❤️ by-Maysara-orange"/> </a>
</div>