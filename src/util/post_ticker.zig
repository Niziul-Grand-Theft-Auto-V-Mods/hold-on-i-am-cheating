const std = @import("std");
const w = std.os.windows;

const ScriptHookZig = @import("ScriptHookZig");
const Hook = ScriptHookZig.Hook;
const Types = ScriptHookZig.Types;
const Joaat = ScriptHookZig.Joaat;

const Natives = @import("../natives.zig");

pub fn postTicker(
    message: [*c]const u8,
    isImportant: bool,
    cacheMessage: bool,
) !void {
    const hud = Natives.Hud;

    try hud.beginTextCommandThefeedPost("CELL_EMAIL_BCON");
    try hud.addTextComponentSubstringPlayerName(message);
    _ = try hud.endTextCommandThefeedPostTickerForced(
        @as(w.BOOL, @intFromBool(isImportant)),
        @as(w.BOOL, @intFromBool(cacheMessage)),
    );
}

pub fn postTickerWithTokens(
    message: [*c]const u8,
    isImportant: bool,
    cacheMessage: bool,
) !void {
    const hud = Natives.Hud;

    try hud.beginTextCommandThefeedPost("CELL_EMAIL_BCON");
    try hud.addTextComponentSubstringPlayerName(message);
    _ = try hud.endTextCommandThefeedPostTickerWithTokens(
        @as(w.BOOL, @intFromBool(isImportant)),
        @as(w.BOOL, @intFromBool(cacheMessage)),
    );
}
