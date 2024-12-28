// ╔══════════════════════════════════════ INIT ══════════════════════════════════════╗

    const std = @import("std");
    const buffer = @import("./src.zig").buffer;
    const chars = @import("../../utils/chars/src.zig");

    const EQ = std.testing.expect;
    const EQL = std.testing.expectEqual;
    const EQLS = std.testing.expectEqualStrings;

// ╚══════════════════════════════════════════════════════════════════════════════════╝



// ╔══════════════════════════════════════ TEST ══════════════════════════════════════╗

    // ┌─────────────────────────── BASICS ───────────────────────────┐

        test "Empty constant" {
            const _buf = chars.make(64, null); const res = buffer(&_buf);
            try EQL(64, res.size());
            try EQL(0,  res.bytes());
        }

        test "Empty mutable" {
            const _buf = chars.make(64, null); const str = buffer(&_buf);
            try EQL(64, str.size());
            try EQL(0,  str.bytes());
        }

        test "Non-Empty" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            // Append a string.
            try str.append("Hello");
            try EQL(5,  str.bytes());
            try EQLS("Hello", str.m_buff[0..str.m_bytes]);

            // Append a character.
            try str.append(' ');
            try EQL(6,  str.bytes());
            try EQLS("Hello ", str.m_buff[0..str.m_bytes]);

            // Append a string.
            try str.append("World");
            try EQL(11, str.bytes());
            try EQLS("Hello World", str.m_buff[0..str.m_bytes]);

            // Prepend a string.
            try str.prepend("--");
            try EQL(13, str.bytes());
            try EQLS("--Hello World", str.m_buff[0..str.m_bytes]);

            // Prepend a character.
            try str.prepend('!');
            try EQL(14, str.bytes());
            try EQLS("!--Hello World", str.m_buff[0..str.m_bytes]);

            // Insert a string.
            try str.insert("^^", 1);
            try EQL(16, str.bytes());
            try EQLS("!^^--Hello World", str.m_buff[0..str.m_bytes]);

            // Insert a character.
            try str.insert(' ', 1);
            try EQL(17, str.bytes());
            try EQLS("! ^^--Hello World", str.m_buff[0..str.m_bytes]);
        }

        test "Non-Empty mutable (fmt)" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            // Append a string.
            try str.write("{s}", .{"Hello"});
            try EQL(5,  str.bytes());
            try EQLS("Hello", str.m_buff[0..str.m_bytes]);

            // Append a character.
            try str.write("{c}", .{' '});
            try EQL(6,  str.bytes());
            try EQLS("Hello ", str.m_buff[0..str.m_bytes]);

            // Append a string.
            try str.write("{s}", .{"World"});
            try EQL(11, str.bytes());
            try EQLS("Hello World", str.m_buff[0..str.m_bytes]);

            // Prepend a string.
            try str.writeStart("{s}", .{"--"});
            try EQL(13, str.bytes());
            try EQLS("--Hello World", str.m_buff[0..str.m_bytes]);

            // Prepend a character.
            try str.writeStart("{c}", .{'!'});
            try EQL(14, str.bytes());
            try EQLS("!--Hello World", str.m_buff[0..str.m_bytes]);

            // Insert a string.
            try str.writeAt("{s}", .{"^^"}, 1);

            try EQL(16, str.bytes());
            try EQLS("!^^--Hello World", str.m_buff[0..str.m_bytes]);

            // Insert a character.
            try str.writeAt("{c}", .{' '}, 1);
            try EQL(17, str.bytes());
            try EQLS("! ^^--Hello World", str.m_buff[0..str.m_bytes]);

            // Iterator
            var i: chars.types.unsigned = 0;
            var iter = str.iterator();
            while (iter.next()) |ch| {
                if (i == 0) {
                    try EQLS("!", ch);
                }
                i += 1;
            }
        }

    // └──────────────────────────────────────────────────────────────┘


    // ┌─────────────────────────── INSERT ───────────────────────────┐

        test "Append a string" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.append("Hello");
            try str.append(" ");
            try str.append("🌍");
            try str.append("!");
            try EQLS("Hello 🌍!", str.m_buff[0..str.m_bytes]);

            try str.append("🌟");
            try str.append("🌍");
            try str.append("!");
            try EQLS("Hello 🌍!🌟🌍!", str.m_buff[0..str.m_bytes]);
        }

        test "Append a string (using insertReal function)" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.insertReal("Hello", 0);
            try str.insertReal(" ", 5);
            try str.insertReal("🌍", 6);
            try str.insertReal("!", 10);
            try EQLS("Hello 🌍!", str.m_buff[0..str.m_bytes]);

            try str.insertReal("🌟", 11);
            try str.insertReal("🌍", 15);
            try str.insertReal("!", 19);
            try EQLS("Hello 🌍!🌟🌍!", str.m_buff[0..str.m_bytes]);
        }

        test "Append a string (using insert function)" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.insert("Hello", 0);
            try str.insert(" ", 5);
            try str.insert("🌍", 6);
            try str.insert("!", 7);
            try EQLS("Hello 🌍!", str.m_buff[0..str.m_bytes]);
            std.debug.print("={d}, {s} << \n", .{str.bytes(), str.m_buff[0..str.m_bytes]});

            try str.insert("🌟", 8);
            std.debug.print("=={d}, {s} << \n", .{str.bytes(), str.m_buff[0..str.m_bytes]});
            try EQLS("Hello 🌍!🌟", str.m_buff[0..str.m_bytes]);

            try str.insert("🌍", 9);
            std.debug.print("==={d}, {s} << \n", .{str.bytes(), str.m_buff[0..str.m_bytes]});
            try EQLS("Hello 🌍!🌟🌍", str.m_buff[0..str.m_bytes]);

            try str.insert("!", 10);
            try EQLS("Hello 🌍!🌟🌍!", str.m_buff[0..str.m_bytes]);
        }

        test "Append a character" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.append('H');
            try str.append(' ');
            try str.append('W');
            try str.append('!');
            try EQLS("H W!", str.m_buff[0..str.m_bytes]);
        }

        test "Append a character (using insert function)" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.insert('H', 0);
            try str.insert(' ', 1);
            try str.insert('W', 2);
            try str.insert('!', 3);
            try EQLS("H W!", str.m_buff[0..str.m_bytes]);
        }

        test "Prepend a string" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.prepend("Hello");
            try str.prepend(" ");
            try str.prepend("🌍");
            try str.prepend("!");
            try EQLS("!🌍 Hello", str.m_buff[0..str.m_bytes]);

            try str.prepend("🌟");
            try str.prepend("🌍");
            try str.prepend("!");
            try EQLS("!🌍🌟!🌍 Hello", str.m_buff[0..str.m_bytes]);
        }

        test "Prepend a string (using insert function)" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.insert("Hello", 0);
            try str.insert(" ", 0);
            try str.insert("🌍", 0);
            try str.insert("!", 0);
            try EQLS("!🌍 Hello", str.m_buff[0..str.m_bytes]);

            try str.insert("🌟", 0);
            try str.insert("🌍", 0);
            try str.insert("!", 0);
            try EQLS("!🌍🌟!🌍 Hello",str.m_buff[0..str.m_bytes]);
        }

        test "Prepend a character" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.prepend('H');
            try str.prepend(' ');
            try str.prepend('W');
            try str.prepend('!');
            try EQLS("!W H", str.m_buff[0..str.m_bytes]);
        }

        test "Prepend a character (using insert function)" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.insert('H', 0);
            try str.insert(' ', 0);
            try str.insert('W', 0);
            try str.insert('!', 0);
            try EQLS("!W H", str.m_buff[0..str.m_bytes]);
        }

        test "Insert a character into a specifiec position" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.insert('!', 0);
            try str.insert('H', 0);
            try str.insert(' ', 1);
            try str.insert('W', 2);
            try EQLS("H W!", str.m_buff[0..str.m_bytes]);
        }

        test "Insert a string into a specifiec position" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.insert("!", 0);
            try str.insert("🌍", 0);
            try str.insert("Hello", 0);
            try str.insert(" ", 5);

            try EQL(11, str.bytes());
            try EQLS("Hello 🌍!", str.m_buff[0..str.m_bytes]);
        }

        test "Insert a character into a specifiec position (using insertReal function)" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.insertReal('!', 0);
            try str.insertReal('H', 0);
            try str.insertReal(' ', 1);
            try str.insertReal('W', 2);
            try EQLS("H W!", str.m_buff[0..str.m_bytes]);
        }

        test "Insert a string into a specifiec position (using insertReal function)" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.insertReal("!", 0);
            try str.insertReal("🌍", 0);
            try str.insertReal("Hello", 0);
            try str.insertReal(" ", 5);

            try EQL(11, str.bytes());
            try EQLS("Hello 🌍!", str.m_buff[0..str.m_bytes]);
        }

    // └──────────────────────────────────────────────────────────────┘


    // ┌─────────────────────────── REMOVE ───────────────────────────┐

        test "Remove a rang of string (single character)" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.append("Hello");
            try EQLS("Hello", str.m_buff[0..str.m_bytes]);

            try str.remove(.{0, 1});
            try EQLS("ello", str.m_buff[0..str.m_bytes]);

            try str.remove(.{0, 2});
            try EQLS("lo", str.m_buff[0..str.m_bytes]);

            try str.remove(.{1, 2});
            try EQLS("l", str.m_buff[0..str.m_bytes]);

            try str.remove(.{0, 1});
            try EQLS("", str.m_buff[0..str.m_bytes]);
        }

        test "Remove a range of string (multiple characters)" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.append("Hello World");
            try EQLS("Hello World", str.m_buff[0..str.m_bytes]);

            try str.remove(.{0, 6});
            try EQLS("World", str.m_buff[0..str.m_bytes]);

            try str.remove(.{0, 5});
            try EQLS("", str.m_buff[0..str.m_bytes]);
        }

        test "Remove a single character" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.append("Hello");
            try EQLS("Hello", str.m_buff[0..str.m_bytes]);

            try str.remove(0);
            try EQLS("ello", str.m_buff[0..str.m_bytes]);

            try str.remove(2);
            try EQLS("elo", str.m_buff[0..str.m_bytes]);

            try str.remove(2);
            try EQLS("el", str.m_buff[0..str.m_bytes]);

            try str.remove(0);
            try EQLS("l", str.m_buff[0..str.m_bytes]);

            try str.remove(0);
            try EQLS("", str.m_buff[0..str.m_bytes]);
        }

        test "Remove a unicode character (fake position)" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.append("=🌍🌟!,=🌍🌟!");
            try EQLS("=🌍🌟!,=🌍🌟!", str.m_buff[0..str.m_bytes]);

            try str.remove(0);
            try EQLS("🌍🌟!,=🌍🌟!", str.m_buff[0..str.m_bytes]);

            try str.remove(4);
            try EQLS("🌍🌟!,🌍🌟!", str.m_buff[0..str.m_bytes]);

            try str.remove(0);
            try EQLS("🌟!,🌍🌟!", str.m_buff[0..str.m_bytes]);

            try str.remove(0);
            try EQLS("!,🌍🌟!", str.m_buff[0..str.m_bytes]);

            try str.remove(0);
            try EQLS(",🌍🌟!", str.m_buff[0..str.m_bytes]);

            try str.remove(2);
            try EQLS(",🌍!", str.m_buff[0..str.m_bytes]);

            try str.remove(0);
            try EQLS("🌍!", str.m_buff[0..str.m_bytes]);

            try str.remove(2);
            try EQLS("🌍", str.m_buff[0..str.m_bytes]);

            try str.remove(0);
            try EQLS("", str.m_buff[0..str.m_bytes]);
        }

        test "Remove a unicode character (fake range)" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.append("=🌍🌟!,=🌍🌟!");
            try EQLS("=🌍🌟!,=🌍🌟!", str.m_buff[0..str.m_bytes]);

            try str.remove(.{0, 1});
            try EQLS("🌍🌟!,=🌍🌟!", str.m_buff[0..str.m_bytes]);

            try str.remove(.{4, 5});
            try EQLS("🌍🌟!,🌍🌟!", str.m_buff[0..str.m_bytes]);

            try str.remove(0);
            try EQLS("🌟!,🌍🌟!", str.m_buff[0..str.m_bytes]);

            try str.remove(0);
            try EQLS("!,🌍🌟!", str.m_buff[0..str.m_bytes]);

            try str.remove(0);
            try EQLS(",🌍🌟!", str.m_buff[0..str.m_bytes]);

            try str.remove(2);
            try EQLS(",🌍!", str.m_buff[0..str.m_bytes]);

            try str.remove(0);
            try EQLS("🌍!", str.m_buff[0..str.m_bytes]);

            try str.remove(1);
            try EQLS("🌍", str.m_buff[0..str.m_bytes]);

            try str.remove(0);
            try EQLS("", str.m_buff[0..str.m_bytes]);
        }

        test "Remove a unicode character (real position)" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.append("=🌍🌟!,=🌍🌟!");
            try EQLS("=🌍🌟!,=🌍🌟!", str.m_buff[0..str.m_bytes]);

            str.removeReal(0);
            try EQLS("🌍🌟!,=🌍🌟!", str.m_buff[0..str.m_bytes]);

            str.removeReal(10);
            try EQLS("🌍🌟!,🌍🌟!", str.m_buff[0..str.m_bytes]);

            str.removeReal(0);
            try EQLS("🌟!,🌍🌟!", str.m_buff[0..str.m_bytes]);

            str.removeReal(0);
            try EQLS("!,🌍🌟!", str.m_buff[0..str.m_bytes]);

            str.removeReal(0);
            try EQLS(",🌍🌟!", str.m_buff[0..str.m_bytes]);

            str.removeReal(5);
            try EQLS(",🌍!", str.m_buff[0..str.m_bytes]);

            str.removeReal(0);
            try EQLS("🌍!", str.m_buff[0..str.m_bytes]);

            str.removeReal(4);
            try EQLS("🌍", str.m_buff[0..str.m_bytes]);

            str.removeReal(0);
            try EQLS("", str.m_buff[0..str.m_bytes]);
        }

        test "Remove a unicode character (real range)" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.append("=🌍🌟!,=🌍🌟!");
            try EQLS("=🌍🌟!,=🌍🌟!", str.m_buff[0..str.m_bytes]);

            str.removeReal(.{0, 1});
            try EQLS("🌍🌟!,=🌍🌟!", str.m_buff[0..str.m_bytes]);

            str.removeReal(.{10, 11});
            try EQLS("🌍🌟!,🌍🌟!", str.m_buff[0..str.m_bytes]);

            str.removeReal(.{0, 4});
            try EQLS("🌟!,🌍🌟!", str.m_buff[0..str.m_bytes]);

            str.removeReal(.{0, 4});
            try EQLS("!,🌍🌟!", str.m_buff[0..str.m_bytes]);

            str.removeReal(.{0, 1});
            try EQLS(",🌍🌟!", str.m_buff[0..str.m_bytes]);

            str.removeReal(.{5, 9});
            try EQLS(",🌍!", str.m_buff[0..str.m_bytes]);

            str.removeReal(.{0, 1});
            try EQLS("🌍!", str.m_buff[0..str.m_bytes]);

            str.removeReal(.{4, 5});
            try EQLS("🌍", str.m_buff[0..str.m_bytes]);

            str.removeReal(.{0, 4});
            try EQLS("", str.m_buff[0..str.m_bytes]);
        }

        test "Remove N characters from the end of the string (using pop function)" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.append("Hello World!");
            try EQLS("Hello World!", str.m_buff[0..str.m_bytes]);
            try EQL(64, str.size());
            try EQL(12, str.bytes());

            str.pop(1);
            try EQLS("Hello World", str.m_buff[0..str.m_bytes]);
            try EQL(64, str.size());
            try EQL(11, str.bytes());

            str.pop(6);
            try EQLS("Hello", str.m_buff[0..str.m_bytes]);
            try EQL(64, str.size());
            try EQL(5, str.bytes());

            str.pop(5);
            try EQLS("", str.m_buff[0..str.m_bytes]);
            try EQL(64, str.size());
            try EQL(0, str.bytes());
        }

        test "Remove N characters from the beginning of the string (using shift function)" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            try str.append("Hello World!");
            try EQLS("Hello World!", str.m_buff[0..str.m_bytes]);
            try EQL(64, str.size());
            try EQL(12, str.bytes());

            str.shift(1);
            try EQLS("ello World!", str.m_buff[0..str.m_bytes]);
            try EQL(64, str.size());
            try EQL(11, str.bytes());

            str.shift(5);
            try EQLS("World!", str.m_buff[0..str.m_bytes]);
            try EQL(64, str.size());
            try EQL(6, str.bytes());

            str.shift(6);
            try EQLS("", str.m_buff[0..str.m_bytes]);
            try EQL(64, str.size());
            try EQL(0, str.bytes());
        }

    // └──────────────────────────────────────────────────────────────┘


    // ┌──────────────────────────── TRIM ────────────────────────────┐

        test "Trim start of string" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);
            str.trimStart(' ');

            try str.append("   !🌍🌟=   ");
            str.trimStart(' ');
            try EQLS("!🌍🌟=   ", str.m_buff[0..str.m_bytes]);
        }

        test "Trim end of string" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);
            str.trimEnd(' ');

            try str.append("   !🌍🌟=   ");
            str.trimEnd(' ');
            try EQLS("   !🌍🌟=", str.m_buff[0..str.m_bytes]);
        }

        test "Trim start and end of string" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);
            str.trimEnd(' ');

            try str.append("   !🌍🌟=   ");
            str.trim(' ');
            try EQLS("!🌍🌟=", str.m_buff[0..str.m_bytes]);
        }

    // └──────────────────────────────────────────────────────────────┘


    // ┌─────────────────────────── WRITER ───────────────────────────┐

        test "Make a writer for a string and write some string using print function (fmt)" {
            var _buf = chars.make(64, null); var str = buffer(&_buf);

            var writer = str.writer();
            try writer.print("Hello {s}!", .{"🌍"});
            try EQL(11, str.bytes());
            try EQLS("Hello 🌍!", str.m_buff[0..str.m_bytes]);
        }

    // └──────────────────────────────────────────────────────────────┘


    // ┌────────────────────────── ITERATOR ──────────────────────────┐

        test "Iterate over a string" {
            var _buf = chars.make(64, null); var str = buffer(&_buf); try str.append("Hello 🌍");

            var i: chars.types.unsigned = 0;
            var iter = str.iterator();
            while (iter.next()) |c| {
                if (5 == 0) try EQLS("🌍", c);
                i += 1;
            }
        }

    // └──────────────────────────────────────────────────────────────┘


//     // ┌──────────────────────────── DOCS ────────────────────────────┐

//         test "readme example" {
//             var str = buffer.init();            // Creates a new string structure.
//             defer str.deinit();                 // Cleans up the allocated memory (if allocated) when the scope ends.

//             try str.append("Hello 🌍!");        // 👉 "Hello 🌍!"
//             try EQL(8, str.ubytes());           // 👉 8     (Unicode characters are counted as regular characters).
//             try EQL(11, str.bytes());           // 👉 11    Regular characters = 1, Unicode characters = 4.
//             try EQL(24, str.size());            // 👉 24    Total size of the allocated memory.
//             try EQLS("Hello 🌍!", str.m_buff[0..str.m_bytes]);   // 👉 "Hello 🌍!"
//         }

//         test "docs: allocate" {
//             var str = buffer.init(); defer str.deinit();

//             try EQL(0, str.size());     // 👉 0
//             try str.allocate(10);
//             try EQL(10, str.size());    // 👉 10
//         }

//         test "docs: init" {
//             var str = buffer.init(); defer str.deinit();
//             try EQL(0, str.size());     // 👉 0
//             try EQL(0, str.bytes());    // 👉 0
//             try EQLS("", str.m_buff[0..str.m_bytes]);    // 👉 ""
//         }

//         test "docs: initWith" {
//             var str = try buffer.initWith("Hello 🌍!"); defer str.deinit();
//             try EQL(24, str.size());     // 👉 24
//             try EQL(11, str.bytes());    // 👉 11
//             try EQL(8, str.ubytes());    // 👉 8
//             try EQLS("Hello 🌍!", str.m_buff[0..str.m_bytes]);    // 👉 "Hello 🌍!"
//         }

//         test "docs: bytes" {
//             var str = buffer.init(); defer str.deinit();

//             try EQL(0, str.bytes());    // 👉 0
//             try str.append("Hello 🌍!");
//             try EQL(11, str.bytes());   // 👉 11
//         }

//         test "docs: ubytes" {
//             var str = buffer.init(); defer str.deinit();

//             try EQL(0, str.ubytes());   // 👉 0
//             try str.append("Hello 🌍!");
//             try EQL(8, str.ubytes());   // 👉 8
//         }

//         test "docs: src" {
//             var str = buffer.init(); defer str.deinit();

//             try EQLS("", str.m_buff[0..str.m_bytes]);            // 👉 ""
//             try str.append("Hello 🌍!");
//             try EQLS("Hello 🌍!", str.m_buff[0..str.m_bytes]);   // 👉 "Hello 🌍!"
//         }

//         test "docs: append" {
//             var str = buffer.init(); defer str.deinit();

//             try str.append('=');    // 👉 "="
//             try EQLS("=", str.m_buff[0..str.m_bytes]);

//             try str.append("🌍");   // 👉 "=🌍"
//             try EQLS("=🌍", str.m_buff[0..str.m_bytes]);

//             try str.append("🌟");   // 👉 "=🌍🌟"
//             try EQLS("=🌍🌟", str.m_buff[0..str.m_bytes]);

//             var other = try buffer.initWith("!!");
//             defer other.deinit();

//             try str.append(other);  // 👉 "=🌍🌟!!"
//             try EQLS("=🌍🌟!!", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: prepend" {
//             var str = buffer.init(); defer str.deinit();

//             try str.prepend('=');
//             try EQLS("=", str.m_buff[0..str.m_bytes]);   // 👉 "="

//             try str.prepend("🌍");      // 👉 "🌍="
//             try EQLS("🌍=", str.m_buff[0..str.m_bytes]);

//             try str.prepend("🌟");      // 👉 "🌟🌍="
//             try EQLS("🌟🌍=", str.m_buff[0..str.m_bytes]);

//             var other = try buffer.initWith("!!");
//             defer other.deinit();

//             try str.prepend(other);     // 👉 "!!🌟🌍="
//             try EQLS("!!🌟🌍=", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: insert" {
//             var str = buffer.init(); defer str.deinit();

//             try str.insert('=', 0);      // 👉 "="
//             try EQLS("=", str.m_buff[0..str.m_bytes]);

//             try str.insert("🌍", 1);    // 👉 "=🌍"
//             try EQLS("=🌍", str.m_buff[0..str.m_bytes]);

//             try str.insert("🌟", 1);    // 👉 "=🌟🌍"
//             try EQLS("=🌟🌍", str.m_buff[0..str.m_bytes]);

//             var other = try buffer.initWith("!!");
//             defer other.deinit();

//             try str.insert(other, 3);   // 👉 "=🌟🌍!!"
//             try EQLS("=🌟🌍!!", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: insertReal" {
//             var str = buffer.init(); defer str.deinit();

//             try str.insertReal('=', 0);      // 👉 "="
//             try EQLS("=", str.m_buff[0..str.m_bytes]);

//             try str.insertReal("🌍", 1);    // 👉 "=🌍"
//             try EQLS("=🌍", str.m_buff[0..str.m_bytes]);

//             try str.insertReal("🌟", 1);    // 👉 "=🌟🌍"
//             try EQLS("=🌟🌍", str.m_buff[0..str.m_bytes]);

//             var other = try buffer.initWith("!!");
//             defer other.deinit();

//             try str.insertReal(other, 9);   // 👉 "=🌟🌍!!"
//             try EQLS("=🌟🌍!!", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: write" {
//             var str = buffer.init(); defer str.deinit();

//             try str.write( "{c}", .{ '=' } );     // 👉 "="
//             try EQLS("=", str.m_buff[0..str.m_bytes]);
//             try str.write( "{s}", .{ "🌍" } );    // 👉 "=🌍"
//             try EQLS("=🌍", str.m_buff[0..str.m_bytes]);
//             try str.write( "{s}", .{ "🌟" } );    // 👉 "=🌍🌟"
//             try EQLS("=🌍🌟", str.m_buff[0..str.m_bytes]);
//             try str.write( "{d}", .{ 99 } );      // 👉 "=🌍🌟99"
//             try EQLS("=🌍🌟99", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: writeStart" {
//             var str = buffer.init(); defer str.deinit();

//             try str.writeStart( "{c}", .{ '=' } );     // 👉 "="
//             try EQLS("=", str.m_buff[0..str.m_bytes]);
//             try str.writeStart( "{s}", .{ "🌍" } );    // 👉 "🌍="
//             try EQLS("🌍=", str.m_buff[0..str.m_bytes]);
//             try str.writeStart( "{s}", .{ "🌟" } );    // 👉 "🌟🌍="
//             try EQLS("🌟🌍=", str.m_buff[0..str.m_bytes]);
//             try str.writeStart( "{d}", .{ 99 } );      // 👉 "99🌟🌍="
//             try EQLS("99🌟🌍=", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: writeAt" {
//             var str = buffer.init(); defer str.deinit();

//             try str.writeAt( "{c}", .{ '='  }, 0 );     // 👉 "="
//             try EQLS("=", str.m_buff[0..str.m_bytes]);
//             try str.writeAt( "{s}", .{ "🌍" }, 0 );     // 👉 "🌍="
//             try EQLS("🌍=", str.m_buff[0..str.m_bytes]);
//             try str.writeAt( "{s}", .{ "🌟" }, 1 );     // 👉 "🌍🌟="
//             try EQLS("🌍🌟=", str.m_buff[0..str.m_bytes]);
//             try str.writeAt( "{d}", .{ 99 }  , 0 );     // 👉 "99🌍🌟="
//             try EQLS("99🌍🌟=", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: writeAtReal" {
//             var str = buffer.init(); defer str.deinit();

//             try str.writeAtReal( "{c}", .{ '='  }, 0 );     // 👉 "="
//             try EQLS("=", str.m_buff[0..str.m_bytes]);
//             try str.writeAtReal( "{s}", .{ "🌍" }, 0 );     // 👉 "🌍="
//             try EQLS("🌍=", str.m_buff[0..str.m_bytes]);
//             try str.writeAtReal( "{s}", .{ "🌟" }, 4 );     // 👉 "🌍🌟="
//             try EQLS("🌍🌟=", str.m_buff[0..str.m_bytes]);
//             try str.writeAtReal( "{d}", .{ 99 }  , 0 );     // 👉 "99🌍🌟="
//             try EQLS("99🌍🌟=", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: remove" {
//             var str = try buffer.initWith("=🌍🌟!"); defer str.deinit();

//             try str.remove(0);              // 👉 "🌍🌟!"
//             try EQLS("🌍🌟!", str.m_buff[0..str.m_bytes]);
//             try str.remove(.{ 1, 2 });      // 👉 "🌍!"
//             try EQLS("🌍!", str.m_buff[0..str.m_bytes]);
//             try str.remove(.{ 0, 1 });      // 👉 "!"
//             try EQLS("!", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: removeReal" {
//             var str = try buffer.initWith("=🌍🌟!"); defer str.deinit();

//             str.removeReal(0);          // 👉 "🌍🌟!"
//             try EQLS("🌍🌟!", str.m_buff[0..str.m_bytes]);
//             str.removeReal(.{ 4, 8 });  // 👉 "🌍!"
//             try EQLS("🌍!", str.m_buff[0..str.m_bytes]);
//             str.removeReal(.{ 0, 4 });  // 👉 "!"
//             try EQLS("!", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: pop" {
//             var str = try buffer.initWith("=🌍🌟!"); defer str.deinit();

//             str.pop(1); // 👉 "=🌍🌟"
//             try EQLS("=🌍🌟", str.m_buff[0..str.m_bytes]);

//             str.pop(1); // 👉 "=🌍"
//             try EQLS("=🌍", str.m_buff[0..str.m_bytes]);

//             str.pop(1); // 👉 "="
//             try EQLS("=", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: shift" {
//             var str = try buffer.initWith("=🌍🌟!"); defer str.deinit();

//             str.shift(1); // 👉 "🌍🌟!"
//             try EQLS("🌍🌟!", str.m_buff[0..str.m_bytes]);
//             str.shift(1);  // 👉 "🌟!"
//             try EQLS("🌟!"  , str.m_buff[0..str.m_bytes]);
//             str.shift(1);  // 👉 "!"
//             try EQLS("!"    , str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: trimStart" {
//             var str = try buffer.initWith("  =🌍🌟!"); defer str.deinit();
//             str.trimStart(' '); // 👉 "=🌍🌟!"
//             try EQLS("=🌍🌟!", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: trimEnd" {
//             var str = try buffer.initWith("=🌍🌟!  "); defer str.deinit();
//             str.trimEnd(' '); // 👉 "=🌍🌟!"
//             try EQLS("=🌍🌟!", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: trim" {
//             var str = try buffer.initWith("  =🌍🌟!  "); defer str.deinit();
//             str.trim(' '); // 👉 "=🌍🌟!"
//             try EQLS("=🌍🌟!", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: find" {
//             var str = try buffer.initWith("==🌍🌟!!"); defer str.deinit();
//             try EQL(0, str.find('='));    // 👉 0   ("=")
//             try EQL(2, str.find("🌍"));   // 👉 2   (beg of "🌍")
//             try EQL(6, str.find("🌟"));   // 👉 6   (beg of "🌟")
//             try EQL(10, str.find("!!"));  // 👉 10  ("!!")
//         }

//         test "docs: rfind" {
//             var str = try buffer.initWith("==🌍🌟!!"); defer str.deinit();
//             try EQL(1, str.rfind('='));    // 👉 1   ("=")
//             try EQL(2, str.rfind("🌍"));   // 👉 2   (beg of "🌍")
//             try EQL(6, str.rfind("🌟"));   // 👉 6   (beg of "🌟")
//             try EQL(10, str.rfind("!!"));  // 👉 10  ("!!")
//         }

//         test "docs: toLower" {
//             var str = try buffer.initWith("HELLO 🌍!"); defer str.deinit();
//             str.toLower();    // 👉 "hello 🌍!"
//             try EQLS("hello 🌍!", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: toUpper" {
//             var str = try buffer.initWith("hello 🌍!"); defer str.deinit();
//             str.toUpper();    // 👉 "HELLO 🌍!"
//             try EQLS("HELLO 🌍!", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: toTitle" {
//             var str = try buffer.initWith("hello 🌍!"); defer str.deinit();
//             str.toTitle();    // 👉 "Hello 🌍!"
//             try EQLS("Hello 🌍!", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: eql" {
//             var str = try buffer.initWith("=🌍🌟!"); defer str.deinit();
//             try EQL(false, str.eql(""));
//             try EQL(false, str.eql("====="));
//             try EQL(true, str.eql("=🌍🌟!"));
//         }

//         test "docs: startsWith" {
//             var str = try buffer.initWith("=🌍🌟!"); defer str.deinit();
//             try EQL(false, str.startsWith(""));
//             try EQL(false, str.startsWith("🌍"));
//             try EQL(true, str.startsWith('='));
//         }

//         test "docs: endsWith" {
//             var str = try buffer.initWith("=🌍🌟!"); defer str.deinit();
//             try EQL(false, str.endsWith(""));
//             try EQL(false, str.endsWith("🌍"));
//             try EQL(true, str.endsWith('!'));
//         }

//         test "docs: startsWith Empty" {
//             var str = try buffer.initWith(""); defer str.deinit();
//             try EQL(false, str.startsWith('='));
//             try EQL(false, str.startsWith("🌍"));
//             try EQL(true, str.startsWith(""));
//         }

//         test "docs: endsWith Empty" {
//             var str = try buffer.initWith(""); defer str.deinit();
//             try EQL(false, str.endsWith('!'));
//             try EQL(false, str.endsWith("🌍"));
//             try EQL(true, str.endsWith(""));
//         }


//         test "docs: includes" {
//             var str = try buffer.initWith("=🌍🌟!"); defer str.deinit();
//             try EQL(true, str.includes('='));
//             try EQL(true, str.includes("🌍"));
//             try EQL(true, str.includes("🌟"));
//             try EQL(true, str.includes("!"));
//             try EQL(false, str.includes('@'));
//         }

//         test "docs: replace" {
//             var str = try buffer.initWith("==🌍🌍🌟!!"); defer str.deinit();

//             // replace character.
//             try EQL(1, try str.replace('=', '@', 1));    // 👉 (res = 1), "@=🌍🌍🌟!!"
//             try EQLS("@=🌍🌍🌟!!", str.m_buff[0..str.m_bytes]);

//             // replace unicode.
//             try EQL(8, try str.replace("🌍", '!', 2));   // 👉 (res = 1), "@=!!🌟!!"
//             try EQLS("@=!!🌟!!", str.m_buff[0..str.m_bytes]);

//             // replace string.
//             try EQL(4, try str.replace("🌟", '!', 1));    // 👉 (res = 1), "@=!!!!!"
//             try EQLS("@=!!!!!", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: rreplace" {
//             var str = try buffer.initWith("==🌍🌍🌟!!"); defer str.deinit();

//             // replace character.
//             try EQL(1, str.rreplace('=', '@', 1));    // 👉 (res = 1), "=@🌍🌍🌟!!"
//             try EQLS("=@🌍🌍🌟!!", str.m_buff[0..str.m_bytes]);

//             // replace unicode.
//             try EQL(8, str.rreplace("🌍", '!', 2));   // 👉 (res = 1), "=@!!🌟!!"
//             try EQLS("=@!!🌟!!", str.m_buff[0..str.m_bytes]);

//             // replace string.
//             try EQL(4, str.rreplace("🌟", '!', 1));    // 👉 (res = 1), "=@!!!!!"
//             try EQLS("=@!!!!!", str.m_buff[0..str.m_bytes]);
//         }

//          test "docs: repeat" {
//             var str = buffer.init(); defer str.deinit();

//             // repeat character.
//             try str.repeat('0', 1); // 👉 "0"
//             try EQL(1, str.bytes());
//             try EQL(4, str.size());
//             try EQLS("0", str.m_buff[0..str.m_bytes]);

//             try str.repeat('0', 2); // 👉 "000"
//             try EQLS("000", str.m_buff[0..str.m_bytes]);

//             // repeat string.
//             try str.repeat("@#", 2); // 👉 "000@#@#"
//             try EQLS("000@#@#", str.m_buff[0..str.m_bytes]);

//             // repeat unicode.
//             try str.repeat("🌍", 2); // 👉 "000@#@#🌍🌍"
//             try EQLS("000@#@#🌍🌍", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: reverse" {
//             var str = try buffer.initWith("=🌍🌟!"); defer str.deinit();

//             str.reverse(); // 👉 "!🌟🌍="
//             try EQLS("!🌟🌍=", str.m_buff[0..str.m_bytes]);
//         }

//         test "docs: split" {
//             var str = try buffer.initWith("🌍1🌍🌍2🌍🌍3🌍");
//             defer str.deinit();

//             try EQLS(str.split("🌍", 0).?,  ""); // 👉 ""
//             try EQLS(str.split("🌍", 1).?, "1"); // 👉 "1"
//             try EQLS(str.split("🌍", 2).?,  ""); // 👉 ""
//             try EQLS(str.split("🌍", 3).?, "2"); // 👉 "2"
//             try EQLS(str.split("🌍", 5).?, "3"); // 👉 "3"
//             try EQLS(str.split("🌍", 6).?,  ""); // 👉 ""
//         }

//         test "docs: split using character" {
//             var str = try buffer.initWith(",1,,2,,3,");
//             defer str.deinit();

//             try EQLS(str.split(',', 0).?,  ""); // 👉 ""
//             try EQLS(str.split(',', 1).?, "1"); // 👉 "1"
//             try EQLS(str.split(',', 2).?,  ""); // 👉 ""
//             try EQLS(str.split(',', 3).?, "2"); // 👉 "2"
//             try EQLS(str.split(',', 5).?, "3"); // 👉 "3"
//             try EQLS(str.split(',', 6).?,  ""); // 👉 ""
//         }

//         test "docs: splitAll using character" {
//             var str = try buffer.initWith(",1,,2,,3,");
//             defer str.deinit();

//             const res = try str.splitAll(',');

//             try EQL(7, res.len);
//             try EQLS("", res[0]);
//             try EQLS("1", res[1]);
//             try EQLS("", res[2]);
//             try EQLS("2", res[3]);
//             try EQLS("", res[4]);
//             try EQLS("3", res[5]);
//             try EQLS("", res[6]);
//         }

//         test "docs: splitToString using character" {
//             var str = try buffer.initWith(",1,,2,,3,");
//             defer str.deinit();

//             if(try str.splitToString(',', 0)) |res| { try EQLS("", str.m_buff[0..str.m_bytes]); }
//             if(try str.splitToString(',', 1)) |res| { try EQLS("1", str.m_buff[0..str.m_bytes]); }
//             if(try str.splitToString(',', 2)) |res| { try EQLS("", str.m_buff[0..str.m_bytes]); }
//             if(try str.splitToString(',', 3)) |res| { try EQLS("2", str.m_buff[0..str.m_bytes]); }
//             if(try str.splitToString(',', 5)) |res| { try EQLS("3", str.m_buff[0..str.m_bytes]); }
//             if(try str.splitToString(',', 6)) |res| { try EQLS("", str.m_buff[0..str.m_bytes]); }
//         }

//         test "docs: splitAllToStrings using character" {
//             var str = try buffer.initWith(",1,,2,,3,");
//             defer str.deinit();

//             const res = try str.splitAllToStrings(',');
//             try EQL(7, res.len);
//             try EQLS("", res[0].src());
//             try EQLS("1", res[1].src());
//             try EQLS("", res[2].src());
//             try EQLS("2", res[3].src());
//             try EQLS("", res[4].src());
//             try EQLS("3", res[5].src());
//             try EQLS("", res[6].src());
//         }

//         test "docs: lines" {
//             var str = try buffer.initWith("\n1\n\n2\n\n3\n");
//             defer str.deinit();

//             const res = try str.lines();
//             try EQL(7, res.len);
//             try EQLS("", res[0].src());
//             try EQLS("1", res[1].src());
//             try EQLS("", res[2].src());
//             try EQLS("2", res[3].src());
//             try EQLS("", res[4].src());
//             try EQLS("3", res[5].src());
//         }

//     // └──────────────────────────────────────────────────────────────┘

// // ╚══════════════════════════════════════════════════════════════════════════════════╝