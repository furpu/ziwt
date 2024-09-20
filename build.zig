const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    _ = b.addModule("jwt", .{
        .root_source_file = b.path("src/jwt.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Tests
    const exe_unit_tests = b.addTest(.{
        .root_source_file = b.path("src/jwt.zig"),
        .target = target,
        .optimize = optimize,
    });

    const run_exe_unit_tests = b.addRunArtifact(exe_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_exe_unit_tests.step);
}
