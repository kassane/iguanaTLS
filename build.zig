const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const optimize = b.standardOptimizeOption(.{});
    _ = b.addModule("iguanaTLS", .{
        .source_file = .{ .path = "src/main.zig" },
    });
    var main_tests = b.addTest(.{
        .root_source_file = .{ .path = "src/main.zig" },
        .optimize = optimize,
    });
    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
