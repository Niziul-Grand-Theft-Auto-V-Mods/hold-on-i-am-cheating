const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{
        .default_target = .{
            .cpu_arch = .x86_64,
            .os_tag = .windows,
            .abi = .msvc,
        },
    });
    const optimize = b.standardOptimizeOption(.{
        .preferred_optimize_mode = .ReleaseFast,
    });
    const script_hook_v = b.dependency(
        "ScriptHookZig",
        .{
            .target = target,
            .optimize = optimize,
        },
    );
    const mod = b.addModule("Hold-on-i-am-cheating-v", .{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
        .pic = true,
        .strip = true,
        .imports = &.{
            .{
                .name = "ScriptHookZig",
                .module = script_hook_v.module("ScriptHookZig"),
            },
        },
    });

    const lib = b.addLibrary(.{
        .name = "Hold-on-i-am-cheating-v",
        .linkage = .dynamic,
        .root_module = mod,
    });

    b.installArtifact(lib);

    // const mod_tests = b.addTest(.{
    //     .root_module = mod,
    // });
    //
    // const run_mod_tests = b.addRunArtifact(mod_tests);
    //
    // const test_step = b.step("test", "Run tests");
    // test_step.dependOn(&run_mod_tests.step);
}
