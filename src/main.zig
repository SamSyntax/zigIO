// ╔══════════════════════════════════════ INIT ══════════════════════════════════════╗

    const utils = .{ .chars=@import("./utils/chars/src.zig") };
    const types = .{ .string=@import("./types/string/src.zig").string, .buffer=@import("./types/buffer/src.zig").buffer };

// ╚══════════════════════════════════════════════════════════════════════════════════╝


// ╔══════════════════════════════════════ TEST ══════════════════════════════════════╗

    test "all" {
        _ = @import("./utils/chars/test.zig");  // 👉 io.utils.chars
        _ = @import("./types/string/test.zig"); // 👉 io.types.string
        _ = @import("./types/buffer/test.zig"); // 👉 io.types.buffer
    }

// ╚══════════════════════════════════════════════════════════════════════════════════╝