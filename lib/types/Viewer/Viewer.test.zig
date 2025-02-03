// ╔══════════════════════════════════════ INIT ══════════════════════════════════════╗

    const std = @import("std");
    const Unicode = @import("../../utils/Unicode/Unicode.zig");
    const Viewer = @import("./Viewer.zig").Viewer;

    const expect = std.testing.expect;
    const expectEqual = std.testing.expectEqual;
    const expectError = std.testing.expectError;
    const expectStrings = std.testing.expectEqualStrings;

// ╚══════════════════════════════════════════════════════════════════════════════════╝



// ╔══════════════════════════════════════ TEST ══════════════════════════════════════╗

    // ┌─────────────────────── Initialization ───────────────────────┐

        test "initialization" {
            // empty input
            const emptyUtf8: []const u8 = "";
            try expectError(error.ZeroSize, Viewer.init(emptyUtf8));

            // non empty input (valid unicode)
            const validUtf8: []const u8 = "Hello, 世界!";
            const buffer = try Viewer.init(validUtf8);
            try expectStrings(validUtf8, buffer.m_source[0..]);

            // non empty input (invalid unicode)
            // try expectError(unreachable, Viewer.init(&[_]u8{0x80, 0x81, 0x82}));
        }

    // └──────────────────────────────────────────────────────────────┘


    // ┌────────────────────────── Iterator ──────────────────────────┐

        test "iterator" {
            const validUtf8: []const u8 = "Hello, 世界!";
            const viewer = try Viewer.init(validUtf8);
            var iter = try viewer.iterator();

            while(iter.nextSlice()) |slice| {
                try expect(Unicode.utils.Utf8Validate(slice));
            }
        }

    // └──────────────────────────────────────────────────────────────┘


    // ┌──────────────────────────── Find ────────────────────────────┐

        test "Viewer.find" {
            const viewer = try Viewer.init("Hello 👨‍🏭!");
            const Cases = struct { value : []const u8 = undefined, expected  :? usize = null, };
            const cases = &[_]Cases{
                .{ .value  = "H", .expected = 0 },
                .{ .value  = "e", .expected = 1 },
                .{ .value  = "l", .expected = 2 },
                .{ .value  = "o", .expected = 4 },
                .{ .value  = " ", .expected = 5 },
                .{ .value  = "👨‍🏭", .expected = 6 },
                .{ .value  = "!", .expected = 17 },
                .{ .value  = "@", .expected = null },
            };

            for(cases) |c| {
                try expectEqual(c.expected, viewer.find(c.value));
            }
        }

        test "Viewer.findVisual" {
            const viewer = try Viewer.init("Hello 👨‍🏭!");
            const Cases = struct { value : []const u8 = undefined, expected :? usize = null, };
            const cases = &[_]Cases{
                .{ .value  = "H", .expected = 0 },
                .{ .value  = "e", .expected = 1 },
                .{ .value  = "l", .expected = 2 },
                .{ .value  = "o", .expected = 4 },
                .{ .value  = " ", .expected = 5 },
                .{ .value  = "👨‍🏭", .expected = 6 },
                .{ .value  = "!", .expected = 7 },
                .{ .value  = "@", .expected = null },
            };

            for(cases) |c| {
                try expectEqual(c.expected, viewer.findVisual(c.value));
            }
        }

        test "Viewer.rfind" {
            const viewer = try Viewer.init("Hello 👨‍🏭!");
            const Cases = struct { value : []const u8 = undefined, expected :? usize = null, };
            const cases = &[_]Cases{
                .{ .value  = "H", .expected = 0 },
                .{ .value  = "e", .expected = 1 },
                .{ .value  = "l", .expected = 3 },
                .{ .value  = "o", .expected = 4 },
                .{ .value  = " ", .expected = 5 },
                .{ .value  = "👨‍🏭", .expected = 6 },
                .{ .value  = "!", .expected = 17},
                .{ .value  = "@", .expected = null },
            };

            for(cases) |c| {
                try expectEqual(c.expected, viewer.rfind(c.value));
            }
        }

        test "Viewer.rfindVisual" {
            const viewer = try Viewer.init("Hello 👨‍🏭!");
            const Cases = struct { value  : []const u8 = undefined, expected  :? usize = null, };
            const cases = &[_]Cases{
                .{ .value  = "H", .expected = 0 },
                .{ .value  = "e", .expected = 1 },
                .{ .value  = "l", .expected = 3 },
                .{ .value  = "o", .expected = 4 },
                .{ .value  = " ", .expected = 5 },
                .{ .value  = "👨‍🏭", .expected = 6 },
                .{ .value  = "!", .expected = 7},
                .{ .value  = "@", .expected = null },
            };

            for(cases) |c| {
                try expectEqual(c.expected, viewer.rfindVisual(c.value));
            }
        }

        test "Viewer.includes" {
            const viewer = try Viewer.init("Hello 👨‍🏭!");
            try expect(viewer.includes("H"));
            try expect(viewer.includes("e"));
            try expect(viewer.includes("l"));
            try expect(viewer.includes("o"));
            try expect(viewer.includes(" "));
            try expect(viewer.includes("👨‍🏭"));
            try expect(viewer.includes("!"));
            try expect(!viewer.includes("@"));
        }

        test "Viewer.startsWith" {
            const viewer = try Viewer.init("Hello 👨‍🏭!");
            try expect(viewer.startsWith("H"));
            try expect(!viewer.startsWith("👨‍🏭"));
        }

        test "Viewer.endsWith" {
            const viewer = try Viewer.init("Hello 👨‍🏭!");
            try expect(viewer.endsWith("!"));
            try expect(!viewer.endsWith("👨‍🏭"));
        }

    // └──────────────────────────────────────────────────────────────┘


    // ┌───────────────────────────── DATA ───────────────────────────┐

        test "slice" {
            const txt = &[_]u8{ '1', 0, 0 };
            const viewer = try Viewer.init(txt);
            try expectStrings("1", viewer.slice());
        }

        test "length" {
            const viewer = try Viewer.init("Hello 👨‍🏭!");
            try expectEqual(18, viewer.length());
        }

        test "vlength" {
            const viewer = try Viewer.init("Hello 👨‍🏭!");
            try expectEqual(8, viewer.vlength());
        }

    // └──────────────────────────────────────────────────────────────┘


    // ┌──────────────────────────── Utils ───────────────────────────┐

        test "split" {
            const viewer = try Viewer.init("0👨‍🏭11👨‍🏭2👨‍🏭33");

            // Test basic splits
            try expectStrings("0", viewer.split("👨‍🏭", 0).?);
            try expectStrings("11", viewer.split("👨‍🏭", 1).?);
            try expectStrings("2", viewer.split("👨‍🏭", 2).?);
            try expectStrings("33", viewer.split("👨‍🏭", 3).?);

            // Test out-of-bounds indices
            try expect(viewer.split("👨‍🏭", 4) == null);

            // // Test empty input
            // var viewer2 = try Viewer.init("0");
            // try viewer2.remove(0);
            // try expectStrings("", viewer2.split("👨‍🏭", 0).?);

            // Test non-existent delimiter
            try expectStrings(viewer.slice(), viewer.split("X", 0).?);
        }

        test "splitAll edge cases" {
            const allocator = std.testing.allocator;

            // Leading/trailing delimiters
            const viewer = try Viewer.init("👨‍🏭a👨‍🏭b👨‍🏭");
            const parts2 = try viewer.splitAll(allocator, "👨‍🏭", true);
            defer allocator.free(parts2);
            try expectStrings("", parts2[0]);
            try expectStrings("a", parts2[1]);
            try expectStrings("b", parts2[2]);
            try expectStrings("", parts2[3]);

            // Test with include_empty = false
            const parts3 = try viewer.splitAll(allocator, "👨‍🏭", false);
            defer allocator.free(parts3);
            try expectStrings("a", parts3[0]);
            try expectStrings("b", parts3[1]);
        }

    // └──────────────────────────────────────────────────────────────┘

// ╚══════════════════════════════════════════════════════════════════════════════════╝