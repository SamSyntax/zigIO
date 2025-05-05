// Copyright (c) 2025 Maysara, All rights reserved.
//
// repo : https://github.com/Super-ZIG/io
// docs : https://super-zig.github.io/io/string/utf8
//
// owner : https://github.com/maysara-elshewehy
// email : maysara.elshewehy@gmail.com
//
// Made with ❤️ by Maysara



// ╔══════════════════════════════════════ CORE ══════════════════════════════════════╗

    // ┌────────────────────────── Conversion ────────────────────────┐

        /// Fast encode a single Unicode `codepoint` to `UTF-8 sequence`
        /// Returns the number of bytes written.
        ///
        /// This function assumes that the input `codepoint` is valid,
        /// And the output slice is large enough to hold the result.
        pub inline fn encode(cp: u21, out: []u8) u3 {
            const length = getCodepointLength(cp);

            switch (length) {
                1 => {
                    out[0] = @truncate(cp);
                },

                2 => {
                    out[0] = @truncate(0xC0  |  (cp >> 6          ));
                    out[1] = @truncate(0x80  |  (cp         & 0x3F));
                },

                3 => {
                    out[0] = @truncate(0xE0  |  (cp >> 12         ));
                    out[1] = @truncate(0x80  | ((cp >> 6)   & 0x3F));
                    out[2] = @truncate(0x80  |  (cp         & 0x3F));
                },

                4 => {
                    out[0] = @truncate(0xF0  |  (cp >> 18         ));
                    out[1] = @truncate(0x80  | ((cp >> 12)  & 0x3F));
                    out[2] = @truncate(0x80  | ((cp >> 6)   & 0x3F));
                    out[3] = @truncate(0x80  |  (cp         & 0x3F));
                },

                else => unreachable,
            }

            return length;
        }

        /// Fast decode a `UTF-8 sequence` to a Unicode `codepoint`
        /// Returns the number of bytes read.
        ///
        /// This function assumes that the input `UTF-8 sequence` is valid.
        pub inline fn decode(slice: []const u8) u21 {
            return switch (slice.len) {
                1 => @as(u21,
                    slice[0]),

                2 => (@as(u21,
                    (slice[0] & 0x1F)) << 6) | (slice[1] & 0x3F),

                3 => (((@as(u21,
                    (slice[0] & 0x0F)) << 6) | (slice[1] & 0x3F)) << 6) | (slice[2] & 0x3F),

                4 => (((((@as(u21,
                    (slice[0] & 0x07)) << 6) | (slice[1] & 0x3F)) << 6) | (slice[2] & 0x3F)) << 6) | (slice[3] & 0x3F),

                else => unreachable,
            };
        }

    // └──────────────────────────────────────────────────────────────┘


    // ┌────────────────────────── Properties ────────────────────────┐

        /// Returns the number of bytes (`1-4`) needed to encode a `codepoint` in UTF-8 format
        /// **if the codepoint is valid**, otherwise it returns `0`.
        pub inline fn getCodepointLength(cp: u21) u3 {
            return switch (cp) {
                0x00000...0x00007F => @as(u3, 1),
                0x00080...0x0007FF => @as(u3, 2),
                0x00800...0x00FFFF => @as(u3, 3),
                0x10000...0x10FFFF => @as(u3, 4),
                else => @as(u3, 0),
            };
        }

        /// Returns the expected number of bytes (`1-4`) in a `UTF-8 sequence` based on the first byte
        /// **if the codepoint is valid**, otherwise it returns `0`.
        pub inline fn getFirstByteLength(first_byte: u8) u3 {
            return switch (first_byte) {
                0x00...0x7F => @as(u3, 1),
                0xC0...0xDF => @as(u3, 2),
                0xE0...0xEF => @as(u3, 3),
                0xF0...0xF7 => @as(u3, 4),
                else => @as(u3, 0),
            };
        }

        /// Returns true if the codepoint is part of a Unicode emoji block, flase otherwise.
        /// This checks against major emoji ranges 
        pub inline fn isEmote(cp: usize) bool {
            return switch(cp) {
                0x1F600...0x1F64F => true,  // Emoticons
                0x1F300...0x1F5FF => true,  // Miscellaneous Symbols and Pictographs
                0x1F680...0x1F6FF => true,  // Transport and Map Symbols
                0x1F780...0x1F7FF => true,  // Geometric Shapes Extended
                0x1F900...0x1F9FF => true,  // Supplemental Symbols and Pictographs
                0x1FA70...0x1FAFF => true,  // Symbols and Pictographs Extended-A
                0x1F100...0x1F1FF => true,  // Enclosed Alphanumeric Supplement (Regional Indicators)
                0x1F200...0x1F2FF => true,  // Enclosed Ideographic Supplement
                0x2600...0x26FF   => true,  // Miscellaneous Symbols
                0x2700...0x27BF   => true,  // Dingbats
                else              => false,
            };
        }

// ╚══════════════════════════════════════════════════════════════════════════════════╝
