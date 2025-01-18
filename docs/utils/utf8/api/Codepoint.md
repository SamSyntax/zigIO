# [←](../utf8.md) `utf8`.`Codepoint`

> A struct to represent a single Unicode codepoint with properties.

```zig
pub const Codepoint = struct
```


<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### ✨ Fields

    | Field  | Type                                 | Description                                                          |
    | ------ | ------------------------------------ | -------------------------------------------------------------------- |
    | `mode` | enum of _(`ZWJ` or `Mod` or `None`)_ | The mode of the code point _(`ZeroWidthJointer`/`Modifier`/`None`)_. |
    | `len`  | `usize`                          | The length of the codepoint slice.                                   |

- #### 🧩 Functions

    - #### init
        
        > Initializes a Codepoint using the given input bytes.
        
        > 🚫 Returns `Error.InvalidValue` **_if the `slice` is not a valid utf8._**

        ```zig
        pub fn init(slice: []const u8) Error!Codepoint
        ```

- #### 🚫 Errors
    
    | Error          | Reason                                    |
    | -------------- | ----------------------------------------- |
    | `InvalidValue` | **_if the `slice` is not a valid utf8._** |

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- #### 🧪 Examples

    ```zig
    const utf8 = @import("io").utils.utf8;
    ```

    ```zig
    const txt = "Aأ你🌟☹️👨‍🏭@";
    ```

    | Index | Visual representation | Total length of the current representation |
    | ----- | --------------------- | ------------------------------------------ |
    | 0     | `A`                   | 1                                          |
    | 1     | `أ`                   | 2                                          |
    | 3     | `你`                  | 3                                          |
    | 6     | `🌟`                   | 4                                          |
    | 10    | `☹️`                   | 6 (`3 emojie` + `3 Modifier`)              |
    | 16    | `👨‍🏭`                   | 11 (`4 emojie` + `3 ZWJ` + `4 emojie`)     |
    | 27    | `@`                   | 1                                          |


    - ##### 🟢 Success Cases

        > **A**
        ```zig
        const cp = try utf8.Codepoint.init(txt[0..1]);      // 👉 len: 1, mode: .None
        ```

        > **أ**
        ```zig
        const cp = try utf8.Codepoint.init(txt[1..3]);      // 👉 len: 2, mode: .None
        ```

        > **你**
        ```zig
        const cp = try utf8.Codepoint.init(txt[3..6]);      // 👉 len: 3, mode: .None
        ```

        > **🌟**
        ```zig
        const cp = try utf8.Codepoint.init(txt[6..10]);     // 👉 len: 4, mode: .None
        ```

        > **☹️**
        ```zig
        const cp = try utf8.Codepoint.init(txt[10..13]);    // 👉 len: 3, mode: .None
        const cp = try utf8.Codepoint.init(txt[13..16]);    // 👉 len: 3, mode: .Mod
        ```

        > **👨‍🏭**
        ```zig
        const cp = try utf8.Codepoint.init(txt[16..20]);    // 👉 len: 4, mode: .None
        const cp = try utf8.Codepoint.init(txt[20..23]);    // 👉 len: 3, mode: .ZWJ
        const cp = try utf8.Codepoint.init(txt[23..27]);    // 👉 len: 4, mode: .None
        ```

        > **@**
        ```zig
        const cp = try utf8.Codepoint.init(txt[27..28]);    // 👉 len: 1, mode: .None
        ```


    - ##### 🔴 Failure Cases
        
        > **_InvalidValue._**

        ```zig
        const cp = try utf8.Codepoint.init(txt[6..8]);      // 👉 error.InvalidValue (half of 🌟)
        ```

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

- ##### 🔗 Related

  > [`utf8.Iterator`](./Iterator.md)

  > [`utf8.lengthOfFirst`](./lengthOfFirst.md)

<div align="center">
<img src="https://raw.githubusercontent.com/Super-ZIG/io/refs/heads/main/dist/img/md/line.png" alt="line" style="width:500px;"/>
</div>

<p align="center" style="color:grey;"><br />Made with ❤️ by <a href="http://github.com/maysara-elshewehy" target="blank">Maysara</a>.</p>