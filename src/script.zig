const std = @import("std");
const w = std.os.windows;

const ScriptHookZig = @import("ScriptHookZig");
const Hook = ScriptHookZig.Hook;
const Types = ScriptHookZig.Types;
const Joaat = ScriptHookZig.Joaat;

const Natives = @import("natives.zig");
const notification = @import("util/post_ticker.zig");
const postTickerWithTokens = notification.postTickerWithTokens;

pub fn scriptMain() callconv(.c) void {
    main() catch |err| {
        _ = err catch {};
    };
}

fn main() Hook.Error!void {
    var b_welcome = false;
    var b_slowMotion = false;

    while (true) {

        // const player = try Natives.Player.playerId();
        // const playerPed = try Natives.Player.playerPedId();
        //
        // if (try Natives.Dlc.getIsLoadingScreenActive() == w.TRUE or
        //     try Natives.Entity.doesEntityExist(playerPed) == w.FALSE or
        //     try Natives.Player.isPlayerControlOn(player) == w.FALSE or
        //     try Natives.Ped.isPedFatallyInjured(playerPed) == w.TRUE or
        //     try Natives.Player.isPlayerBeingArrested(player, w.TRUE) == w.TRUE)
        // {
        //     return;
        // }

        if (!b_welcome) {
            try postTickerWithTokens(
                "hold on i am cheating v - by ~b~niziul~w~",
                true,
                true,
            );
            b_welcome = true;
        }

        if (try Natives.Dlc.getIsLoadingScreenActive() == w.FALSE) {
            const onScreenKeyboardStatusCode: enum(c_int) {
                NOT_ACTIVE = -1,
                STILL_EDITING = 0,
                FINISHED_EDITING = 1,
                CANCELED_EDITING = 2,
                _,
            } = @enumFromInt(try Natives.Misc.updateOnscreenKeyboard());

            switch (onScreenKeyboardStatusCode) {
                .NOT_ACTIVE,
                .FINISHED_EDITING,
                .CANCELED_EDITING,
                => {
                    if (b_slowMotion) {
                        try Natives.Misc.setTimeScale(1);
                        b_slowMotion = false;
                    }
                    // try postTickerWithTokens(
                    //     "OnScreenKeyboard: ~r~active~w~",
                    //     true,
                    //     true,
                    // );
                },
                .STILL_EDITING => {
                    if (!b_slowMotion) {
                        try Natives.Misc.setTimeScale(0);
                        b_slowMotion = true;
                    }
                    // try postTickerWithTokens(
                    //     "OnScreenKeyboard: ~b~active~w~",
                    //     true,
                    //     true,
                    // );
                },
                else => unreachable,
            }
        }

        try Hook.wait(100);
    }
}
