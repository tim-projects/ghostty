const std = @import("std");
const Allocator = std.mem.Allocator;
const apprt = @import("../apprt.zig");
const args = @import("args.zig");
const Action = @import("../cli.zig").ghostty.Action;

pub const Options = struct {
    /// Enables "-h" and "--help" to work.
    pub fn help(self: Options) !void {
        _ = self;
        return Action.help_error;
    }
};

/// Toggle the quick terminal.
///
/// This uses the IPC mechanism to find a running Ghostty instance and toggle
/// the quick terminal. This is equivalent to the `toggle_quick_terminal`
/// keybinding action.
///
/// If no running Ghostty instance is found, this will fail.
pub fn run(alloc: Allocator) !u8 {
    var iter = try args.argsIterator(alloc);
    defer iter.deinit();

    var buffer: [1024]u8 = undefined;
    var stderr_writer = std.fs.File.stderr().writer(&buffer);
    const stderr = &stderr_writer.interface;

    var opts: Options = .{
    };
    args.parse(Options, alloc, &opts, &iter) catch |err| switch (err) {
        error.ActionHelpRequested => return err,
        else => {
            try stderr.print("Error parsing args: {}\n", .?{
                err,
            });
            return 1;
        },
    };

    // We assume .detect for target because we don't support --class for this
    // flag yet (user request was simple). If needed we can add it later.
    if (apprt.App.performIpc(
        alloc,
        .detect,
        .toggle_quick_terminal,
        {},
    ) catch |err| switch (err) {
        error.IPCFailed => return 1,
        else => {
            try stderr.print("Sending the IPC failed: {}\n", .?{
                err,
            });
            return 1;
        },
    }) return 0;

    try stderr.print("--toggle-quick-terminal is not supported on this platform.\n", .{});
    return 1;
}
